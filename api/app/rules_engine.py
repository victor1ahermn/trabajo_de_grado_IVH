"""
Módulo de reglas para la clasificación de elementos

Este módulo aplica el sistema de clasificación basado en reglas para validar
componentes, variables y constantes usando la base de datos referencial. Usa
búsqueda exacta y fuzzy matching para detectar los errores de abstracción que cometa
el estudiante.
"""

from __future__ import annotations

from dataclasses import dataclass
from pathlib import Path
from typing import Dict, Set, Tuple, Optional, List
import csv

from rapidfuzz import fuzz


CategoryKey = str  # variables, constants, components


@dataclass
class MatchResult:
    match_type: str           # exact o fuzzy
    score: Optional[int]      # puntaje de fuzzy 
    matched_item: str         # ítem de la base referencial (normalizado) con el que se hizo match
    matched_category: CategoryKey  # categoría donde estaba en la base


class ReferentialBase:
    """
    Estructura en memoria de la base referencial organizada por sistema y categoría:
    ok_items[system][category] = set(item_normalized)
    """
    def __init__(self):
        self.ok_items: Dict[str, Dict[CategoryKey, Set[str]]] = {}

    def ensure_system(self, system: str) -> None:
        if system not in self.ok_items:
            self.ok_items[system] = {
                "COMPONENTS": set(),
                "VARIABLES": set(),
                "CONSTANTS": set(),
            }

    def add_item(self, system: str, category: CategoryKey, item_norm: str) -> None:
        system = system.strip().upper()
        category = category.strip().upper()
        self.ensure_system(system)
        if category in self.ok_items[system]:
            self.ok_items[system][category].add(item_norm)

    def get_sets(self, system: str) -> Dict[CategoryKey, Set[str]]:
        system = system.strip().upper()
        self.ensure_system(system)
        return self.ok_items[system]


def load_referential_base(csv_path: str | Path) -> ReferentialBase:
    """
    Carga la base referencial desde un archivo CSV y construye la estructura
    en memoria con los ítems válidos por sistema y categoría. 
    """
    rb = ReferentialBase()
    csv_path = Path(csv_path)

    if not csv_path.exists():
        raise FileNotFoundError(f"No existe referential_base.csv en: {csv_path}")

    with csv_path.open("r", encoding="utf-8-sig", newline="") as f:
        reader = csv.DictReader(f)
        headers = [h.strip() for h in (reader.fieldnames or [])]

        def pick(*candidates: str) -> str:
            for c in candidates:
                for h in headers:
                    if h.strip().upper().replace(" ", "_") == c:
                        return h
            raise KeyError(f"No se encontró columna. Buscaba una de: {candidates}. Headers: {headers}")

        col_system = pick("SYSTEM_ID", "SYSTEM")
        col_cat = pick("RESPONSE_CATEGORY_ID", "RESPONSE_CATEGORY", "CATEGORY")
        col_item = pick("ITEM_NORMALIZED", "ITEM")
        col_err = pick("ERROR_SUBCATEGORY_ID", "ERROR_SUBCATEGORY", "ERROR")

        for row in reader:
            system = (row.get(col_system) or "").strip().upper()
            category = (row.get(col_cat) or "").strip().upper()
            item_norm = (row.get(col_item) or "").strip()
            err_sub = (row.get(col_err) or "").strip().upper()

            if not system or not category or not item_norm:
                continue

            if err_sub != "OK":
                continue

            if category not in ("COMPONENTS", "VARIABLES", "CONSTANTS"):
                continue

            rb.add_item(system, category, item_norm)

    return rb


def _fuzzy_best_match(item_norm: str, candidates: Set[str], threshold: int) -> Optional[Tuple[str, int]]:
    """
    Devuelve (matched_item, score) si supera umbral, si no None.
    Como se decidió evitar falsos positivos, cuando no encuentra nada similar en la base de referencia 
    (no supera el umbral), devuelve None.
    """
    best_item = None
    best_score = -1

    for cand in candidates:
        score = fuzz.token_set_ratio(item_norm, cand)
        if score > best_score:
            best_score = score
            best_item = cand

    if best_item is not None and best_score >= threshold:
        return best_item, int(best_score)
    return None


def classify_item(
    rb: ReferentialBase,
    system: str,
    target_category: CategoryKey,
    item_norm: str,
    fuzzy_threshold: int = 85
) -> Tuple[str, Optional[str], Optional[MatchResult]]:
    
    """
    Clasifica un item normalizado comparándolo con la base referencial. 
    Si no hace match en ninguna categoría, lo considera OK. (evita falsos positivos).
    Si hace match exacto o difuso en la categoría objetivo, es OK.
    Si hace match en otra categoría, es INCORRECT_ABSTRACTION y le retorna el suberror respectivo.
    """
    system = system.strip().upper()
    target_category = target_category.strip().upper()

    sets = rb.get_sets(system)
    comp_set = sets["COMPONENTS"]
    var_set = sets["VARIABLES"]
    const_set = sets["CONSTANTS"]

    # Exacta
    if item_norm in sets.get(target_category, set()):
        return "OK", None, MatchResult("exact", None, item_norm, target_category)

    # Si hace match en otra categoría tiene error de abstracción
    if item_norm in comp_set:
        if target_category != "COMPONENTS":
            return "INCORRECT_ABSTRACTION", _suberror("COMPONENTS", target_category), MatchResult("exact", None, item_norm, "COMPONENTS")
    if item_norm in var_set:
        if target_category != "VARIABLES":
            return "INCORRECT_ABSTRACTION", _suberror("VARIABLES", target_category), MatchResult("exact", None, item_norm, "VARIABLES")
    if item_norm in const_set:
        if target_category != "CONSTANTS":
            return "INCORRECT_ABSTRACTION", _suberror("CONSTANTS", target_category), MatchResult("exact", None, item_norm, "CONSTANTS")

    # Fuzzy match
    best: Optional[Tuple[str, int, str]] = None  # (matched_item, score, matched_category)

    for cat, cand_set in (("COMPONENTS", comp_set), ("VARIABLES", var_set), ("CONSTANTS", const_set)):
        res = _fuzzy_best_match(item_norm, cand_set, fuzzy_threshold)
        if res is None:
            continue
        matched_item, score = res
        if best is None or score > best[1]:
            best = (matched_item, score, cat)

    if best is None:
        return "OK", None, None

    matched_item, score, matched_category = best
    match_info = MatchResult("fuzzy", score, matched_item, matched_category)

    if matched_category == target_category:
        return "OK", None, match_info

    return "INCORRECT_ABSTRACTION", _suberror(matched_category, target_category), match_info


def _suberror(from_category: str, to_category: str) -> str:
    """
    Hace el mapeo de suberror según las categorías.
    from_category: categoría donde pertenece el item en la base
    to_category: categoría donde el estudiante puso el item en la respuesta
    """
    mapping = {
        ("VARIABLES", "CONSTANTS"): "VARIABLE_AS_CONSTANT",
        ("CONSTANTS", "VARIABLES"): "CONSTANT_AS_VARIABLE",
        ("VARIABLES", "COMPONENTS"): "VARIABLE_AS_COMPONENT",
        ("CONSTANTS", "COMPONENTS"): "CONSTANT_AS_COMPONENT",
        ("COMPONENTS", "VARIABLES"): "COMPONENT_AS_VARIABLE",
        ("COMPONENTS", "CONSTANTS"): "COMPONENT_AS_CONSTANT",
    }
    return mapping.get((from_category, to_category), f"{from_category}_AS_{to_category}")
