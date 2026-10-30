-- PROYECTO 14
-- EJERCICIO 12.4: Margen estimado por canal
-- Considerando únicamente clientes actualmente activos
-- y ventas completadas.

SELECT
    s500.sales_channel,
    ROUND(SUM(s500.revenue), 2) AS Ingresos,
    ROUND(SUM(s500.quantity * p500.unit_cost), 2) AS Coste_estimado,
    ROUND(
        SUM(s500.revenue) -
        SUM(s500.quantity * p500.unit_cost),
        2
    ) AS Margen_absoluto,
    ROUND(
        (
            SUM(s500.revenue) -
            SUM(s500.quantity * p500.unit_cost)
        ) / NULLIF(SUM(s500.revenue), 0) * 100,
        2
    ) AS Margen_porcentual
FROM sales_500 AS s500
INNER JOIN products_500 AS p500
    ON s500.product_id = p500.product_id
INNER JOIN customers_500 AS c500
    ON s500.customer_id = c500.customer_id
WHERE s500.order_status = 'Completed'
  AND c500.active_status = 'Active'
GROUP BY s500.sales_channel
ORDER BY Margen_porcentual DESC;
