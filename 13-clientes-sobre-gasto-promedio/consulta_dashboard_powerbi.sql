
-- Proyecto 13: Consulta utilizada para el dashboard de Power BI
-- Incluye todos los clientes con compras completadas y su región

WITH gastos_clientes AS (
    SELECT
        c500.customer_id,
        c500.customer_name,
        c500.region,
        SUM(s500.revenue) AS gasto_total,
        COUNT(s500.sale_id) AS numero_compras
    FROM sales_500 AS s500
    INNER JOIN customers_500 AS c500
        ON s500.customer_id = c500.customer_id
    WHERE s500.order_status = 'Completed'
    GROUP BY
        c500.customer_id,
        c500.customer_name,
        c500.region
)
SELECT *
FROM gastos_clientes
ORDER BY gasto_total DESC;
