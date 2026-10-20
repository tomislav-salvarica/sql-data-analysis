
# 📊 Proyecto 12 | Rendimiento y eficiencia de campañas de marketing

## 🎯 Objetivo

Analizar el rendimiento de 500 campañas publicitarias para comparar canales de marketing, evaluar la eficiencia de la inversión e identificar posibles oportunidades de optimización.

El proyecto combina **MySQL, SQL, Power BI y DAX** para estudiar impresiones, clics, conversiones, gasto publicitario, ingresos atribuidos y retorno de la inversión publicitaria (ROAS).

> **Nota:** Los datos utilizados son ficticios y se emplean exclusivamente con fines de aprendizaje y portfolio.

---

## 🛠️ Herramientas utilizadas

- **MySQL Workbench:** consultas SQL y validación de resultados.
- **SQL:** SUM(), GROUP BY, ROUND(), NULLIF() y ORDER BY.
- **Power BI Desktop:** construcción del dashboard interactivo.
- **Power Query:** revisión de tipos de datos, calidad y traducción de categorías.
- **DAX:** medidas dinámicas, contexto de filtros y formato condicional.

---

## 🗂️ Fuente de datos

**Base de datos:** `sql_powerbi_practice`

**Tabla:** `marketing_campaigns_500`

**Registros:** 500 campañas publicitarias.

### Variables analizadas

| Campo | Descripción |
|---|---|
| `campaign_id` | Identificador de campaña |
| `campaign_name` | Nombre de la campaña |
| `channel` | Canal publicitario |
| `campaign_type` | Tipo de campaña |
| `target_region` | Región objetivo |
| `start_date` | Fecha de inicio |
| `end_date` | Fecha de finalización |
| `budget` | Presupuesto asignado |
| `spend` | Gasto publicitario |
| `impressions` | Impresiones registradas |
| `clicks` | Clics registrados |
| `conversions` | Conversiones registradas |
| `revenue_attributed` | Ingresos atribuidos a la campaña |

---

## 💻 Análisis SQL

Se desarrollaron dos consultas principales.

### Consulta 1. Rendimiento general por canal

Esta consulta permite comparar los indicadores globales de cada canal publicitario.

```sql
SELECT
    channel,
    SUM(impressions) AS total_impresiones,
    SUM(clicks) AS total_clicks,
    SUM(conversions) AS total_conversiones,
    ROUND(
        SUM(clicks) / NULLIF(SUM(impressions), 0) * 100,
        2
    ) AS CTR_porcentaje,
    ROUND(
        SUM(conversions) / NULLIF(SUM(clicks), 0) * 100,
        2
    ) AS tasa_conversion_porcentaje,
    SUM(revenue_attributed) AS ingresos_atribuidos,
    SUM(spend) AS gasto_publicitario,
    ROUND(
        SUM(revenue_attributed) / NULLIF(SUM(spend), 0),
        2
    ) AS ROAS
FROM sql_powerbi_practice.marketing_campaigns_500
GROUP BY channel
ORDER BY ROAS DESC;
```

### Consulta 2. Rendimiento por canal y tipo de campaña

La segunda consulta amplía el análisis para identificar diferencias de rendimiento entre campañas de conversión, retención, reconocimiento e interacción dentro de cada canal.

Se reutilizan los mismos indicadores de la consulta anterior, añadiendo `campaign_type` al `SELECT` y a la agrupación:

```sql
GROUP BY channel, campaign_type
ORDER BY ROAS DESC;
```

Ambas consultas completas se encuentran en el archivo SQL del proyecto.

---

## 🧮 Indicadores DAX

Para Power BI se importaron los 500 registros originales, sin agrupación previa, con el objetivo de conservar la capacidad de análisis interactivo.

### Medidas principales

```dax
Total Impresiones =
SUM('Campañas_Marketing'[impressions])
```

```dax
Total Clics =
SUM('Campañas_Marketing'[clicks])
```

```dax
Total Conversiones =
SUM('Campañas_Marketing'[conversions])
```

```dax
CTR =
DIVIDE([Total Clics], [Total Impresiones], 0)
```

```dax
Tasa de Conversión =
DIVIDE([Total Conversiones], [Total Clics], 0)
```

```dax
Gasto Publicitario =
SUM('Campañas_Marketing'[spend])
```

```dax
Ingresos Atribuidos =
SUM('Campañas_Marketing'[revenue_attributed])
```

```dax
ROAS =
DIVIDE([Ingresos Atribuidos], [Gasto Publicitario], 0)
```

