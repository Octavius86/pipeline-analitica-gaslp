# Módulo SQL

## Descripción

Este módulo contiene las vistas SQL utilizadas para la integración, limpieza, transformación y consolidación de la información operativa del pipeline de analítica para la distribución de Gas LP.

Las vistas fueron desarrolladas siguiendo un enfoque incremental, donde cada una reutiliza la información generada por las anteriores para construir conjuntos de datos más completos y especializados.

Este proceso constituye la base del pipeline analítico y proporciona la información que posteriormente es utilizada por los procesos desarrollados en PySpark, el Análisis Exploratorio de Datos (EDA), los modelos de Machine Learning y el dashboard de Business Intelligence.

---

# Objetivos

- Integrar información proveniente de diferentes fuentes operativas.
- Estandarizar los tipos de datos utilizados durante el análisis.
- Aplicar reglas de negocio para la generación de indicadores.
- Consolidar la información necesaria para las siguientes etapas del pipeline.
- Mantener un flujo de transformación de datos modular y reutilizable.

---

# Flujo del Pipeline SQL

```text
Balance Operativo
        │
        ▼
Censo Operativo
        │
        ▼
01_union_balance_censo
        │
        ▼
02_union_balance_censo_cumplimiento_total
        │
        ├─────────────────────────────┐
        ▼                             ▼
03_union_balance_              06_union_balance_
censo_cumplimiento_demanda     censo_cumplimiento_ducto
        │
        ▼
04_union_balance_censo_
cumplimiento_demanda_atencion
        │
        ▼
05_union_balance_censo_
cumplimiento_shalapa
```

---

# Estructura del módulo

```text
sql/
│
├── 01_union_balance_censo.sql
├── 02_union_balance_censo_cumplimiento_total.sql
├── 03_union_balance_censo_cumplimiento_demanda.sql
├── 04_union_balance_censo_cumplimiento_demanda_atencion.sql
├── 05_union_balance_censo_cumplimiento_shalapa.sql
├── 06_union_balance_censo_cumplimiento_ducto.sql
└── README.md
```

---

# Descripción de las vistas

## 01. union_balance_censo

Integra la información del **Balance Operativo** y el **Censo Operativo**, generando la vista base utilizada durante todo el pipeline de transformación.

**Entradas**

- Balance Operativo
- Censo Operativo

**Salida**

- `union_balance_censo`

---

## 02. union_balance_censo_cumplimiento_total

Incorpora la información de cumplimiento operativo mediante la integración de la vista base con los registros de cumplimiento utilizando la clave del centro y la fecha de operación.

**Entrada**

- `union_balance_censo`

**Salida**

- `union_balance_censo_cumplimiento_total`

---

## 03. union_balance_censo_cumplimiento_demanda

Genera una vista enfocada en la demanda de Gas LP mediante la clasificación de los centros operativos y la aplicación de reglas de negocio para los grupos GOTGLPP y LOGÍSTICA.

**Entrada**

- `union_balance_censo`

**Salida**

- `union_balance_censo_cumplimiento_demanda`

---

## 04. union_balance_censo_cumplimiento_demanda_atencion

Calcula indicadores asociados a la atención de la demanda mediante agregaciones y métricas derivadas de la información consolidada.

**Entrada**

- `union_balance_censo_cumplimiento_demanda`

**Salida**

- `union_balance_censo_cumplimiento_demanda_atencion`

---

## 05. union_balance_censo_cumplimiento_shalapa

Clasifica la información correspondiente a los ductos SHALAPA y LPGD, identificando los volúmenes transportados y las metas operativas establecidas para cada tipo de ducto.

**Entrada**

- `union_balance_censo`

**Salida**

- `union_balance_censo_cumplimiento_shalapa`

---

## 06. union_balance_censo_cumplimiento_ducto

Consolida indicadores relacionados con la operación de ductos mediante agregaciones de volúmenes y entregas por terminal y fecha de operación.

**Entrada**

- `union_balance_censo_cumplimiento_total`

**Salida**

- `union_balance_censo_cumplimiento_ducto`

---

# Consideraciones

- Todas las vistas mantienen la lógica de negocio implementada durante el desarrollo original del proyecto.
- Se estandarizaron el formato, la documentación y la organización del código para mejorar su mantenibilidad y facilitar su comprensión.
- Las reglas de negocio, clasificaciones y cálculos fueron conservados sin modificaciones para garantizar la consistencia de los resultados.

---

# Tecnologías utilizadas

- SQL
- Apache Spark SQL
- Databricks SQL

---

# Convenciones utilizadas

- Palabras reservadas SQL en mayúsculas.
- Alias descriptivos para tablas.
- Comentarios organizados por bloques funcionales.
- Encabezado descriptivo en cada archivo SQL.
- Una vista por archivo.
- Formato uniforme en todo el módulo.

---

## Resultado

Las consultas de esta carpeta generan la información estructurada que posteriormente es utilizada por los notebooks de Python para realizar el análisis exploratorio de datos, el control estadístico de procesos y el modelado predictivo.

# Autor

**Ivan Octavio Ortiz Gallardo**

Repositorio: **pipeline-analitica-gaslp**
