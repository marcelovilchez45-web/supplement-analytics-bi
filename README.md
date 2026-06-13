# 📊 Sports Supplement Intelligence: Strategic Nutrition Optimization

![Python](https://img.shields.io/badge/Python-3776AB?style=for-the-badge&logo=python&logoColor=white)
![MySQL](https://img.shields.io/badge/MySQL-005C84?style=for-the-badge&logo=mysql&logoColor=white)
![Power BI](https://img.shields.io/badge/Power_BI-F2C811?style=for-the-badge&logo=powerbi&logoColor=black)
![SQL](https://img.shields.io/badge/SQL-4479A1?style=for-the-badge&logo=postgresql&logoColor=white)
![DAX](https://img.shields.io/badge/DAX-black?style=for-the-badge&logo=analytics&logoColor=white)

## 📌 Descripción del Proyecto
La nutrición deportiva a menudo opera bajo el "mito de la talla única". Esta solución integral de **Business Intelligence** transforma datos históricos de rendimiento en una estrategia de suplementación de precisión. Cruzando métricas biométricas con cohortes demográficas, el modelo identifica ineficiencias presupuestarias y propone reestructurar protocolos basados en evidencia técnica.

---

## 📖 Storytelling: La Narrativa de los Datos
La inversión en suplementos solo es rentable si los resultados son medibles.

1.  **El Problema:** Falta de visibilidad sobre la eficacia real por segmento. Se prescribían protocolos genéricos, causando desperdicio de producto y suboptimización en atletas senior.
2.  **El Enfoque:** Implementé una arquitectura de **Análisis de Cohortes**. Segmentamos la respuesta metabólica, midiendo la eficacia integral (Tasa de Logro en Aumento de Peso Neto, Fuerza y Resistencia) por rangos de edad y género.
3.  **La Conclusión:** Revelamos una paradoja operativa: el *Mass Gainer*, efectivo en jóvenes, es altamente ineficiente en atletas mayores de 46 años. Por el contrario, la *Creatina* se consolida como el activo de mayor rendimiento transversal.

---

## 📐 Arquitectura Técnica

1.  **Data Preparation (Python):** Script ETL (`pandas`) para limpieza de registros brutos. Conversión de métricas de cadena a decimales (Strength Gain) y estandarización (TRIM) de dimensiones categóricas para garantizar integridad relacional.
2.  **Data Foundation (MySQL):** Estructuración en base de datos y diseño de un **Esquema en Estrella (Star Schema)**, vinculando la tabla de hechos (rendimiento) con sus dimensiones (Atleta, Suplemento).
3.  **Analytics Layer (Power BI & DAX):** Desarrollo de lógicas avanzadas para calcular la *Tasa de Logro (TLAP)* y promedios dinámicos. Uso de matrices con formateo condicional para exponer desviaciones de negocio visualmente.

---

## 📊 Dashboard & Insights Clave

### 1. Panel Ejecutivo de Eficacia Biométrica
Visión global del rendimiento. Demuestra que el programa logra un sólido **87.53% de TLAP** y un aumento general del 15.52% en fuerza. Este panel permite auditar qué combinaciones de suplementos traccionan estos promedios al alza.

![Panel Ejecutivo de Eficacia Biométrica](Panel_Ejecutivo_de_Eficacia_Biometrica.png)

### 2. Análisis de Cohortes Demográficas: El Declive del Mass Gainer
El cruce crítico del modelo. Expone que el *Mass Gainer* registra apenas un **8.66%** de ganancia de fuerza en atletas de 46+ años (Alerta Roja). Se cataloga como ineficiencia operativa, exigiendo un ajuste inmediato. En contraste, la *Creatina* sostiene un éxito del **18.58%** (Zona Verde).

![Análisis de Cohortes Demográficas](Analisis_de_Cohortes_Demograficas.jpg)

---

## 🚀 Impacto y Valor de Negocio
* **Optimización de Presupuesto:** Identificación de ineficiencias en el segmento 46+, permitiendo reasignar capital hacia productos con mayor ROI.
* **Prescripción Basada en Datos:** Transición de protocolos genéricos a recomendaciones sustentadas en el histórico real de los atletas.
* **Escalabilidad:** Arquitectura limpia y robusta, lista para integrar nuevos centros deportivos sin alterar el modelo base.

---

## 👤 Sobre mí
Soy **Marccell Alejandro Vilchez Calero**, profesional en Contabilidad Pública y Finanzas con especialización en **Data Analysis & Business Intelligence**. Combino el rigor financiero con la ingeniería de datos: si una métrica no impulsa una decisión operativa o reduce costos, no tiene lugar en el dashboard.

Mi metodología:
* **Asertividad Analítica:** Propongo las respuestas operativas que el negocio necesita para liderar su sector.
* **Diseño de Autoridad:** Visualizaciones limpias (*Data-Ink Ratio*) que dirigen la mirada inmediatamente al riesgo o la oportunidad.
* **Eficiencia Técnica:** Dominio integrado de Python, SQL, DAX y Power BI para construir soluciones sólidas de extremo a extremo.

---

## 💼 Servicios & Colaboración
* **End-to-End Analytics:** Desde ETL en Python y MySQL hasta storytelling ejecutivo en Power BI.
* **Auditoría de BI:** Optimización de modelos de datos, DAX y diseño de matrices estratégicas.
* **Data-Driven Strategy:** Análisis de cuellos de botella y eficiencia mediante datos.

---
_Proyecto finalizado en 2026 como parte de mi portafolio profesional de Business Intelligence._
