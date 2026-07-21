/*
===============================================================================
PROYECTO: Pipeline de Analítica para la Distribución de Gas LP

ARCHIVO:
02_union_balance_censo_cumplimiento_total.sql

VISTA:
logistica.gaslp.union_balance_censo_cumplimiento_total

DESCRIPCIÓN:
Integra la vista base del pipeline analítico con la información de cumplimiento
operativo mediante la clave del centro y la fecha de operación.

Esta vista amplía el conjunto de datos incorporando los indicadores de
cumplimiento, los cuales serán utilizados en las etapas posteriores del análisis
exploratorio, control estadístico y modelado predictivo.

TABLAS DE ORIGEN:
- logistica.gaslp.union_balance_censo
- logistica.gaslp.cumplimiento

LLAVE DE INTEGRACIÓN:
- idclave = Centro
- Fecha_Conv = Fecha

SALIDA:
Vista: logistica.gaslp.union_balance_censo_cumplimiento_total

DEPENDENCIA:
01_union_balance_censo.sql

AUTOR:
Ivan Octavio Ortiz Gallardo
===============================================================================
*/

CREATE OR REPLACE VIEW logistica.gaslp.union_balance_censo_cumplimiento_total AS

SELECT

    -- =====================================================
    -- Información integrada del balance y censo operativo
    -- =====================================================

    u.*,

    -- =====================================================
    -- Información de cumplimiento operativo
    -- =====================================================

    c.*

FROM logistica.gaslp.union_balance_censo AS u

INNER JOIN logistica.gaslp.cumplimiento AS c
    ON u.idclave = c.Centro
   AND u.Fecha_Conv = c.Fecha;
