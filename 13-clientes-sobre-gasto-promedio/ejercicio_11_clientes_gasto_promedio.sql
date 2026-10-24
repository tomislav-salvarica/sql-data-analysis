
-- Proyecto 13: Clientes por encima del gasto promedio
-- Ejercicio 11: CTE y subconsulta

WITH gastos_clientes AS (
    SELECT
        c500.customer_id,
        c500.customer_name,
        SUM(s500.revenue) AS gasto_total,
        COUNT(s500.sale_id) AS numero_compras
    FROM sales_500 AS s500
    INNER JOIN customers_500 AS c500
        ON s500.customer_id = c500.customer_id
    WHERE s500.order_status = 'Completed'
    GROUP BY
        c500.customer_id,
        c500.customer_name
)
SELECT *
FROM gastos_clientes
WHERE gasto_total > (
    SELECT AVG(gasto_total)
    FROM gastos_clientes
)
ORDER BY gasto_total DESC;
