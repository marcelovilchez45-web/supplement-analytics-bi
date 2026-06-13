-- Verificaciones de Postcarga

-- 1. Integridad Referencial (Buscar huérfanos):
SELECT f.fact_sk
FROM fact_supplement_performance f
WHERE f.athlete_sk = -1 OR f.supplement_sk = -1 OR f.benefit_sk = -1;

-- 2. Reconciliación de Granularidad (Conteo Staging vs Fact):
SELECT 
    (SELECT COUNT(*) FROM staging_supplement_data) AS Total_Staging,
    (SELECT COUNT(*) FROM fact_supplement_performance) AS Total_Fact;
-- Deben ser exactamente iguales.

-- 3. Calidad de Datos (Métricas Anómalas):
SELECT fact_sk, weight_delta 
FROM fact_supplement_performance
WHERE weight_delta > 50 OR weight_delta < -50; -- Detectar outliers extremos físicos



