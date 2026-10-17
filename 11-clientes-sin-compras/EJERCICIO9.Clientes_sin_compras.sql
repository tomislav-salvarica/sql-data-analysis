-- EJERCICIO 9. Clientes sin compras
-- Encuentra clientes que no tengan ninguna venta registrada. Devuelve customer_id,
-- customer_name, segment y signup_date.

-- CONSULTA 1 detalles de clientes sin compras
SELECT c500.customer_id,
	   c500.customer_name,
       c500.signup_date,
       c500.segment,
       c500.active_status,
       c500.city
       FROM customers_500 c500
LEFT JOIN sales_500 s500
ON c500.customer_id=s500.customer_id
WHERE S500.customer_id IS NULL;

-- CONSULTA 2 clientes sin compras por segmento y estado
SELECT c500.segment,
	   c500.active_status,
       COUNT(*) 
	FROM customers_500 c500
LEFT JOIN sales_500 s500
ON c500.customer_id=s500.customer_id
WHERE s500.customer_id IS NULL
GROUP BY c500.segment, c500.active_status
ORDER BY COUNT(*) DESC;
