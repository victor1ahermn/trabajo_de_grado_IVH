"""
Modulo Normalización y Tokenización

Este módulo prepara las secciones de componentes, variables y constantes 
eliminando tildes, artículos (stopwords) y otras puntuaciones.
Tokenización del texto para extraer elementos individuales y poder clasificarlos.
"""

from __future__ import annotations

import re
import unicodedata
from typing import List


STOPWORDS_ES = {
    "el", "la", "los", "las", "un", "una", "unos", "unas",
    "de", "del", "al", "y", "e", "para", "por"
}


def strip_accents(text: str) -> str:
    """ Quita tildes y diacríticos"""
    
    return "".join(
        ch for ch in unicodedata.normalize("NFKD", text)
        if not unicodedata.combining(ch)
    )


def normalize_item(text: str) -> str:
    """
    Normaliza un ítem: pone todo en minúsculas, quita puntuación, espacios y artículos (stopwords) 
    """
    
    t = text.strip().lower()
    t = strip_accents(t)
    t = re.sub(r"[^a-z0-9\s]", " ", t) 
    t = re.sub(r"\s+", " ", t).strip()

    if not t:
        return ""
    
    parts = [p for p in t.split() if p not in STOPWORDS_ES]
    t2 = " ".join(parts).strip()
    return t2


def split_items(block_text: str) -> List[str]:
    """
    Separa los items utilizando delimitadores comunes.
    """
    if not block_text:
        return []

    t = block_text.replace("•", "\n").replace("·", "\n").replace("●", "\n")
    
    raw = re.split(r"[\n,;]+", t)

    items: List[str] = []
    for r in raw:
        r = r.strip()
        if not r:
            continue
        r = re.sub(r"^\s*[-*]\s+", "", r).strip()
        if r:
            items.append(r)

    return items


def tokenize_and_normalize(block_text: str) -> List[dict]:
    """
    Devuelve lista de items tokenizados y normalizados, filtrando ítems vacíos o irrelevantes.
    """
    results = []
    for it in split_items(block_text):
        norm = normalize_item(it)
        if not norm:
            continue
        if len(norm) < 2:
            continue
        results.append({"item_original": it, "item_normalized": norm})
    return results
