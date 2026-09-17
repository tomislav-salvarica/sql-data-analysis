# 📊 Ranking de empleados por coste anual | SQL + Excel

## 🎯 Objetivo del proyecto

Identificar los tres empleados con mayor coste anual de cada departamento y presentar los resultados mediante una visualización en Excel que facilite la comparación de costes.

**Dataset:** Datos simulados con fines educativos.

## 🛠️ Herramientas utilizadas

* **MySQL Workbench:** consultas y análisis de datos.
* **SQL:** funciones de ventana, subconsultas y ordenación.
* **Microsoft Excel:** tablas dinámicas y visualización de datos.

## 🔍 Análisis con SQL

Para resolver el ejercicio utilicé:

* `RANK()` para clasificar los empleados según su coste anual.
* `PARTITION BY` para generar un ranking independiente por departamento.
* `ORDER BY DESC` para ordenar los costes de mayor a menor.
* Una subconsulta para seleccionar los tres primeros puestos de cada departamento.

📁 Consulta disponible en `employee_ranking.sql`.

## 📈 Análisis y visualización en Excel

Exporté los resultados de SQL a Excel y desarrollé:

* Una tabla dinámica organizada por departamento y posición.
* Un gráfico comparativo de costes anuales.
* Una clasificación visual mediante colores para distinguir los tres puestos.

📁 Archivo disponible en `top3_employees_annual_cost_department.xlsx`.

## 💡 Resultados

El análisis permite identificar los tres costes anuales más elevados de cada departamento y visualizar las diferencias entre ellos.

Se analizaron cinco departamentos: Finance, HR, IT, Operations y Sales.

## 🚀 Competencias aplicadas

SQL · MySQL · Funciones de ventana · Subconsultas · Excel · Tablas dinámicas · Visualización de datos · Análisis de datos


