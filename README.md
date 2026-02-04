# Reflexa: Prototipo de Sistema de Tutoría Inteligente para Estudiantes de Ingeniería de Sistemas

Este repositorio contiene el prototipo funcional de un sistema de tutoría inteligente orientado a la
identificación de falencias de aprendizaje y a la generación automática de retroalimentación
pedagógica en respuestas textuales de estudiantes de ingeniería de sistemas.

El sistema analiza respuestas en lenguaje natural asociadas a tareas de abstracción de sistemas
(determinar su propósito, interacciones, componentes, variables y constantes), combinando modelos de aprendizaje
automático (SVM), clasificación basada en reglas y técnicas de procesamiento de lenguaje natural.

## Árbol del repositorio

```text
├── api/
│   ├── app/
│   │   ├── config.py
│   │   ├── feedback.py
│   │   ├── main.py
│   │   ├── ml.py
│   │   ├── rules.py
│   │   ├── rules_engine.py
│   │   └── schemas.py
│   ├── artifacts/
│   ├── data/
│   ├── venv/
│   ├── requirements.txt
│   ├── Procfile
│   ├── nixpacks.toml
│   ├── .python-version
│   └── README.md
│
├── oracle_apex/
│   ├── app_export/
│   │   ├── f100/
│   │   └── f100.zip
│   ├── schema/
│   │   ├── APP_USERS.sql
│   │   ├── ASSIGNMENTS.sql
│   │   ├── ERROR_TYPES.sql
│   │   ├── FEEDBACK.sql
│   │   ├── RESPONSE_CATEGORIES.sql
│   │   ├── RESPONSE_ERRORS.sql
│   │   ├── RESPONSES.sql
│   │   └── SYSTEMS.sql
│   ├── ERD_THESIS.png
│   └── README.md
│
├── datasets/
│   ├── primer_dataset.csv
│   ├── segundo_dataset.csv
│   ├── referential_base.csv
│   └── metrics_base.csv
│
├── .gitignore
└── README.md

## 📁 Estructura del repositorio

### `/api`

Contiene la API desarrollada en Python, responsable del análisis de las respuestas de los estudiantes y de la generación de retroalimentación automatizada.

**Subcarpetas y archivos principales:**

- `app/`: código fuente de la API.
  - `main.py`: inicialización de la aplicación FastAPI y definición de endpoints.
  - `ml.py`: servicio de clasificación basado en aprendizaje automático.
  - `rules.py`: funciones de normalización y tokenización de texto.
  - `rules_engine.py`: motor de clasificación basado en reglas contra la base referencial.
  - `feedback.py`: generación de retroalimentación pedagógica mediante la API de OpenAI.
  - `schemas.py`: esquemas Pydantic para validación de solicitudes y respuestas.
- `artifacts/`: modelos entrenados y vectorizadores utilizados por el clasificador ML.
- `data/`: archivos de apoyo utilizados por la API (por ejemplo, la base referencial).
- `requirements.txt`: dependencias del proyecto.
- `Procfile`, `nixpacks.toml`, `.python-version`: archivos de configuración para despliegue.
- `README.md`: documentación técnica específica de la API.

---

### `/oracle_apex`

Contiene los artefactos relacionados con la aplicación desarrollada en Oracle APEX y el esquema de base de datos.

**Subcarpetas y archivos principales:**

- `app_export/`:
  - `f100/`: exportación descomprimida de la aplicación APEX.
  - `f100.zip`: archivo ZIP original generado por Oracle APEX durante el proceso de exportación.
- `schema/`: definiciones SQL del esquema de base de datos, con un archivo por tabla.
- `ERD_THESIS.png`: diagrama entidad–relación del esquema de la base de datos.
- `README.md`: descripción de la aplicación APEX y del proceso de exportación.

---

### `/datasets`

Incluye los conjuntos de datos utilizados durante el desarrollo y evaluación del prototipo.

**Contenido:**

- Dataset(s) utilizados para el entrenamiento del clasificador de aprendizaje automático.
- Base referencial utilizada por el motor de reglas.
- Conjunto de datos empleado como *ground truth* para la evaluación del clasificador basado en reglas.
