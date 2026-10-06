-- Ejercicio 4: Tickets por prioridad y estado
-- Análisis del volumen de incidencias

SELECT
    priority,
    ticket_status,
    COUNT(*) AS total_tickets
FROM sql_powerbi_practice.support_tickets_500
GROUP BY
    priority,
    ticket_status
ORDER BY total_tickets DESC;
