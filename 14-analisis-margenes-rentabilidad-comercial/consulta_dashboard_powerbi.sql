-- PROYECTO 14
-- Consulta utilizada para importar los datos a Power BI
-- Incluye ventas completadas de clientes activos e inactivos.
-- Sin agrupaciones: los indicadores se calculan con DAX.

SELECT
    s500.sale_id,
    s500.customer_id,
    s500.product_id,
    s500.sales_channel,
    s500.quantity,
    s500.revenue,
    p500.product_name,
    p500.category,
    p500.subcategory,
    p500.unit_cost,
    c500.active_status
FROM sales_500 AS s500
INNER JOIN products_500 AS p500
    ON s500.product_id = p500.product_id
INNER JOIN customers_500 AS c500
    ON s500.customer_id = c500.customer_id
WHERE s500.order_status = 'Completed';
