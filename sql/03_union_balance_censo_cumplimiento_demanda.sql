/*
===============================================================================
PROYECTO: Pipeline de Analítica para la Distribución de Gas LP

ARCHIVO:
03_union_balance_censo_cumplimiento_demanda.sql

VISTA:
logistica.gaslp.union_balance_censo_cumplimiento_demanda

DESCRIPCIÓN:
Genera una vista enfocada en la demanda de Gas LP a partir de la vista base
del pipeline. Además, clasifica los centros operativos en los grupos GOTGLPP
y LOGISTICA mediante reglas de negocio definidas por el conjunto de claves
operativas.

TABLA DE ORIGEN:
- logistica.gaslp.union_balance_censo

SALIDA:
Vista: logistica.gaslp.union_balance_censo_cumplimiento_demanda

DEPENDENCIA:
01_union_balance_censo.sql

AUTOR:
Ivan Octavio Ortiz Gallardo
===============================================================================
*/

CREATE OR REPLACE VIEW logistica.gaslp.union_balance_censo_cumplimiento_demanda AS

SELECT

    -- =====================================================
    -- Información general de la terminal
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
    -- Clasificación GOTGLPP
    -- =====================================================

    CASE
        WHEN u.idclave IN (
            '960','961','964','971','973',
            '975','980','981','998','979A'
        )
        THEN u.NACIONAL
        ELSE 0
    END AS GOTGLPP,

    -- =====================================================
    -- Clasificación LOGISTICA
    -- =====================================================

    CASE
        WHEN u.idclave IN (
            '960','961','962','963','964',
            '971','973','975','978','980',
            '981','985','998','979A'
        )
        THEN u.NACIONAL
        ELSE 0
    END AS LOGISTICA

FROM logistica.gaslp.union_balance_censo AS u

-- =====================================================
-- Centros operativos considerados para el análisis
-- =====================================================

WHERE u.idclave IN (
    '960','961','962','963','964',
    '971','973','975','978','980',
    '981','985','998','979A'
);
