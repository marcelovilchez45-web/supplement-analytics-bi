-- Desactivamos la verificación de llaves foráneas temporalmente
SET FOREIGN_KEY_CHECKS = 0;

-- Ahora podemos truncar sin restricciones de orden
TRUNCATE TABLE fact_supplement_performance;
TRUNCATE TABLE dim_athlete;
TRUNCATE TABLE dim_supplement;
TRUNCATE TABLE dim_benefit;

-- Reactivamos la verificación de integridad (MUY IMPORTANTE)
SET FOREIGN_KEY_CHECKS = 1;

