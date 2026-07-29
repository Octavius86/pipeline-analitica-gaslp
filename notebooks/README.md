# Notebook de Análisis y Modelado

## Descripción

Esta carpeta contiene los notebooks desarrollados en **Databricks** para el procesamiento, análisis y modelado predictivo de la información operativa del proyecto.

El proyecto se desarrolla íntegramente dentro del entorno **Databricks**, utilizando una arquitectura basada en **Lakehouse**. Los datos se almacenan y gestionan dentro del Lakehouse, mientras que **Apache Spark y PySpark** se utilizan para su procesamiento y transformación.

Los notebooks consumen los conjuntos de datos previamente integrados mediante SQL y almacenados en el Lakehouse. A partir de esta información se realizan procesos de validación, Análisis Exploratorio de Datos (EDA), limpieza, transformación, análisis estadístico y modelado predictivo.

Los resultados obtenidos durante estas etapas también se almacenan nuevamente en el Lakehouse mediante tablas administradas, permitiendo que puedan ser utilizados posteriormente por las herramientas de Business Intelligence.

---

## Arquitectura del módulo

```text
                         DATABRICKS
                              │
                              ▼
                         LAKEHOUSE
                              │
             ┌────────────────┴────────────────┐
             │                                 │
             ▼                                 ▼
      Datos integrados                    Tablas SQL
             │
             ▼
        Apache Spark
             │
             ▼
       Spark DataFrame
             │
             ▼
      Notebook PySpark
             │
      ┌──────┴──────┐
      │             │
      ▼             ▼
     EDA      Modelado Predictivo
      │             │
      └──────┬──────┘
             ▼
       Resultados
             │
             ▼
          Lakehouse
             │
             ▼
   Business Intelligence
```

---

## Flujo de trabajo

El procesamiento se realiza dentro de Databricks siguiendo el siguiente flujo:

1. Los datos se almacenan dentro del Lakehouse.
2. SQL se utiliza para integrar y transformar la información.
3. Los resultados de las vistas SQL se almacenan como tablas dentro del Lakehouse.
4. Los notebooks de Databricks recuperan estas tablas mediante Apache Spark.
5. Los Spark DataFrames se convierten a Pandas cuando las etapas analíticas lo requieren.
6. Se realiza el Análisis Exploratorio de Datos.
7. Se aplican técnicas de análisis estadístico y control del proceso.
8. Se desarrolla el modelo predictivo de series temporales mediante Prophet.
9. Se evalúa el desempeño del modelo mediante validación cruzada.
10. Los resultados se almacenan nuevamente en el Lakehouse.
11. La información queda disponible para su consumo en la capa de Business Intelligence.

---

## Tecnologías utilizadas

| Componente                   | Tecnología                           |
| ---------------------------- | ------------------------------------ |
| Plataforma de desarrollo     | Databricks                           |
| Arquitectura de datos        | Lakehouse                            |
| Procesamiento distribuido    | Apache Spark                         |
| API de procesamiento         | PySpark                              |
| Análisis de datos            | Pandas                               |
| Cálculo numérico             | NumPy                                |
| Visualización                | Matplotlib, Seaborn                  |
| Estadística                  | SciPy                                |
| Modelado predictivo          | Prophet                              |
| Almacenamiento de resultados | Tablas administradas en el Lakehouse |
| Business Intelligence        | Power BI                             |

---

## Persistencia de resultados

Una característica importante de este módulo es que los resultados no permanecen únicamente en memoria dentro del notebook.

Después de completar los procesos analíticos, los resultados se convierten nuevamente a `Spark DataFrame` y se almacenan como tablas dentro del Lakehouse.

Entre los resultados generados se encuentran:

```text
Análisis de control estadístico
        │
        ▼
Tabla de resultados Shewhart

Pronósticos de entregas
        │
        ▼
Tabla de predicciones

Métricas de evaluación
        │
        ▼
Tabla de métricas del modelo
```

Esto permite desacoplar el proceso de análisis del consumo posterior de información y facilita la integración con la capa de Business Intelligence.

---

## Notebook principal

### `Pred_balance_censo.ipynb`

El notebook principal desarrolla el análisis del censo operativo y el pronóstico de entregas.

El flujo comprende:

* Preparación y validación de datos.
* Análisis Exploratorio de Datos (EDA).
* Análisis descriptivo.
* Limpieza y transformación.
* Control Estadístico de Procesos.
* Modelado predictivo mediante Prophet.
* Integración de valores reales y pronosticados.
* Validación cruzada.
* Persistencia de resultados en el Lakehouse.

---

## Relación con el pipeline completo

```text
Fuentes de datos
       │
       ▼
    Lakehouse
       │
       ▼
SQL en Databricks
       │
       ▼
Vistas y tablas analíticas
       │
       ▼
Notebooks Databricks
       │
       ├── EDA
       ├── Estadística
       ├── Control de procesos
       └── Prophet
       │
       ▼
Resultados
       │
       ▼
Lakehouse
       │
       ▼
Business Intelligence
```

---

## Autor

**Ivan Octavio Ortiz Gallardo**

Repositorio:

`pipeline-analitica-gaslp`
