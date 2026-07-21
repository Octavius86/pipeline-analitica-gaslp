/*
===============================================================================
PROYECTO: Pipeline de Analítica para la Distribución de Gas LP

ARCHIVO:
05_union_balance_censo_cumplimiento_shalapa.sql

VISTA:
logistica.gaslp.union_balance_censo_cumplimiento_shalapa

DESCRIPCIÓN:
Genera una vista enfocada en el análisis de la operación de los ductos
SHALAPA y LPGD. La vista clasifica los centros operativos según el tipo
de ducto, identifica el volumen transportado por cada sistema y establece
la meta operativa correspondiente.

TABLA DE ORIGEN:
- logistica.gaslp.union_balance_censo

SALIDA:
Vista: logistica.gaslp.union_balance_censo_cumplimiento_shalapa

DEPENDENCIA:
01_union_balance_censo.sql

AUTOR:
Ivan Octavio Ortiz Gallardo
===============================================================================
*/

CREATE OR REPLACE VIEW logistica.gaslp.union_balance_censo_cumplimiento_shalapa AS

SELECT

    -- =====================================================
    -- Información general
    -- =====================================================

    u.idclave,
    u.GestiondeTerminal,
    u.DescripciondeTerminal,
    u.Fecha_Conv,

    -- =====================================================
    -- Variables operativas
    -- =====================================================

    u.NACIONAL,
    u.EntradaPromedio,
    u.DUCTO,
    u.Densidad,

    -- =====================================================
    -- Clasificación del tipo de ducto
    -- =====================================================

    CASE
        WHEN u.idclave = '0CAV'
        THEN 'SHALAPA'
        ELSE 'LPGD'
    END AS Tipo_de_Ducto,

    -- =====================================================
    -- Volumen transportado por SHALAPA
    -- =====================================================

    CASE
        WHEN u.idclave = '0CAV'
        THEN u.DUCTO
        ELSE 0
    END AS Ductos_Shalapa,

    -- =====================================================
    -- Volumen transportado por LPGD
    -- =====================================================

    CASE
        WHEN u.idclave IN (
            '978','971','977',
            '960','979A','971A',
            '977C'
        )
        THEN u.DUCTO
        ELSE 0
    END AS Ductos_LPGD,

    -- =====================================================
    -- Meta operativa
    -- =====================================================

    CASE
        WHEN u.idclave <> '0CAV'
        THEN 120
        ELSE 0
    END AS Meta_Ducto

FROM logistica.gaslp.union_balance_censo AS u

WHERE u.idclave IN (
    '0CAV',
    '978',
    '971',
    '977',
    '960',
    '979A',
    '971A',
    '977C'
);
