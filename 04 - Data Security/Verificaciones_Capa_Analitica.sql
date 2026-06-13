
-- 1. VALIDACIÓN DE CONCORDANCIA MÁXIMA (Reconciliación cuantitativa de hechos)
SELECT 
    (SELECT COUNT(*) FROM fact_supplement_performance) AS Total_Fact_Fisica,
    (SELECT COUNT(*) FROM vw_sem_powerbi_performance_facts) AS Total_Fact_Vista_Semantica,
    (SELECT SUM(weight_delta) FROM fact_supplement_performance) AS Suma_Delta_Fisico,
    (SELECT SUM(weight_delta) FROM vw_sem_powerbi_performance_facts) AS Suma_Delta_Semantico;
-- Resultado esperado: Ambos pares de columnas deben ser idénticos al centavo.

-- 2. DETECCIÓN DE FILAS HUÉRFANAS O UNIDAS AL MIEMBRO DESCONOCIDO
SELECT 
    COUNT(*) AS registros_asociados_a_unknown
FROM vw_sem_powerbi_performance_facts
WHERE athlete_key = -1 OR supplement_key = -1 OR benefit_key = -1;
-- Resultado esperado: 0 (Si da mayor a cero, indica fallas de integridad en dimensiones).

-- 3. VALIDACIÓN DE AGREGACIONES EXTREMAS (Consistencia estadística)
SELECT 
    MIN(strength_gain_ratio) AS min_fuerza,
    MAX(strength_gain_ratio) AS max_fuerza,
    AVG(strength_gain_ratio) AS avg_fuerza
FROM vw_anl_athlete_cohort_performance;
-- Permite validar que los ratios se mantengan en el rango decimal esperado (ej: 0.00 a 0.50).


   
   


