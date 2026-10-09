# 📊 Proyecto 08 | Análisis salarial de Recursos Humanos

## 🎯 Objetivo del proyecto

Analizar los salarios anuales y la distribución de empleados activos en siete departamentos de una empresa, utilizando **MySQL, Power BI y DAX**.

El objetivo es transformar los datos en indicadores y visualizaciones que permitan comparar departamentos y comprender su estructura salarial.

## 🛠️ Herramientas utilizadas

- **MySQL:** consultas, filtrado, agrupación y agregación de datos.
- **Power BI:** creación de un dashboard interactivo.
- **DAX:** cálculo del salario promedio general ponderado.
- **SQL:** funciones `COUNT()`, `AVG()`, `MIN()`, `MAX()`, `ROUND()`, `GROUP BY` y `ORDER BY`.

## 🗂️ Dataset

Se utilizó la tabla `employees_500`, que contiene información de empleados, departamentos, salarios anuales y estado laboral.

El análisis se centra exclusivamente en los empleados con estado `Active`.

## 💻 Consulta SQL

```sql
SELECT
    department,
    COUNT(*) AS empleados_activos,
    ROUND(AVG(annual_salary), 2) AS salario_promedio,
    MIN(annual_salary) AS salario_minimo,
    MAX(annual_salary) AS salario_maximo
FROM employees_500
WHERE employment_status = 'Active'
GROUP BY department
ORDER BY salario_promedio DESC;
```

## 📈 Dashboard en Power BI

Se desarrolló **HR | Salary Analytics**, un informe interactivo que incluye:

- Cuatro tarjetas KPI: empleados activos, salario promedio general, salario mínimo y salario máximo.
- Gráfico de columnas con el salario promedio anual por departamento.
- Gráfico de barras con la distribución de empleados activos.
- Tabla comparativa de indicadores salariales.
- Segmentador interactivo por departamento.
- Sección de conclusiones del análisis.

### Medida DAX: salario promedio general

Para obtener un promedio representativo de todos los empleados activos, se utilizó una media ponderada por el número de empleados de cada departamento.

```dax
Salario Promedio General =
DIVIDE(
    SUMX(
        Consulta,
        Consulta[salario_promedio] * Consulta[empleados_activos]
    ),
    SUM(Consulta[empleados_activos])
)
```

## 🔎 Principales resultados

| Indicador | Resultado |
|---|---|
| Empleados activos | 466 |
| Departamentos analizados | 7 |
| Departamento con mayor salario promedio | HR |
| Mayor salario promedio departamental | 35.542,01 € |
| Departamento con más empleados | Sales |
| Empleados en Sales | 134 |
| Diferencia entre extremos de salario promedio | 3.403,38 € |

## 💡 Conclusiones

**1. Recursos Humanos presenta el mayor salario promedio.**

El departamento HR registra 35.542,01 € anuales de salario promedio, el valor más alto entre los siete departamentos.

**2. Ventas concentra el mayor número de empleados activos.**

Sales cuenta con 134 empleados, equivalentes aproximadamente al 28,8 % del total analizado.

**3. Existen diferencias salariales entre departamentos.**

La diferencia entre el mayor y el menor salario promedio departamental es de 3.403,38 € anuales.

## 🚀 Aprendizajes

Este proyecto me permitió reforzar habilidades de consulta y agregación de datos con SQL, construcción de dashboards interactivos con Power BI y creación de medidas DAX.

También reforcé la importancia de calcular correctamente los indicadores, diseñar visualizaciones claras y comunicar hallazgos basados en datos.

---

**Proyecto desarrollado como parte de mi portfolio de aprendizaje y práctica en análisis de datos y Business Intelligence.**
