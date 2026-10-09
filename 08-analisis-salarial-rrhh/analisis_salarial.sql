
-- PROYECTO 08: ANALISIS SALARIAL POR DEPARTAMENTO
-- Objetivo: analizar los empleados activos y sus salarios anuales.

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
