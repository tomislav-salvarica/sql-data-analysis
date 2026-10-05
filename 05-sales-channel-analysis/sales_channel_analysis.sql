SELECT 
    sales_channel,
    COUNT(*) AS ventas_completadas,
    SUM(quantity) AS unidades_vendidas,
    SUM(revenue) AS ingresos_totales
FROM sql_powerbi_practice.sales_500
WHERE order_status = 'completed'
GROUP BY sales_channel;
