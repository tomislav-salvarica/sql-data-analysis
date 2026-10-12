-- EJERCICIO 8. Top 10 productos por ingresos
-- Une ventas y productos. Calcula ingresos y unidades venidad por producto. Devuelve solo los
-- 10 productos con mas ventas.

SELECT p500.product_id,
	   p500.product_name,
       p500.category,
       SUM(quantity) unidades_vendidas,
       SUM(revenue) ingreso_producto
	FROM products_500 p500
INNER JOIN sales_500 s500
ON p500.product_id=s500.product_id
WHERE order_status='Completed'
GROUP BY p500.product_id,
	   p500.product_name,
       p500.category
ORDER BY ingreso_producto DESC
LIMIT 10;
