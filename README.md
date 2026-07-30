# Pipeline de Analítica para la Distribución de Gas LP

> Pipeline de analítica de datos para la integración, transformación, análisis exploratorio, control estadístico y modelado predictivo de información operativa relacionada con la distribución de Gas LP.

---

## Descripción

Este repositorio documenta el desarrollo de un pipeline de analítica de datos implementado durante un proyecto de servicio social, orientado a integrar, transformar y analizar información operativa para apoyar la toma de decisiones.

El proyecto fue desarrollado íntegramente en **Databricks**, utilizando una arquitectura **Lakehouse** para el almacenamiento y gestión de los datos, junto con **Apache Spark y PySpark** para su procesamiento.

El flujo comienza con la integración y transformación de información mediante SQL. Los resultados de esta etapa se almacenan en el Lakehouse y posteriormente son consumidos desde notebooks de Databricks para realizar el Análisis Exploratorio de Datos (EDA), análisis estadístico, Control Estadístico de Procesos (SPC) y modelado predictivo de series temporales mediante **Prophet**.

Finalmente, los resultados analíticos y predictivos son almacenados nuevamente en el Lakehouse para su posterior consumo por la capa de Business Intelligence.

> **Nota de confidencialidad:** Por motivos de confidencialidad y acceso, este repositorio no incluye los datos institucionales originales, información sensible ni el dashboard final desarrollado durante el proyecto. Se conserva la metodología, arquitectura, consultas SQL, notebook analítico y flujo general de procesamiento.

---

## Objetivo

Desarrollar un pipeline de analítica de datos que permita integrar información operativa proveniente de diferentes fuentes, transformarla y analizarla mediante técnicas estadísticas y de modelado predictivo, generando información estructurada para apoyar la toma de decisiones.

---

## Objetivos específicos

* Integrar información operativa mediante consultas SQL.
* Construir vistas analíticas para consolidar y transformar los datos.
* Almacenar la información procesada dentro de un entorno Lakehouse.
* Procesar y analizar los datos mediante Apache Spark, PySpark y Pandas.
* Realizar un Análisis Exploratorio de Datos (EDA).
* Aplicar técnicas de Control Estadístico de Procesos (SPC).
* Desarrollar modelos de series temporales mediante Prophet.
* Evaluar el desempeño del modelo mediante validación cruzada.
* Generar y almacenar resultados analíticos y predictivos para su posterior consumo en Business Intelligence.

---

## Arquitectura del proyecto

```text
                    DATABRICKS
                        │
                        ▼
                    LAKEHOUSE
                        │
             ┌──────────┴──────────┐
             │                     │
             ▼                     ▼
      Datos operativos        Tablas integradas
             │                     │
             └──────────┬──────────┘
                        ▼
                  SQL / Spark SQL
                        │
                        ▼
                 Vistas analíticas
                        │
                        ▼
                Tablas en Lakehouse
                        │
                        ▼
               Notebook Databricks
                        │
          ┌─────────────┼─────────────┐
          ▼             ▼             ▼
         EDA         SPC /           Prophet
                     Estadística        │
          │             │              │
          └─────────────┴──────────────┘
                        │
                        ▼
                 Resultados finales
                        │
                        ▼
                    LAKEHOUSE
                        │
                        ▼
             Business Intelligence
```

---

## Flujo de trabajo

1. Integración de información operativa mediante SQL.
2. Construcción de vistas analíticas.
3. Almacenamiento de los resultados en el Lakehouse.
4. Recuperación de los datos mediante Spark en Databricks.
5. Conversión a Pandas para las etapas que requieren análisis tabular.
6. Análisis Exploratorio de Datos (EDA).
7. Limpieza y transformación de variables.
8. Control Estadístico de Procesos.
9. Modelado predictivo mediante Prophet.
10. Validación del modelo mediante validación cruzada.
11. Integración de valores reales y pronosticados.
12. Persistencia de resultados en el Lakehouse.
13. Preparación de información para Business Intelligence.

---

## Tecnologías utilizadas

| Categoría                 | Tecnologías                          |
| ------------------------- | ------------------------------------ |
| Plataforma                | Databricks                           |
| Arquitectura de datos     | Lakehouse                            |
| Procesamiento distribuido | Apache Spark, PySpark                |
| Lenguajes                 | SQL, Python                          |
| Análisis de datos         | Pandas, NumPy                        |
| Visualización             | Matplotlib, Seaborn                  |
| Estadística               | SciPy                                |
| Modelado predictivo       | Prophet                              |
| Persistencia              | Tablas administradas en el Lakehouse |
| Control de versiones      | Git, GitHub                          |
| Business Intelligence     | Power BI                             |

