
-- Verificaciones de la Carga de Datos

-- Queries de validacion Post-Carga

-- Conteo de registros ingresados:

SELECT COUNT(*) AS total_registros
FROM staging_supplement_data;

-- Revisión visual inicial:

SELECT *
FROM staging_supplement_data
LIMIT 20;

-- Detección de duplicados exactos usando el hash de la fila:

SELECT raw_row_hash, COUNT(*) AS repeticiones
FROM staging_supplement_data
GROUP BY raw_row_hash
HAVING COUNT(*) > 1;

-- Detección de nulos o campos vacíos en identificadores clave:

SELECT 
    SUM(athlete_id IS NULL) AS nulos_id,
    SUM(age IS NULL) AS nulos_edad,
    SUM(initial_wt IS NULL) AS nulos_peso
FROM staging_supplement_data;

-- Validación de espacios no deseados al inicio/final en variables categóricas:

SELECT athlete_id, primary_benefit
FROM staging_supplement_data
WHERE primary_benefit <> TRIM(primary_benefit);




