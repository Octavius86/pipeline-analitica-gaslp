/*
===============================================================================
PROYECTO: Pipeline de Analítica para la Distribución de Gas LP

ARCHIVO:
01_union_balance_censo.sql

VISTA:
logistica.gaslp.union_balance_censo

DESCRIPCIÓN:
Integra la información del balance operativo con el censo operativo mediante la
clave del centro de trabajo. Esta vista constituye la base del pipeline
analítico y es utilizada por las vistas posteriores para el cálculo de
indicadores, análisis exploratorio y modelado predictivo.

TABLAS DE ORIGEN:
- logistica.gaslp.balance
- logistica.gaslp.censo_operativo

LLAVE DE INTEGRACIÓN:
balance.CENTRO = censo_operativo.Clave

SALIDA:
Vista: logistica.gaslp.union_balance_censo

AUTOR:
Iván Octavio Ortiz Gallardo
===============================================================================
*/

CREATE OR REPLACE VIEW logistica.gaslp.union_balance_censo AS

SELECT

    -- =====================================================
    -- Identificadores
    -- =====================================================

    b.CENTRO AS idclave,
    b.FECHA AS Fecha_Conv,

    -- =====================================================
    -- Variables del Balance Operativo
    -- =====================================================

    CAST(REPLACE(TRIM(CAST(b.PRODUCCION AS STRING)), ",", "") AS DECIMAL(18,2)) AS PRODUCCION,

    CAST(REPLACE(TRIM(CAST(b.DUCTO AS STRING)), ",", "") AS DECIMAL(18,2)) AS DUCTO,

    CAST(REPLACE(TRIM(CAST(b.RECIBOS AS STRING)), ",", "") AS DECIMAL(18,2)) AS RECIBOS,

    CAST(REPLACE(TRIM(CAST(b.EXISTENCIA_INICIAL AS STRING)), ",", "") AS DECIMAL(18,2)) AS EXISTENCIA_INICIAL,

    CAST(REPLACE(TRIM(CAST(b.TOTAL_RECIBO_DIARIO AS STRING)), ",", "") AS DECIMAL(18,2)) AS TOTAL_RECIBO_DIARIO,

    CAST(REPLACE(TRIM(CAST(b.NACIONAL AS STRING)), ",", "") AS DECIMAL(18,2)) AS NACIONAL,

    CAST(REPLACE(TRIM(CAST(b.TRASPASOS AS STRING)), ",", "") AS DECIMAL(18,2)) AS TRASPASOS,

    CAST(REPLACE(TRIM(CAST(b.CABOTAJE AS STRING)), ",", "") AS DECIMAL(18,2)) AS CABOTAJE,

    CAST(REPLACE(TRIM(CAST(b.EXPORTACION AS STRING)), ",", "") AS DECIMAL(18,2)) AS EXPORTACION,

    CAST(REPLACE(TRIM(CAST(b.ENTREGAS AS STRING)), ",", "") AS DECIMAL(18,2)) AS ENTREGAS,

    CAST(REPLACE(TRIM(CAST(b.EXISTENCIA_FINAL AS STRING)), ",", "") AS DECIMAL(18,2)) AS EXISTENCIA_FINAL,

    CAST(REPLACE(TRIM(CAST(b.EXISTENCIA_CALCULADA AS STRING)), ",", "") AS DECIMAL(18,2)) AS EXISTENCIA_CALCULADA,

    CAST(REPLACE(TRIM(CAST(b.V1 AS STRING)), ",", "") AS DECIMAL(18,2)) AS V1,

    CAST(REPLACE(TRIM(CAST(b.DIFERENCIA_EXISTENCIA AS STRING)), ",", "") AS DECIMAL(18,2)) AS DIFERENCIA_EXISTENCIA,

    CAST(REPLACE(TRIM(CAST(b.ERROR_BALANCE AS STRING)), ",", "") AS DECIMAL(18,2)) AS ERROR_BALANCE,

    CAST(REPLACE(TRIM(CAST(b.RECIBO_REFINACION AS STRING)), ",", "") AS DECIMAL(18,2)) AS RECIBO_REFINACION,

    CAST(REPLACE(TRIM(CAST(b.RECIBO_CABOTAJE AS STRING)), ",", "") AS DECIMAL(18,2)) AS RECIBO_CABOTAJE,

    CAST(REPLACE(TRIM(CAST(b.RECIBO_PEP AS STRING)), ",", "") AS DECIMAL(18,2)) AS RECIBO_PEP,

    CAST(REPLACE(TRIM(CAST(b.AUTOCONSUMO AS STRING)), ",", "") AS DECIMAL(18,2)) AS AUTOCONSUMO,

    -- =====================================================
    -- Variables del Censo Operativo
    -- =====================================================

    c.DescripciondeTerminal,

    CAST(REPLACE(TRIM(CAST(c.CapacidadOperativa AS STRING)), ",", "") AS DECIMAL(18,2)) AS CapacidadOperativa,

    c.latitud,

    c.longitud,

    CAST(REPLACE(TRIM(CAST(c.Fondaje AS STRING)), ",", "") AS DECIMAL(18,2)) AS Fondaje,

    CAST(REPLACE(TRIM(CAST(c.Salidas AS STRING)), ",", "") AS DECIMAL(18,2)) AS Salidas,

    c.SAP,

    CAST(REPLACE(TRIM(CAST(c.Densidad AS STRING)), ",", "") AS DECIMAL(18,2)) AS Densidad,

    CAST(REPLACE(TRIM(CAST(c.SalidaReal AS STRING)), ",", "") AS DECIMAL(18,2)) AS SalidaReal,

    CAST(REPLACE(TRIM(CAST(c.EntradaPromedio AS STRING)), ",", "") AS DECIMAL(18,2)) AS EntradaPromedio,

    CAST(REPLACE(TRIM(CAST(c.ReporteDiario AS STRING)), ",", "") AS DECIMAL(18,2)) AS ReporteDiario,

    CAST(REPLACE(TRIM(CAST(c.ReporteBalance AS STRING)), ",", "") AS DECIMAL(18,2)) AS ReporteBalance,

    CAST(REPLACE(TRIM(CAST(c.DiferenciaBalance AS STRING)), ",", "") AS DECIMAL(18,2)) AS DiferenciaBalance,

    c.GestiondeTerminal

FROM logistica.gaslp.balance b

INNER JOIN logistica.gaslp.censo_operativo c
    ON b.CENTRO = c.Clave;
