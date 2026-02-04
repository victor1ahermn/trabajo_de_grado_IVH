"""
Clasificación con aprendizaje automático para las secciones de porpósito e interraciones.
"""

from __future__ import annotations

from pathlib import Path
import joblib


class MLService:
    """
    Clasificación basado en aprendizaje automático. Carga el vectorizador y el modelo entrenado 
    una sola vez y predice la calidad de la respuesta del estudiante.
    """

    def __init__(self, artifacts_dir: str | Path):
        self.artifacts_dir = Path(artifacts_dir)
        self.vectorizer = None
        self.model = None

    def load(self) -> None:
        vec_path = self.artifacts_dir / "vectorizer.joblib"
        model_path = self.artifacts_dir / "svm_model.joblib"

        if not vec_path.exists():
            raise FileNotFoundError(f"No existe: {vec_path}")
        if not model_path.exists():
            raise FileNotFoundError(f"No existe: {model_path}")

        self.vectorizer = joblib.load(vec_path)
        self.model = joblib.load(model_path)

    def predict_label(self, category: str, text: str | None) -> str:
        """
        categoría de las secciones: 'PURPOSE' o 'INTERACTIONS'
        predicción: 'OK' o 'DEFICIENT_RESPONSE'
        """
        if self.vectorizer is None or self.model is None:
            raise RuntimeError("MLService no está cargado. Llama load().")

        category = (category or "").strip().upper()
        text = (text or "").strip()
        
        # Cubre 2 casos: si el usuario no envia nada, no generamos error ni feedback.
        # Y para los usuarios con semeste 2020-2, como nunca envían estos bloques, no generan error.
        if not text:
            return "OK"

        # Token de categoría
        if category == "PURPOSE":
            cat_token = "__CAT_PURPOSE__"
        elif category == "INTERACTIONS":
            cat_token = "__CAT_INTERACTIONS__"
        else:
            raise ValueError(f"Categoría inválida para ML: {category}")

        final_text = f"{cat_token} {text}".strip()

        X = self.vectorizer.transform([final_text])
        pred = self.model.predict(X)[0]

        pred = str(pred).strip()
        return "DEFICIENT_RESPONSE" if pred == "DEFICIENT_RESPONSE" else "OK"