---

## Estructura del repositorio

```text
pipeline-analitica-gaslp/
│
├── README.md
│
├── sql/
│   ├── README.md
│   ├── 01_union_balance_censo.sql
│   ├── 02_union_balance_censo_cumplimiento_total.sql
│   ├── 03_union_balance_censo_cumplimiento_demanda.sql
│   ├── 04_union_balance_censo_cumplimiento_demanda_atencion.sql
│   ├── 05_union_balance_censo_cumplimiento_shalapa.sql
│   └── 06_union_balance_censo_cumplimiento_ducto.sql
│
├── notebooks/
│   ├── README.md
│   └── 01_analisis_censo_operativo.ipynb
│
├── .gitignore
├── requirements.txt
└── LICENSE
```

---

## Módulo SQL

El módulo SQL constituye la primera etapa del pipeline y se encarga de integrar y transformar la información operativa.

Las seis vistas desarrolladas son:

| Vista                                               | Propósito                                                       |
| --------------------------------------------------- | --------------------------------------------------------------- |
| `union_balance_censo`                               | Integra información del balance operativo y el censo operativo. |
| `union_balance_censo_cumplimiento_total`            | Incorpora información de cumplimiento mediante centro y fecha.  |
| `union_balance_censo_cumplimiento_demanda`          | Clasifica y prepara información relacionada con la demanda.     |
| `union_balance_censo_cumplimiento_demanda_atencion` | Genera indicadores asociados a la atención de la demanda.       |
| `union_balance_censo_cumplimiento_shalapa`          | Clasifica la operación asociada a los ductos SHALAPA y LPGD.    |
| `union_balance_censo_cumplimiento_ducto`            | Consolida indicadores relacionados con la operación de ductos.  |

Para consultar la documentación específica del módulo:

[Ver documentación SQL](./sql/README.md)

---

## Notebook analítico

El proyecto cuenta con un notebook desarrollado en Databricks que concentra las etapas de análisis y modelado.

Entre los principales procesos se encuentran:

* Validación de la estructura de los datos.
* Análisis Exploratorio de Datos.
* Estadística descriptiva.
* Tratamiento y transformación de variables.
* Control Estadístico de Procesos mediante Shewhart.
* Evaluación de capacidad y centramiento del proceso.
* Modelado predictivo mediante Prophet.
* Pronóstico por grupos de terminal y gestión.
* Pronóstico general.
* Validación cruzada temporal.
* Generación y persistencia de resultados.

[Ver notebook de análisis y modelado](./notebooks/01_analisis_censo_operativo.ipynb)

---

## Resultados

El pipeline genera información analítica y predictiva que puede ser utilizada en etapas posteriores del proceso.

Entre los principales resultados se encuentran:

* Indicadores derivados del análisis operativo.
* Resultados del Control Estadístico de Procesos.
* Pronósticos de entregas.
* Intervalos de incertidumbre del pronóstico.
* Métricas de evaluación del modelo.
* Conjuntos de datos preparados para Business Intelligence.

Los resultados intermedios y finales se almacenan nuevamente en el Lakehouse para facilitar su reutilización.

---

## Limitaciones

Por motivos de confidencialidad y acceso institucional, este repositorio no incluye:

* Bases de datos originales.
* Información sensible de la organización.
* Recursos internos del entorno Databricks.
* Dashboard institucional.
* Otros componentes que requieran acceso al entorno original.

El repositorio conserva, sin embargo, la estructura general del pipeline, las consultas SQL, el flujo analítico, el notebook de procesamiento y la metodología utilizada durante el desarrollo.

---

## Trabajo futuro

Como posibles líneas de evolución del proyecto se consideran:

* Automatización de la ejecución del pipeline.
* Incorporación y comparación de modelos adicionales de series temporales.
* Implementación de monitoreo del desempeño de los modelos.
* Automatización de la actualización de resultados.
* Integración de procesos de despliegue y operación en la nube.

---

## Autor

**Ivan Octavio Ortiz Gallardo**

Proyecto desarrollado durante actividades de servicio social.

Repositorio:

`pipeline-analitica-gaslp`


---

## Licencia

Este proyecto se publica con fines de demostración profesional y portafolio, respetando la confidencialidad de la información institucional utilizada durante su desarrollo.
