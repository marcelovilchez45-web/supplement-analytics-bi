-- ESTRATEGIA UNKNOWN MEMBER
-- Definiremos el registro SK = -1 en todas las dimensiones para manejar integridad referencial
-- en caso de que lleguen datos corruptos desde Staging.

-- Beneficio: Evita que el INNER JOIN del ETL descarte filas de la Fact Table 
-- (pérdida de métricas) si falla una Natural Key

INSERT INTO dim_athlete (athlete_sk, athlete_id, gender, age, age_group) 
VALUES (-1, -1, 'Unknown', -1, 'Unknown');

INSERT INTO dim_supplement (supplement_sk, supplement_name) 
VALUES (-1, 'Unknown');

INSERT INTO dim_benefit (benefit_sk, benefit_name) 
VALUES (-1, 'Unknown');

-- Cargar dim_athlete (incluyendo derivación de age_group)
INSERT INTO dim_athlete (athlete_id, gender, age, age_group)
SELECT DISTINCT 
    athlete_id, 
    COALESCE(gender, 'Unknown'), 
    age,
    CASE 
        WHEN age < 20 THEN 'Under 20'
        WHEN age BETWEEN 20 AND 39 THEN '20 - 39'
        WHEN age BETWEEN 40 AND 59 THEN '40 - 59'
        WHEN age >= 60 THEN '60+'
        ELSE 'Unknown'
    END
FROM staging_supplement_data
WHERE athlete_id IS NOT NULL;

-- Cargar dim_supplement
INSERT INTO dim_supplement (supplement_name)
SELECT DISTINCT COALESCE(supplement, 'Unknown')
FROM staging_supplement_data;

-- Cargar dim_benefit
INSERT INTO dim_benefit (benefit_name)
SELECT DISTINCT COALESCE(primary_benefit, 'Unknown')
FROM staging_supplement_data;

INSERT INTO fact_supplement_performance (
    athlete_sk, supplement_sk, benefit_sk, cycle_weeks, 
    initial_wt, final_wt, weight_delta, strength_gain_pct, load_id
)
SELECT 
    COALESCE(da.athlete_sk, -1),
    COALESCE(ds.supplement_sk, -1),
    COALESCE(db.benefit_sk, -1),
    stg.weeks,
    stg.initial_wt,
    stg.final_wt,
    (stg.final_wt - stg.initial_wt), 
    stg.strength_gain_raw, 
    stg.load_id
FROM staging_supplement_data stg
LEFT JOIN dim_athlete da ON stg.athlete_id = da.athlete_id
LEFT JOIN dim_supplement ds ON stg.supplement = ds.supplement_name
LEFT JOIN dim_benefit db ON stg.primary_benefit = db.benefit_name;

