# Consultas SQL

## Descripción

Esta carpeta contiene las consultas SQL desarrolladas para integrar, transformar y consolidar la información operativa utilizada durante el proyecto.

Las consultas representan la primera etapa del pipeline analítico y permiten construir las vistas que posteriormente son utilizadas para el procesamiento de datos, el análisis exploratorio y el desarrollo de modelos predictivos.

El objetivo principal de este módulo es preparar un conjunto de datos consistente y estructurado que sirva como base para las siguientes etapas del proyecto.

---

## Objetivos

- Integrar información proveniente de diferentes fuentes de datos.
- Consolidar indicadores operativos.
- Estandarizar la información para su análisis.
- Generar vistas analíticas reutilizables.
- Reducir el trabajo de preparación de datos en etapas posteriores.

---

## Organización

Las consultas fueron organizadas siguiendo el flujo de preparación de datos.

| Archivo | Descripción |
|----------|-------------|
| 01_union_balance_censo.sql | Integra la información del balance operativo con el censo correspondiente. |
| 02_cumplimiento_total.sql | Calcula los indicadores generales de cumplimiento. |
| 03_cumplimiento_demanda.sql | Obtiene los indicadores relacionados con la demanda. |
| 04_demanda_atencion.sql | Analiza la relación entre demanda y atención operativa. |
| 05_cumplimiento_shalapa.sql | Genera indicadores específicos para el proceso Shalapa. |
| 06_cumplimiento_ductos.sql | Calcula indicadores relacionados con la operación de ductos. |

---

## Convenciones

Durante el desarrollo de las consultas se siguieron las siguientes convenciones:

- Una consulta principal por archivo.
- Nombres descriptivos para tablas, vistas y alias.
- Comentarios para facilitar la comprensión del código.
- Organización secuencial de acuerdo con el flujo del proyecto.

---

## Flujo del módulo SQL

```text
Fuentes de datos
        │
        ▼
Integración de información
        │
        ▼
Transformación de datos
        │
        ▼
Consolidación de indicadores
        │
        ▼
Generación de vistas analíticas
        │
        ▼
Conjunto de datos preparado
```

---

## Resultado

Las consultas de esta carpeta generan la información estructurada que posteriormente es utilizada por los notebooks de Python para realizar el análisis exploratorio de datos, el control estadístico de procesos y el modelado predictivo.
