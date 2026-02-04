"""
Configuración de las variables de entorno para la API de OpenAI.
(clave de acceso y el modelo utilizado).
"""

import os

OPENAI_API_KEY = (os.getenv("OPENAI_API_KEY") or "").strip()
OPENAI_MODEL = (os.getenv("OPENAI_MODEL") or "gpt-4.1-mini").strip()
