# Análisis de Riesgo de Activos por Sucursal | SQL

## 📌 Descripción del proyecto

Proyecto práctico de análisis de datos enfocado en evaluar el estado de los activos de diferentes sucursales e identificar posibles niveles de riesgo operativo.

El análisis combina información de sucursales y activos para calcular qué proporción de los activos se encuentra inactiva o en mantenimiento.

## 🎯 Objetivo

El objetivo de este proyecto es:

- Analizar los activos por sucursal.
- Contar activos activos, inactivos y en mantenimiento.
- Calcular el coste total de los activos.
- Revisar la inversión realizada por sucursal.
- Calcular un porcentaje de riesgo por sucursal.
- Clasificar cada sucursal según su nivel de riesgo.

## 🛠️ Herramientas y conceptos SQL utilizados

- MySQL
- MySQL Workbench
- CTEs (`WITH`)
- `INNER JOIN`
- `COUNT()`
- `SUM()`
- `MAX()`
- `ROUND()`
- `CASE`
- `GROUP BY`
- `HAVING`
- `ORDER BY`

## 📊 Lógica del riesgo

El porcentaje de riesgo se calcula de la siguiente manera:

```sql
(Activos inactivos + Activos en mantenimiento)
/
Total de activos * 100
```

Las sucursales se clasifican así:

- **Riesgo alto:** 50 % o más
- **Riesgo medio:** entre 25 % y 49,99 %
- **Riesgo bajo:** menos del 25 %

## 🧠 Estructura de la consulta

La consulta utiliza dos CTE encadenados.

### 1. `branch_risk`

El primer CTE agrupa la información de sucursales y activos e incluye:

- Total de activos activos.
- Total de activos inactivos.
- Total de activos en mantenimiento.
- Total general de activos.
- Coste total de los activos.
- Inversión de la sucursal.

### 2. `risk`

El segundo CTE utiliza los resultados de `branch_risk` para calcular el porcentaje de riesgo de cada sucursal.

Posteriormente, el `SELECT` final utiliza una sentencia `CASE` para clasificar cada sucursal según su nivel de riesgo.

## 📷 Consulta SQL

### Parte 1

![Consulta SQL - Parte 1](branch_asset_risk_analysis1.png)

### Parte 2

![Consulta SQL - Parte 2](branch_asset_risk_analysis2.png)

## 💡 Aprendizajes

Este ejercicio me ayudó a comprender mejor cómo los CTE encadenados pueden simplificar consultas SQL más complejas.

En lugar de repetir expresiones largas de agregación, pude crear resultados intermedios y reutilizarlos en cálculos posteriores.

También practiqué cómo combinar información de distintas tablas mediante `JOIN`, utilizar funciones de agregación y transformar datos operativos en indicadores útiles para reporting, análisis y toma de decisiones.

## 🚀 Competencias practicadas

- Creación y uso de CTEs.
- Unión de tablas mediante `INNER JOIN`.
- Agregación de datos por sucursal.
- Uso de lógica condicional con `CASE`.
- Creación de indicadores porcentuales.
- Clasificación de resultados según reglas de negocio.
- Ordenación y filtrado de resultados agregados.

---

Proyecto práctico desarrollado como parte de mi formación en Análisis de Datos e Inteligencia de Negocio.
