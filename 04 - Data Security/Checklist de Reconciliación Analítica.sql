
-- 1. CONTROL DE VOLUMETRÍA BASE
-- En MySQL (Capa Relacional):
SELECT COUNT(*) FROM fact_supplement_performance;
-- En Power BI (Capa Semántica) evaluar la medida: 
-- [Total_Performance_Rows] en una tarjeta visual sin filtros.
-- Criterio de Aceptación: Ambos valores deben ser exactamente 1,000.

-- 2. CONTROL DE INTEGRIDAD CUANTITATIVA (MÉTRICAS ADITIVAS)
-- En MySQL (Capa Relacional):
SELECT SUM(cycle_weeks) AS TotalSemanasSQL FROM fact_supplement_performance;
-- En Power BI (Capa Semántica) evaluar la medida: 
-- [Total_Cycle_Weeks] en una tarjeta visual sin filtros.
-- Criterio de Aceptación: El resultado numérico de la suma debe coincidir al entero.

-- 3. VALIDACIÓN DE CÁLCULO PROMEDIO (MÉTRICAS NO ADITIVAS)
-- En MySQL (Capa Relacional):
SELECT AVG(strength_gain_pct) AS AvgFuerzaSQL FROM fact_supplement_performance;
-- En Power BI (Capa Semántica) evaluar la medida: 
-- [Avg_Strength_Gain_Pct] configurada con formato de porcentaje.
-- Criterio de Aceptación: La coincidencia debe ser exacta hasta el cuarto dígito decimal.