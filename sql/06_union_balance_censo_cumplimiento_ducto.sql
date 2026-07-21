/*
===============================================================================
PROYECTO: Pipeline de Analítica para la Distribución de Gas LP

ARCHIVO:
06_union_balance_censo_cumplimiento_ducto.sql

VISTA:
logistica.gaslp.union_balance_censo_cumplimiento_ducto

DESCRIPCIÓN:
Genera indicadores consolidados relacionados con la operación de ductos.
La vista agrupa la información por clasificación de terminal y fecha de
operación, calculando volúmenes agregados que facilitan el análisis del
desempeño logístico de la red de distribución de Gas LP.

TABLA DE ORIGEN:
- logistica.gaslp.union_balance_censo_cumplimiento_total

SALIDA:
Vista: logistica.gaslp.union_balance_censo_cumplimiento_ducto

DEPENDENCIA:
02_union_balance_censo_cumplimiento_total.sql

AUTOR:
Ivan Octavio Ortiz Gallardo
===============================================================================
*/

CREATE OR REPLACE VIEW logistica.gaslp.union_balance_censo_cumplimiento_ducto AS

SELECT DISTINCT

    clasifica_terminal,
    Fecha_Conv,
    DescripciondeTerminal,

    -- =====================================================
    -- Indicadores de operación de ductos
    -- =====================================================

    SUM(ductos_TGL) / 1000 AS ductos_TGL_Mbd,

    SUM(CProgramada) / 1000 AS CProgramada_Mbd,

    SUM(Entrega_Tuxpan) / 1000 AS Entrega_Tuxpan_Mbd,

    SUM(Entrega_TGL) / 1000 AS Entrega_TGL_Mbd,

    AVG(Programa_Entrega_Tuxpan) / 1000 AS Programa_Entrega_Tuxpan_Mbd,

    SUM(Salidas_Totales) / 1000 AS Salidas_Totales_Mbd,

    SUM(Entregas_Totales) / 1000 AS Entregas_Totales_Mbd

FROM logistica.gaslp.union_balance_censo_cumplimiento_total

GROUP BY

    clasifica_terminal,
    Fecha_Conv,
    DescripciondeTerminal;
