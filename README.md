# Pipeline de Analítica para la Distribución de Gas LP

> Pipeline de analítica de datos para la integración, transformación, análisis exploratorio y modelado predictivo de información operativa de distribución de Gas LP mediante SQL, PySpark y Python.

---

## Descripción

Este repositorio documenta el desarrollo de un pipeline de analítica de datos implementado durante un proyecto de servicio social, cuyo objetivo fue integrar, transformar y analizar información operativa para apoyar la toma de decisiones mediante técnicas de Ingeniería de Datos, Análisis Exploratorio de Datos (EDA), Control Estadístico de Procesos y Modelado Predictivo.

El proyecto contempla desde la integración de datos mediante SQL hasta la generación de modelos predictivos utilizando Python, preparando la información para su consumo en herramientas de Business Intelligence.

> **Nota:** Por motivos de confidencialidad, este repositorio no incluye datos institucionales, información sensible ni el dashboard final desarrollado durante el proyecto. No obstante, conserva la metodología, la arquitectura y el flujo analítico implementado.

---

## Objetivo

Desarrollar un pipeline de analítica de datos que permita integrar información operativa proveniente de diferentes fuentes, aplicar procesos de transformación y limpieza, realizar análisis exploratorio y desarrollar modelos predictivos que apoyen la toma de decisiones.

---

## Objetivos específicos

- Integrar información mediante consultas SQL.
- Limpiar y transformar datos para su análisis.
- Construir vistas analíticas para consolidar información.
- Realizar un Análisis Exploratorio de Datos (EDA).
- Aplicar técnicas de Control Estadístico de Procesos (SPC).
- Desarrollar modelos predictivos para series temporales.
- Generar un conjunto de datos preparado para herramientas de Business Intelligence.

---

## Arquitectura general del proyecto

```text
Fuentes de datos
        │
        ▼
Integración mediante SQL
        │
        ▼
Vistas analíticas
        │
        ▼
PySpark
        │
        ▼
Preparación de datos
        │
        ▼
Análisis Exploratorio (EDA)
        │
        ▼
Control Estadístico de Procesos
        │
        ▼
Modelado Predictivo
        │
        ▼
Evaluación de resultados
        │
        ▼
Conjunto de datos final
        │
        ▼
Dashboard Institucional
```

---

## Tecnologías utilizadas

| Categoría | Tecnologías |
|------------|-------------|
| Lenguajes | SQL, Python |
| Procesamiento de datos | PySpark, Pandas, NumPy |
| Visualización | Matplotlib |
| Machine Learning | Prophet |
| Estadística | SciPy |
| Control de versiones | Git, GitHub |

---

## Estructura del repositorio

```text
pipeline-analitica-gaslp/

├── README.md
├── LICENSE
├── .gitignore
├── requirements.txt
│
├── sql/
├── notebooks/
├── documentacion/
├── datos/
├── resultados/
└── scripts/
```

---

## Flujo de trabajo

1. Integración de datos mediante SQL.
2. Limpieza y transformación de la información.
3. Construcción de vistas analíticas.
4. Procesamiento de datos con PySpark.
5. Análisis Exploratorio de Datos (EDA).
6. Ingeniería de características.
7. Control Estadístico de Procesos.
8. Desarrollo de modelos predictivos.
9. Evaluación de resultados.
10. Preparación de datos para Business Intelligence.

---

## Competencias demostradas

Durante el desarrollo de este proyecto se aplicaron conocimientos en:

- Integración de datos mediante SQL.
- Limpieza y transformación de datos.
- Procesamiento de datos con PySpark.
- Análisis Exploratorio de Datos (EDA).
- Estadística descriptiva.
- Control Estadístico de Procesos (SPC).
- Ingeniería de características.
- Modelado predictivo para series temporales.
- Preparación de datos para Business Intelligence.
- Documentación técnica.

---

## Limitaciones

Por motivos de confidencialidad, este repositorio no incluye:

- Bases de datos originales.
- Información sensible de la organización.
- Dashboard final desarrollado durante el proyecto.
- Recursos internos utilizados durante la implementación.

Sin embargo, se conserva la metodología, la arquitectura del proyecto, las consultas SQL, el flujo de análisis y la documentación técnica.

---

## Trabajo futuro

Entre las posibles mejoras del proyecto se consideran:

- Automatización del pipeline de procesamiento.
- Comparación entre diferentes algoritmos predictivos.
- Integración con procesos ETL automatizados.
- Monitoreo del desempeño de modelos.
- Despliegue del pipeline en servicios en la nube.

---

## Autor

**Ivan Octavio Ortiz Gallardo**

---

## Licencia

Este proyecto se publica con fines de demostración profesional y portafolio, respetando la confidencialidad de la información institucional utilizada durante su desarrollo.
