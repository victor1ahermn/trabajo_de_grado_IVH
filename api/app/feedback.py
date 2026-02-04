"""
Endpoint para generar la retroalimentación dependiendo del tipo de error que se identificó.
Construye un prompt con el contexto pedagógico y el error y llama a la API de OpenAI para generar 
el feedback específico para cada error.
"""

from fastapi import APIRouter, HTTPException
from typing import Any, Dict, List
import json

from openai import OpenAI

from app.config import OPENAI_API_KEY, OPENAI_MODEL
from app.schemas import FeedbackRequest, FeedbackResponse, FeedbackItemOut

router = APIRouter(tags=["feedback"])
  
STATIC_CONTEXT = """
Eres un tutor pedagógico experto en fundamentos de ingeniería de sistemas. 
Estás trabajando con estudiantes que están en un curso introductoria de programación.
Se les ha asignado una tarea con el fin de que empiecen a adquirir la habilidad de abstraer sistemas correctamente.
Tu objetivo es generar retroalimentación corta y accionable para UNA respuesta de estudiante, pero SOLO sobre UN error puntual.

Te van a llegar 2 tipos de errores:
- Respuestas deficientes: respuestas que son ambiguas o que con muy poco detalle. El estudiante pudo haber explicado mejor. 
    - Tu tarea: Instruir al estudiante en cómo puede ampliar su respuesta y proporcionar una mejor
- Abstracciones incorectas: el estudiante está abstrayendo de manera errónea el sistema. Estos errores traen un suberror
que explica específicamente en qué falla: clasifica componentes como varibles o constantes, confunde una variable con una constante, etc.
    - Tu tarea: explicarle en qué falla y cómo pensar en el sistema para que abstraiga correctamente.
 
Alcance correcto de la tarea:
- Analiza UNA INSTANCIA del sistema (ej. una biblioteca).
- Para clasificar VARIABLES y CONSTANTS, razona también por INSTANCIA del componente cuando aplique.
  Ejemplo: si “Libro(s)” es un componente, piensa en UN libro:
  - “Autor” puede variar entre libros, pero para el MISMO libro no cambia → es una CONSTANTE LOCAL.
- En general, evita confundir “cambia entre entidades” con “cambia a lo largo del tiempo”.

Qué se espera por sección:
- PURPOSE: objetivo del sistema, para qué existe de forma clara y concreta.
- INTERACTIONS: cómo interactúan los componentes (acciones/relaciones causa-efecto). Usa verbos (ej. registrar, consultar, actualizar, producir).
- COMPONENTS: partes esenciales del sistema (no detalles), y su rol básico.
- VARIABLES: datos que cambian durante la ejecución/instante (variables locales).
- CONSTANTS: datos que NO cambian durante la ejecución/instante (constantes locales), aunque varíen entre entidades o entre ejecuciones.

Estrategia de feedback (debe incluir las 3):
1) Binary: indica que es incorrecto/deficiente SIN REGAÑAR.
2) Error-specific: explica exactamente qué falla respecto a esta sección y este alcance.
3) Solution-oriented: da 1-2 acciones concretas y un mini ejemplo de corrección.

Formato:
- Máx 100 palabras.
- 1 frase (diagnóstico) + 1-2 bullets (cómo mejorar) + 1 mini-ejemplo (1 línea) si aplica.
- Cuando retroalimentes no le des la respuesta (no le digas si es variable, componente, constante, etc.), sino que explícale cómo corregir su error.
""".strip()

OUTPUT_SCHEMA: Dict[str, Any] = {
    "type": "object",
    "additionalProperties": False,
    "properties": {
        "feedback_text": {"type": "string"}
    },
    "required": ["feedback_text"]
}

def build_prompt(
    system_code: str,
    category_name: str,
    error_type: str,
    suberror_code: str | None,
    student_value: str
) -> str:
    sub = suberror_code or "N/A"

    case_context = f"""
Caso (un solo error):
- system_code: {system_code}
- category: {category_name}
- error_type: {error_type}
- suberror_code: {sub}
- student_value: {student_value}

Da retroalimentación SOLO para este error.
""".strip()

    return f"{STATIC_CONTEXT}\n\n{case_context}"


@router.post("/feedback", response_model=FeedbackResponse)
def generate_feedback(payload: FeedbackRequest) -> FeedbackResponse:
    
    if not (OPENAI_API_KEY or "").strip():
        raise HTTPException(status_code=500, detail="OPENAI_API_KEY no está configurada en el servidor")

    model = (OPENAI_MODEL or "").strip() or "gpt-4.1-mini"
    client = OpenAI(api_key=OPENAI_API_KEY)

    results: List[FeedbackItemOut] = []

    for err in payload.errors:
        prompt = build_prompt(
            system_code=payload.system_code,
            category_name=err.category_name,
            error_type=err.error_type,
            suberror_code=err.suberror_code,
            student_value=err.student_value,
        )

        try:
            resp = client.responses.create(
                model=model,
                input=prompt,
                text={
                    "format": {
                        "type": "json_schema",
                        "name": "feedback_schema",
                        "schema": OUTPUT_SCHEMA
                    }
                },
            )
        except Exception as e:
            raise HTTPException(status_code=502, detail=f"Error llamando OpenAI: {str(e)}")

        feedback_text = ""
        try:
            data = json.loads(resp.output_text)
            feedback_text = (data.get("feedback_text") or "").strip()
        except Exception:
            feedback_text = (getattr(resp, "output_text", "") or "").strip()

        if not feedback_text:
            feedback_text = (
                "No pude generar retroalimentación para este error. "
                "Intenta reformular el ítem o agrega más contexto."
            )

        results.append(FeedbackItemOut(error_id=err.error_id, feedback_text=feedback_text))

    return FeedbackResponse(
        response_id=payload.response_id,
        system_code=payload.system_code,
        feedback=results,
    )
