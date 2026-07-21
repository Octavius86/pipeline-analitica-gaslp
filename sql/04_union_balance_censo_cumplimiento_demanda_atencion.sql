/*
===============================================================================
PROYECTO: Pipeline de Analítica para la Distribución de Gas LP

ARCHIVO:
04_union_balance_censo_cumplimiento_demanda_atencion.sql

VISTA:
logistica.gaslp.union_balance_censo_cumplimiento_demanda_atencion

DESCRIPCIÓN:
Calcula el indicador de Atención a partir de la información consolidada de
demanda. La vista agrega los volúmenes de GOTGLPP y LOGISTICA, obtiene el
volumen total de PEMEX y calcula el porcentaje de atención para cada centro
operativo y periodo de análisis.

TABLA DE ORIGEN:
- logistica.gaslp.union_balance_censo_cumplimiento_demanda

SALIDA:
Vista: logistica.gaslp.union_balance_censo_cumplimiento_demanda_atencion

DEPENDENCIA:
03_union_balance_censo_cumplimiento_demanda.sql

AUTOR:
Ivan Octavio Ortiz Gallardo
===============================================================================
*/

CREATE OR REPLACE VIEW logistica.gaslp.union_balance_censo_cumplimiento_demanda_atencion AS

SELECT

    idclave,
    GestiondeTerminal,
    Fecha_Conv,
    DescripciondeTerminal,

    NACIONAL,
    EntradaPromedio,
    DUCTO,
    Densidad,

    GOTGLPP,
    LOGISTICA,
    PEMEX,

    mes,

    Atencion

FROM (

    SELECT

        -- =====================================================
        -- Información general
        -- =====================================================

        idclave,
        GestiondeTerminal,
        Fecha_Conv,
        DescripciondeTerminal,

        -- =====================================================
        -- Variables operativas
        -- =====================================================

        NACIONAL,
        EntradaPromedio,
        DUCTO,
        Densidad,

        -- =====================================================
        -- Indicadores agregados
        -- =====================================================

        SUM(GOTGLPP) AS GOTGLPP,

        SUM(LOGISTICA) AS LOGISTICA,

        SUM(GOTGLPP + LOGISTICA) AS PEMEX,

        TO_CHAR(
            DATE_TRUNC('month', Fecha_Conv),
            'yyyy-MM'
        ) AS mes,

        -- =====================================================
        -- Cálculo del indicador de Atención
        -- =====================================================

        (
            (
                SUM(LOGISTICA)
                /
                NULLIF(
                    SUM(GOTGLPP + LOGISTICA),
                    0
                )
            ) / 100
        ) AS Atencion

    FROM logistica.gaslp.union_balance_censo_cumplimiento_demanda

    GROUP BY

        idclave,
        GestiondeTerminal,
        Fecha_Conv,
        DescripciondeTerminal,

        NACIONAL,
        EntradaPromedio,
        DUCTO,
        Densidad,

        DATE_TRUNC('month', Fecha_Conv)

) AS sub

-- =====================================================
-- Eliminación de registros sin indicador calculado
-- =====================================================

WHERE Atencion IS NOT NULL
  AND Atencion <> 0

ORDER BY mes;/*
===============================================================================
PROYECTO: Pipeline de Analítica para la Distribución de Gas LP

ARCHIVO:
04_union_balance_censo_cumplimiento_demanda_atencion.sql

VISTA:
logistica.gaslp.union_balance_censo_cumplimiento_demanda_atencion

DESCRIPCIÓN:
Calcula el indicador de Atención a partir de la información consolidada de
demanda. La vista agrega los volúmenes de GOTGLPP y LOGISTICA, obtiene el
volumen total de PEMEX y calcula el porcentaje de atención para cada centro
operativo y periodo de análisis.

TABLA DE ORIGEN:
- logistica.gaslp.union_balance_censo_cumplimiento_demanda

SALIDA:
Vista: logistica.gaslp.union_balance_censo_cumplimiento_demanda_atencion

DEPENDENCIA:
03_union_balance_censo_cumplimiento_demanda.sql

AUTOR:
Ivan Octavio Ortiz Gallardo
===============================================================================
*/

CREATE OR REPLACE VIEW logistica.gaslp.union_balance_censo_cumplimiento_demanda_atencion AS

SELECT

    idclave,
    GestiondeTerminal,
    Fecha_Conv,
    DescripciondeTerminal,

    NACIONAL,
    EntradaPromedio,
    DUCTO,
    Densidad,

    GOTGLPP,
    LOGISTICA,
    PEMEX,

    mes,

    Atencion

FROM (

    SELECT

        -- =====================================================
        -- Información general
        -- =====================================================

        idclave,
        GestiondeTerminal,
        Fecha_Conv,
        DescripciondeTerminal,

        -- =====================================================
        -- Variables operativas
        -- =====================================================

        NACIONAL,
        EntradaPromedio,
        DUCTO,
        Densidad,

        -- =====================================================
        -- Indicadores agregados
        -- =====================================================

        SUM(GOTGLPP) AS GOTGLPP,

        SUM(LOGISTICA) AS LOGISTICA,

        SUM(GOTGLPP + LOGISTICA) AS PEMEX,

        TO_CHAR(
            DATE_TRUNC('month', Fecha_Conv),
            'yyyy-MM'
        ) AS mes,

        -- =====================================================
        -- Cálculo del indicador de Atención
        -- =====================================================

        (
            (
                SUM(LOGISTICA)
                /
                NULLIF(
                    SUM(GOTGLPP + LOGISTICA),
                    0
                )
            ) / 100
        ) AS Atencion

    FROM logistica.gaslp.union_balance_censo_cumplimiento_demanda

    GROUP BY

        idclave,
        GestiondeTerminal,
        Fecha_Conv,
        DescripciondeTerminal,

        NACIONAL,
        EntradaPromedio,
        DUCTO,
        Densidad,

        DATE_TRUNC('month', Fecha_Conv)

) AS sub

-- =====================================================
-- Eliminación de registros sin indicador calculado
-- =====================================================

WHERE Atencion IS NOT NULL
  AND Atencion <> 0

ORDER BY mes;
