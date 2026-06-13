# 📖 Diccionario de Datos y Arquitectura Semántica: Sports Supplement Intelligence

Este documento define la estructura del modelo relacional, la gobernanza de la capa analítica y la lógica de negocio aplicada en las métricas del proyecto. Sirve como fuente única de la verdad para analistas, ingenieros de datos y stakeholders de negocio.

---

## 1. Modelo Dimensional (Star Schema)

El modelo de la base de datos **`nutrition_analytics_db`** está optimizado para flujos de Business Intelligence en Power BI, aislando el contexto descriptivo (Dimensiones) de las métricas cuantitativas (Hechos).

### 🗂️ Tabla: `dim_athlete` (Dimensión)
Almacena la información demográfica de los usuarios sometidos a los protocolos de suplementación.
*Nota: Todas las llaves sustitutas y campos de unión están ocultos en la vista de reporte.*

| Nombre Técnico | Nombre de Negocio (PBI) | Tipo de Dato | Descripción de Negocio | Transformación (ETL / Python) |
| :--- | :--- | :--- | :--- | :--- |
| `athlete_id` | *Oculto* | INT | Clave primaria (PK) del atleta. | Generado autoincremental en MySQL. |
| `gender` | **Género** | VARCHAR / Texto | Género del atleta (Ej. Male, Female). | Limpieza de espacios con `TRIM()` / `str.strip()`. |
| `age` | **Edad** | INT / Entero | Edad biológica del atleta al momento del estudio. | N/A |
| `age_group` | **Grupo de Edad** | VARCHAR / Texto | Cohorte demográfica para análisis de rendimiento. | Calculado: `18-29`, `30-45`, `46+`. |

### 🗂️ Tabla: `dim_supplement` (Dimensión)
Catálogo de productos e insumos nutricionales administrados en el estudio.

| Nombre Técnico | Nombre de Negocio (PBI) | Tipo de Dato | Descripción de Negocio | Transformación (ETL / Python) |
| :--- | :--- | :--- | :--- | :--- |
| `supplement_id` | *Oculto* | INT | Clave primaria (PK) del suplemento. | Generado autoincremental en MySQL. |
| `supplement_name`| **Suplemento** | VARCHAR / Texto | Nombre comercial o genérico del producto. | Limpieza de espacios con `TRIM()`. |
| `primary_benefit`| **Beneficio Primario Objetivo** | VARCHAR / Texto | Objetivo clínico principal del producto. | Limpieza de espacios con `TRIM()`. |

### 📊 Tabla: `nutrition_analytics_db fact_supplement_performance'` (Hechos)
Registra las métricas físicas transaccionales y el impacto del suplemento en cada ciclo de atleta.

| Nombre Técnico | Nombre de Negocio (PBI) | Tipo de Dato | Descripción de Negocio | Transformación (ETL / Python) |
| :--- | :--- | :--- | :--- | :--- |
| `performance_id`| *Oculto* | INT | Clave primaria (PK) del registro de rendimiento. | Generado autoincremental. |
| `athlete_id` | *Oculto* | INT | Clave foránea (FK). Conecta con `dim_athlete`. | N/A |
| `supplement_id`| *Oculto* | INT | Clave foránea (FK). Conecta con `dim_supplement`. | N/A |
| `cycle_weeks` | **Semanas de Ciclo** | INT | Duración del tratamiento experimental en semanas. | N/A |
| `weight_delta` | **Delta de Peso** | DECIMAL | Variación neta de peso corporal registrada (Kg). | N/A |
| `strength_gain_ratio` | *Oculto* (Usar Medida)| DECIMAL | Incremento de fuerza bruta respecto a la línea base. | Eliminación de `%` y conversión a decimal (Ej. `8%` → `0.08`). |

---

* **DAX:**
  ```dax
  Total_Performance_Rows = COUNTROWS('fact_supplement_performance')
