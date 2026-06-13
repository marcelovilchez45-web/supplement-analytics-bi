# 📖 Diccionario de Datos: Sports Supplement Intelligence

Este documento define la estructura del modelo relacional (Esquema en Estrella) y la lógica de negocio aplicada en las métricas del proyecto. Sirve como fuente de la verdad para analistas, ingenieros de datos y stakeholders de negocio.

---

## 1. Modelo Dimensional (Star Schema)

El modelo está optimizado para flujos de Business Intelligence en Power BI, separando el contexto descriptivo (Dimensiones) de las métricas cuantitativas (Hechos).

### 🗂️ Tabla: `dim_athlete` (Dimensión)
Almacena la información demográfica de los usuarios sometidos a los protocolos de suplementación.

| Columna | Tipo de Dato (SQL / PBI) | Descripción de Negocio | Transformación (ETL) |
| :--- | :--- | :--- | :--- |
| `athlete_id` | INT / Entero | Clave primaria (PK). Identificador único del atleta. | Generado autoincremental en MySQL. |
| `gender` | VARCHAR / Texto | Género del atleta (Ej. Male, Female). | Limpieza de espacios con `TRIM()` en Python. |
| `age` | INT / Entero | Edad biológica del atleta al momento del estudio. | N/A |
| `age_group` | VARCHAR / Texto | Cohorte demográfica para análisis de rendimiento. | Calculado: `18-29`, `30-45`, `46+`. |

### 🗂️ Tabla: `dim_supplement` (Dimensión)
Catálogo de productos e insumos nutricionales administrados en el estudio.

| Columna | Tipo de Dato | Descripción de Negocio | Transformación (ETL) |
| :--- | :--- | :--- | :--- |
| `supplement_id` | INT / Entero | Clave primaria (PK). Identificador único del suplemento. | Generado autoincremental en MySQL. |
| `supplement_name` | VARCHAR / Texto | Nombre comercial o genérico (Ej. Creatine Monohydrate, Mass Gainer, Both). | Limpieza de espacios con `TRIM()`. |
| `primary_benefit` | VARCHAR / Texto | Objetivo clínico principal del producto (Ej. Strength, Weight, Endurance). | Limpieza de espacios con `TRIM()`. |

### 📊 Tabla: `fact_supplement_performance` (Hechos)
Registra los resultados biométricos y el impacto del suplemento en cada atleta.

| Columna | Tipo de Dato | Descripción de Negocio | Transformación (ETL) |
| :--- | :--- | :--- | :--- |
| `performance_id` | INT / Entero | Clave primaria (PK) del registro de rendimiento. | Generado autoincremental. |
| `athlete_id` | INT / Entero | Clave foránea (FK). Conecta con `dim_athlete`. | N/A |
| `supplement_id`| INT / Entero | Clave foránea (FK). Conecta con `dim_supplement`. | N/A |
| `weight_delta` | DECIMAL / Decimal | Variación neta de peso corporal registrada (en Kg o Lbs). Puede ser negativa. | N/A |
| `strength_gain`| DECIMAL / Porcentaje | Incremento de fuerza bruta respecto a la línea base del atleta. | Eliminación de `%` y conversión a decimal (Ej. `8%` → `0.08`) en Python. |

---

## 2. Catálogo de Medidas DAX (Business Logic)

Las siguientes métricas fueron calculadas en la capa semántica (Power BI) para responder a las preguntas estratégicas del negocio:

| Nombre de la Medida | Fórmula Principal (Lógica) | Descripción y Uso |
| :--- | :--- | :--- |
| **Total Registros** | `COUNTROWS('fact_supplement_performance')` | Volumen total de evaluaciones realizadas. Base para denominadores. |
| **Avg Strength Gain** | `AVERAGE('fact_performance'[strength_gain])` | Promedio de ganancia de fuerza. Usado para comparar eficacia entre suplementos. |
| **TLAP (%)** | `DIVIDE(AtletasConGanancia, TotalAtletas, 0)` *Nota: Usa `ALL()` en el denominador.* | **Tasa de Logro en Aumento de Peso Neto.** Mide el porcentaje de atletas que lograron un `weight_delta > 0`, ignorando filtros cruzados que puedan distorsionar el total. |
| **Indicador Rendimiento** | `SWITCH(TRUE(), Rendimiento <= Promedio * 0.85, 1 ...)` | Asigna un valor entero (1=Riesgo, 2=Neutro, 3=Éxito) evaluando dinámicamente cada celda contra el promedio global. Desbloquea las reglas de iconos en PBI. |

---
*Documentación generada y auditada para asegurar la reproducibilidad técnica y la gobernanza de los datos.*
