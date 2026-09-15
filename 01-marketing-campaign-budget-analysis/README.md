# 📈 Marketing Campaign Budget Analysis

Proyecto de análisis de campañas de marketing utilizando SQL para clasificar presupuestos y comparar el gasto real frente al presupuesto asignado.

## 🎯 Objetivo del análisis

El objetivo de este proyecto es analizar diferentes campañas de marketing y clasificarlas según su nivel de presupuesto, además de identificar si el gasto real de cada campaña se encuentra por encima o dentro del presupuesto asignado.

## ❓ Preguntas de negocio

- ¿Qué campañas tienen un presupuesto bajo, medio o alto?
- ¿Qué campañas han superado el presupuesto asignado?
- ¿Qué campañas se mantienen dentro del presupuesto?
- ¿Cómo puede utilizarse esta clasificación para facilitar el seguimiento financiero de campañas?

## 🛠️ Herramientas utilizadas

- SQL

## 🧠 Conceptos aplicados

- SELECT
- CASE WHEN
- Alias
- Comparaciones
- Lógica condicional
- Clasificación de datos
- Análisis de negocio

## 📊 Lógica utilizada

Las campañas se clasifican según su presupuesto:

- Hasta 10.000 → Low budget
- Entre 10.001 y 25.000 → Decent budget
- Más de 25.000 → High budget

También se compara el gasto real con el presupuesto:

- Si el gasto real supera el presupuesto → Over budget
- Si no lo supera → Within budget

## 💻 Consulta SQL

La consulta completa se encuentra en:

`marketing_campaign_analysis.sql`

## 💡 Resultado

La consulta permite obtener una visión rápida de:

- La categoría presupuestaria de cada campaña.
- Las campañas que presentan desviaciones de gasto.
- Las campañas que se mantienen dentro del presupuesto previsto.

## 📌 Habilidades demostradas

Este proyecto demuestra capacidad para:

- Aplicar lógica condicional en SQL.
- Clasificar información según reglas de negocio.
- Comparar resultados reales frente a objetivos.
- Transformar datos en información útil para la toma de decisiones.
