-- PROYECTO 09: ANALISIS DE INGRESOS POR VENTAS
-- Objetivo: calcular los ingresos de las ventas
-- completadas por año y mes.
-- Periodo analizado: enero de 2024 a septiembre de 2026.

SELECT
    YEAR(sale_date) AS año,
    MONTH(sale_date) AS mes,
    SUM(revenue) AS total_ingreso
FROM sql_powerbi_practice.sales_500
WHERE order_status = 'completed'
GROUP BY año, mes
ORDER BY año ASC, mes ASC;
