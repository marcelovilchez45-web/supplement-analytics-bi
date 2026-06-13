-- Modelado 

-- DIMENSIONES
CREATE TABLE dim_athlete (
    athlete_sk INT AUTO_INCREMENT PRIMARY KEY,
    athlete_id INT, -- Natural Key
    gender VARCHAR(50),
    age INT,
    age_group VARCHAR(20), -- Jerarquía analítica derivada
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB;

CREATE TABLE dim_supplement (
    supplement_sk INT AUTO_INCREMENT PRIMARY KEY,
    supplement_name VARCHAR(100),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB;

CREATE TABLE dim_benefit (
    benefit_sk INT AUTO_INCREMENT PRIMARY KEY,
    benefit_name VARCHAR(100),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB;

-- TABLA DE HECHOS
CREATE TABLE fact_supplement_performance (
    fact_sk BIGINT AUTO_INCREMENT PRIMARY KEY,
    athlete_sk INT NOT NULL,
    supplement_sk INT NOT NULL,
    benefit_sk INT NOT NULL,
    cycle_weeks INT,
    initial_wt DECIMAL(6,2),
    final_wt DECIMAL(6,2),
    weight_delta DECIMAL(6,2), -- Pre-calculado para rendimiento
    strength_gain_pct DECIMAL(5,4),
    load_id INT, -- Trazabilidad con staging
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_fact_athlete FOREIGN KEY (athlete_sk) REFERENCES dim_athlete(athlete_sk),
    CONSTRAINT fk_fact_supp FOREIGN KEY (supplement_sk) REFERENCES dim_supplement(supplement_sk),
    CONSTRAINT fk_fact_benefit FOREIGN KEY (benefit_sk) REFERENCES dim_benefit(benefit_sk)
) ENGINE=InnoDB;

-- Índices recomendados para ETL y Reporting
CREATE INDEX idx_fact_athlete ON fact_supplement_performance(athlete_sk);
CREATE INDEX idx_fact_supp ON fact_supplement_performance(supplement_sk);
CREATE INDEX idx_fact_benefit ON fact_supplement_performance(benefit_sk);