Las medidas se recalculan automáticamente según el contexto de filtros, evitando promediar incorrectamente porcentajes o ratios de diferentes campañas.

### Formato condicional dinámico

Se creó una medida adicional para destacar en coral el canal con mayor ROAS dentro de la selección actual.

```dax
Color ROAS =
VAR MaximoROAS =
    MAXX(
        ALLSELECTED('Campañas_Marketing'[channel]),
        [ROAS]
    )
RETURN
    IF(
        [ROAS] = MaximoROAS,
        "#FF8066",
        "#C5F277"
    )
```

Este formato permite que el color destacado cambie cuando se filtran los tipos de campaña.

---

## 📈 Dashboard interactivo

El informe presenta:

- Ocho indicadores KPI.
- ROAS por canal publicitario.
- Comparación entre ingresos atribuidos y gasto publicitario.
- CTR y tasa de conversión por canal.
- ROAS por tipo de campaña.
- Distribución porcentual del gasto publicitario mediante gráfico de anillos.
- Filtros interactivos por canal y tipo de campaña.
- Interacciones entre visualizaciones.
- Formato condicional dinámico mediante DAX.

### Vista general

![Dashboard de rendimiento de campañas](dashboard1.png)

---

## 📊 Resultados generales

| Indicador | Resultado aproximado |
|---|---:|
| Campañas analizadas | 500 |
| Impresiones | 372,18 millones |
| Clics | 26,80 millones |
| Conversiones | 2,48 millones |
| CTR | 7,20 % |
| Tasa de conversión | 9,27 % |
| Gasto publicitario | 14,51 M€ |
| Ingresos atribuidos | 199,87 M€ |
| ROAS global | 13,78 |

### ROAS por canal

| Canal | ROAS |
|---|---:|
| Email | 16,79 |
| Meta | 16,68 |
| Affiliate | 14,43 |
| TikTok | 13,26 |
| Google | 13,24 |
| YouTube | 11,95 |
| LinkedIn | 10,38 |

### ROAS por tipo de campaña

| Tipo | ROAS |
|---|---:|
| Retención | 14,86 |
| Conversión | 14,19 |
| Reconocimiento | 13,48 |
| Interacción | 12,75 |

---

## 💡 Principales hallazgos

### 1. Email presenta el mayor ROAS global

Email obtiene un ROAS de 16,79, ligeramente superior al de Meta (16,68).

Sin embargo, esta diferencia no es suficiente por sí sola para recomendar trasladar inversión de un canal a otro.

### 2. Meta genera más ingresos atribuidos

Meta registra aproximadamente 36,15 M€ de ingresos atribuidos, frente a los 28,88 M€ de Email.

Esto demuestra que un mayor volumen de ingresos no implica necesariamente un mayor ROAS.

### 3. Los resultados cambian según el tipo de campaña

Las campañas de retención tienen el ROAS agregado más elevado (14,86).

Al analizar únicamente el canal Meta y las campañas de retención, el ROAS aumenta hasta 30,58.

Esto evidencia la importancia de analizar conjuntamente los canales y los objetivos de campaña.

### 4. El CTR y la tasa de conversión miden aspectos distintos

Email presenta el mayor CTR (7,86 %), mientras Meta lidera la tasa de conversión (10,41 %).

Un canal puede generar proporcionalmente más clics sin ser el que registra más conversiones por clic.

### 5. El ROAS no equivale al beneficio neto

El ROAS relaciona ingresos atribuidos con gasto publicitario, pero no incluye todos los costes de la empresa.

Antes de modificar presupuestos sería necesario investigar márgenes, atribución, objetivos de campaña y rendimiento de inversiones adicionales.

---

## 🚀 Aprendizajes del proyecto

- Cálculo de indicadores publicitarios mediante SQL.
- Prevención de divisiones entre cero utilizando NULLIF().
- Agrupaciones por canal y tipo de campaña.
- Diferencia entre ratios agregados y promedios simples.
- Creación de medidas DAX reutilizables.
- Uso de DIVIDE() y contexto de filtros.
- Validación de resultados SQL frente a Power BI.
- Construcción de filtros e interacciones entre gráficos.
- Uso de variables, MAXX(), ALLSELECTED() e IF() para formato condicional.
- Interpretación comercial de CTR, tasa de conversión y ROAS.

El desarrollo del dashboard incluyó aprendizaje y apoyo de inteligencia artificial para comprender algunas funciones DAX y opciones de visualización.

---

**Proyecto práctico desarrollado para mi portfolio de Análisis de Datos y Business Intelligence.**
