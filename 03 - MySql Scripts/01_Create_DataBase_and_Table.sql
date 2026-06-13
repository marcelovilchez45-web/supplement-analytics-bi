CREATE DATABASE IF NOT EXISTS nutrition_analytics_db
    CHARACTER SET utf8mb4
    COLLATE utf8mb4_unicode_ci;

USE nutrition_analytics_db;

CREATE TABLE staging_supplement_data (
    -- Campos de auditoría técnica
    load_id INT AUTO_INCREMENT PRIMARY KEY,
    source_file VARCHAR(255) DEFAULT 'supplement_impact_data.csv',
    loaded_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    raw_row_hash VARCHAR(64),
    
    -- Datos del negocio
    athlete_id INT,
    age INT,
    gender VARCHAR(50),
    supplement VARCHAR(100),
    weeks INT,
    initial_wt DECIMAL(6,2),
    final_wt DECIMAL(6,2),
    strength_gain_raw VARCHAR(20), 
    primary_benefit VARCHAR(100)
);

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/dataset_limpio.csv'
INTO TABLE staging_supplement_data
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n' -- Ajustado al formato de salida estándar de Python
IGNORE 1 ROWS
(
    athlete_id, 
    age, 
    gender, 
    supplement, 
    weeks, 
    initial_wt, 
    final_wt, 
    strength_gain_raw, 
    primary_benefit
)
SET raw_row_hash = SHA2(CONCAT_WS('|', athlete_id, age, gender, supplement, weeks, initial_wt, final_wt, strength_gain_raw, primary_benefit), 256);