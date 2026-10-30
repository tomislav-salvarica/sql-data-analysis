
-- PROYECTO 14
-- EJERCICIO 12: Margen estimado por categoria

SELECT
    p500.category,
    ROUND(SUM(s500.revenue), 2) AS Ingresos,
    ROUND(SUM(s500.quantity * p500.unit_cost), 2) AS Coste_estimado,
    ROUND(
        SUM(s500.revenue) -
        SUM(s500.quantity * p500.unit_cost), 2
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
WHERE s500.order_status = 'Completed'
GROUP BY p500.category
ORDER BY Margen_porcentual DESC;
