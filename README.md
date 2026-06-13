# 📊 Sports Supplement Intelligence: Strategic Nutrition Optimization

![MySQL](https://img.shields.io/badge/MySQL-005C84?style=for-the-badge&logo=mysql&logoColor=white)
![Power BI](https://img.shields.io/badge/Power_BI-F2C811?style=for-the-badge&logo=powerbi&logoColor=black)
![SQL](https://img.shields.io/badge/SQL-4479A1?style=for-the-badge&logo=postgresql&logoColor=white)
![DAX](https://img.shields.io/badge/DAX-black?style=for-the-badge&logo=analytics&logoColor=white)

## 📌 Descripción del Proyecto
La nutrición deportiva a menudo opera bajo el "mito de la talla única". Este proyecto es una solución integral de **Business Intelligence** diseñada para convertir datos históricos de rendimiento en una estrategia de suplementación de precisión. Al cruzar métricas de ganancia de fuerza con cohortes demográficas, la solución identifica ineficiencias presupuestarias y propone una reestructuración de protocolos basada en evidencia, no en intuición.

---

## 📖 Storytelling: La Narrativa de los Datos
La inversión en suplementación deportiva solo es rentable si los resultados son tangibles y medibles.

1.  **El Problema:** La organización carecía de visibilidad sobre la eficacia real de los suplementos por segmentos de edad. Se aplicaban protocolos genéricos que resultaban en desperdicio de producto y suboptimización del rendimiento atlético en atletas senior.
2.  **El Enfoque:** Implementé una arquitectura de **Análisis de Cohortes**. En lugar de promediar resultados, segmentamos la respuesta metabólica/física, clasificando los suplementos según su eficacia real por rango de edad (18-29, 30-45, 46+).
3.  **La Conclusión:** Revelamos una paradoja operativa: el *Mass Gainer*, aunque efectivo en jóvenes, pierde su valor estratégico en atletas mayores de 46 años, mientras que la *Creatina* se mantiene como el activo más sólido y estable de la cartera, independientemente de la edad.

---

## 📐 Arquitectura Técnica

1.  **Data Foundation:** Procesamiento de datos de rendimiento mediante **MySQL**, aplicando normalización y limpieza para asegurar que cada métrica de "Strength Gain" fuera comparable entre cohortes.
2.  **Modeling:** Diseño de un **Esquema en Estrella (Star Schema)** que vincula los hechos de rendimiento con dimensiones críticas: Atleta, Suplemento y Tiempo.
3.  **Analytics Layer:** Desarrollo de **Vistas SQL** y lógica **DAX Avanzada** para calcular promedios dinámicos y métricas de desempeño, utilizando formateo condicional inteligente para resaltar anomalías (alertas de bajo rendimiento) vs. éxitos (estabilidad).

---

## 📊 Dashboard & Insights Clave

### 1. El Declive del Mass Gainer (Segmento 46+)
Identificamos un punto crítico: el *Mass Gainer* registra un rendimiento de apenas **8.6%** en atletas de 46+ años, un rendimiento significativamente inferior al esperado. Esto categoriza a este suplemento como una "ineficiencia operativa" para este segmento, sugiriendo la necesidad inmediata de ajustar las dosis o cambiar el protocolo.

![Análisis de Cohortes y Rendimiento](Imagenes/Matriz_de_Rendimiento.jpg)

### 2. El Estándar de Oro (Creatine Monohydrate)
A diferencia de otros productos, la *Creatina* demuestra una consistencia inquebrantable, manteniendo una ganancia de fuerza superior al **18%** en todas las edades. Este es el indicador clave que permite estandarizar protocolos de suplementación con riesgo mínimo.

![Análisis de Consistencia](Imagenes/Eficacia_Transversal.jpg)

---

## 🚀 Impacto y Valor de Negocio
* **Optimización de Recursos:** Identificación de ineficiencias en el gasto de suplementos para el segmento 46+, permitiendo reasignar presupuesto hacia productos con mayor ROI atlético.
* **Toma de Decisiones basada en Datos:** Sustitución de prescripciones basadas en marketing por recomendaciones basadas en el histórico de respuesta real de los atletas.
* **Escalabilidad Estratégica:** El modelo de dashboard permite replicar este análisis de cohortes en cualquier otra unidad de negocio o centro deportivo de la red.

---

## 👤 Sobre mí
Soy un **Senior Data Analyst y BI Consultant** con un enfoque pragmático: si el dato no ayuda a tomar una mejor decisión o a mejorar un resultado, no merece estar en el tablero. Mi trabajo combina la ingeniería de datos con la consultoría estratégica para transformar indicadores técnicos en valor de negocio.

Mi metodología se basa en:
* **Storytelling Analítico:** Traduzco métricas complejas a un lenguaje que el negocio entiende y puede ejecutar.
* **Diseño de Autoridad:** Dashboards que no solo muestran datos, sino que guían la mirada del decisor hacia los puntos de fricción y oportunidad.
* **Rigurosidad Técnica:** Dominio de SQL y DAX para construir cimientos sólidos que aseguren que la verdad de los datos no se pierda en el proceso.

---

## 💼 Servicios & Colaboración
* **End-to-End Analytics:** Desde la limpieza y modelado en MySQL hasta la visualización en Power BI.
* **Consultoría de BI:** Auditoría de modelos de datos, optimización de DAX y diseño de matrices de decisión.
* **Data-Driven Strategy:** Análisis de ineficiencias operativas mediante modelos dimensionales.

---
_Proyecto desarrollado en 2026 como parte de mi portafolio profesional de Business Intelligence y Consultoría Analítica._
