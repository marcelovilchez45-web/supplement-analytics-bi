
-- ==============================================================================
-- LEVEL 1: BASE VIEWS (Abstracción directa y gobierno de nulos)
-- ==============================================================================

CREATE OR REPLACE VIEW vw_base_athlete AS
SELECT 
    athlete_sk AS athlete_key,
    athlete_id AS natural_athlete_id,
    COALESCE(gender, 'Unknown') AS gender,
    COALESCE(age, 0) AS age,
    COALESCE(age_group, 'Unknown') AS age_group
FROM dim_athlete;

CREATE OR REPLACE VIEW vw_base_supplement AS
SELECT 
    supplement_sk AS supplement_key,
    COALESCE(supplement_name, 'Unknown') AS supplement_name
FROM dim_supplement;

CREATE OR REPLACE VIEW vw_base_benefit AS
SELECT 
    benefit_sk AS benefit_key,
    COALESCE(benefit_name, 'Unknown') AS primary_benefit_name
FROM dim_benefit;

CREATE OR REPLACE VIEW vw_base_supplement_performance AS
SELECT 
    fact_sk AS fact_key,
    athlete_sk AS athlete_key,
    supplement_sk AS supplement_key,
    benefit_sk AS benefit_key,
    COALESCE(cycle_weeks, 0) AS cycle_weeks,
    COALESCE(initial_wt, 0.00) AS initial_weight,
    COALESCE(final_wt, 0.00) AS final_weight,
    COALESCE(weight_delta, 0.00) AS weight_delta,
    COALESCE(strength_gain_pct, 0.0000) AS strength_gain_ratio,
    load_id AS batch_load_id
FROM fact_supplement_performance;

-- ==============================================================================
-- LEVEL 2: ANALYTICAL VIEWS (Joins y enriquecimiento trans-dimensional)
-- ==============================================================================

CREATE OR REPLACE VIEW vw_anl_athlete_cohort_performance AS
SELECT 
    f.fact_key,
    a.gender,
    a.age_group,
    s.supplement_name,
    b.primary_benefit_name,
    f.cycle_weeks,
    f.weight_delta,
    f.strength_gain_ratio,
    -- Clasificación operacional en base a resultados reales de fuerza
    CASE 
        WHEN f.strength_gain_ratio >= 0.20 THEN 'High Responder'
        WHEN f.strength_gain_ratio BETWEEN 0.10 AND 0.1999 THEN 'Moderate Responder'
        ELSE 'Low Responder'
    END AS athlete_response_cohort
FROM vw_base_supplement_performance f
LEFT JOIN vw_base_athlete a ON f.athlete_key = a.athlete_key
LEFT JOIN vw_base_supplement s ON f.supplement_key = s.supplement_key
LEFT JOIN vw_base_benefit b ON f.benefit_key = b.benefit_key;

-- ==============================================================================
-- LEVEL 3: KPI VIEWS (Agregaciones de alto nivel para negocio)
-- ==============================================================================

CREATE OR REPLACE VIEW vw_kpi_supplement_efficacy AS
SELECT 
    s.supplement_name,
    COUNT(DISTINCT f.athlete_key) AS active_athletes_count,
    AVG(f.cycle_weeks) AS average_weeks_duration,
    AVG(f.weight_delta) AS average_weight_change,
    AVG(f.strength_gain_ratio) * 100 AS average_strength_gain_percentage,
    -- Cálculo de KPI Estratégico integrado
    (AVG(f.strength_gain_ratio) / AVG(f.cycle_weeks)) * 100 AS efficiency_index_per_week
FROM vw_base_supplement_performance f
JOIN vw_base_supplement s ON f.supplement_key = s.supplement_key
GROUP BY s.supplement_name;

-- ==============================================================================
-- LEVEL 4: SEMANTIC VIEWS (Capa limpia para ingestión directa en Power BI)
-- ==============================================================================

CREATE OR REPLACE VIEW vw_sem_powerbi_performance_facts AS
SELECT 
    fact_key,
    athlete_key,
    supplement_key,
    benefit_key,
    cycle_weeks,
    initial_weight,
    final_weight,
    weight_delta,
    strength_gain_ratio,
    batch_load_id
FROM vw_base_supplement_performance;

-- Patrón conceptual de materialización programada (ETL Job)

CREATE TABLE summary_supplement_efficacy AS
SELECT * FROM vw_kpi_supplement_efficacy;

TRUNCATE TABLE summary_supplement_efficacy;
INSERT INTO summary_supplement_efficacy
SELECT * FROM vw_kpi_supplement_efficacy;

-- Alertas Operacionales: Implementamos vistas de excepciones analíticas para notificar al equipo de BI sobre anomalías severas:
CREATE OR REPLACE VIEW vw_err_quality_anomalies AS
SELECT fact_key, athlete_key, weight_delta, strength_gain_ratio
FROM vw_base_supplement_performance
WHERE strength_gain_ratio > 0.50 -- Alerta: Ganancia de fuerza superior al 50% (Outlier extremo)
   OR cycle_weeks > 52;          -- Alerta: Un ciclo de experimentación de más de un año
