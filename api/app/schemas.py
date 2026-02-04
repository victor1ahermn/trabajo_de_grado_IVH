"""
Esquemas Pydantic para Validación de Datos

Define los modelos de solicitud y respuesta para la API tanto para 
el análisis de respuestas de estudiantes como para la generación de retroalimentación.
"""

from __future__ import annotations
from typing import List, Optional, Literal, Dict, Any
from pydantic import BaseModel, Field

# etiquetas
MLLabel = Literal["OK", "DEFICIENT_RESPONSE"]
RuleLabel = Literal["OK", "INCORRECT_ABSTRACTION"]

Category = Literal["PURPOSE", "INTERACTIONS", "COMPONENTS", "VARIABLES", "CONSTANTS"]


# request 
class AnalyzeRequest(BaseModel):
    system_name: str = Field(..., min_length=1, description="System identifier/name, e.g., BIBLIOTECA")

    purpose_text: str = Field("", description="Student text for PURPOSE")
    components_text: str = Field("", description="Student text for COMPONENTS")
    interactions_text: str = Field("", description="Student text for INTERACTIONS")
    variables_text: str = Field("", description="Student text for VARIABLES")
    constants_text: str = Field("", description="Student text for CONSTANTS")


# response 
class MLResult(BaseModel):
    predicted: MLLabel


class MatchInfo(BaseModel):
    type: Literal["exact", "fuzzy"]  
    score: Optional[int] = None     # solo para fuzzy
    matched_item: Optional[str] = None


class RuleItemResult(BaseModel):
    item_original: str
    item_normalized: str
    predicted: RuleLabel
    suberror: Optional[str] = None
    match: Optional[MatchInfo] = None
    extra: Optional[Dict[str, Any]] = None 


class RulesSectionResult(BaseModel):
    items: List[RuleItemResult] = Field(default_factory=list)


class AnalyzeResponse(BaseModel):
    system_name: str

    ml: Dict[Literal["purpose", "interactions"], MLResult]

    rules: Dict[Literal["components", "variables", "constants"], RulesSectionResult]

class FeedbackErrorIn(BaseModel):
    error_id: int
    category_name: str
    error_type: str
    suberror_code: Optional[str] = None
    student_value: str

class FeedbackRequest(BaseModel):
    response_id: int
    system_code: str
    errors: List[FeedbackErrorIn]

class FeedbackItemOut(BaseModel):
    error_id: int
    feedback_text: str

class FeedbackResponse(BaseModel):
    response_id: int
    system_code: str
    feedback: List[FeedbackItemOut]