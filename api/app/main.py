"""
Este es el módulo principal de la API para inicializar la aplicación FastAPI
y exponer los endpoints para el análisis de respuestas de estudiantes mediante ML o Reglas,
y la generación de retroalimentación utilizando ChatGPT.
"""

from fastapi import FastAPI
from app.schemas import AnalyzeRequest, AnalyzeResponse
from app.rules import tokenize_and_normalize
from app.ml import MLService
from app.rules_engine import load_referential_base, classify_item
from app.feedback import router as feedback_router # router de feedback (ChatGPT)

app = FastAPI(title="Thesis API")

app.include_router(feedback_router)

ml_service = MLService(artifacts_dir="artifacts")
referential = None 


@app.on_event("startup")
def startup_event():
    global referential
    ml_service.load()
    referential = load_referential_base("data/referential_base.csv")


@app.get("/health")
def health():
    return {"status": "ok"}


@app.post("/analyze", response_model=AnalyzeResponse)
def analyze(payload: AnalyzeRequest):
    """
    Analiza la respuesta del estudiante. Para componentes, variables y constantes hace tokenización y normalización 
    y luego clasifica cada item basándose en las reglas definidas y la base referencial.
    Para propósito e interacciones, utiliza aprendizaje supervisado para hacer predicciones.
    """
    system = payload.system_name.strip().upper()

    # Tokenización
    comp_items = tokenize_and_normalize(payload.components_text)
    var_items = tokenize_and_normalize(payload.variables_text)
    const_items = tokenize_and_normalize(payload.constants_text)

    # ML 
    purpose_pred = ml_service.predict_label("PURPOSE", payload.purpose_text)
    interactions_pred = ml_service.predict_label("INTERACTIONS", payload.interactions_text)

    # Reglas
    def wrap(category: str, items):
        out = []
        for x in items:
            pred, suberror, match = classify_item(
                rb=referential,
                system=system,
                target_category=category,
                item_norm=x["item_normalized"],
                fuzzy_threshold=85
            )

            out.append(
                {
                    "item_original": x["item_original"],
                    "item_normalized": x["item_normalized"],
                    "predicted": pred,
                    "suberror": suberror,
                    "match": None if match is None else {
                        "type": match.match_type,
                        "score": match.score,
                        "matched_item": match.matched_item,
                    },
                    "extra": None if match is None else {
                        "matched_category": match.matched_category
                    }
                }
            )
        return {"items": out}

    return AnalyzeResponse(
        system_name=system,
        ml={
            "purpose": {"predicted": purpose_pred},
            "interactions": {"predicted": interactions_pred},
        },
        rules={
            "components": wrap("COMPONENTS", comp_items),
            "variables": wrap("VARIABLES", var_items),
            "constants": wrap("CONSTANTS", const_items),
        },
    )
