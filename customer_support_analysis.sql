SELECT employee_id,
	   COUNT(ticket_id) Num_total_tickets,
       COUNT(CASE ticket_status WHEN 'Resolved' THEN 1 END) resolved,
       COUNT(CASE ticket_status WHEN 'In progress' THEN 1 END) in_progress,
       ROUND(AVG(time_taken_in_sec)/60,2) tiempo_promedio_minutos,
       ROUND(COUNT(CASE ticket_status WHEN 'Resolved' THEN 1 END)/COUNT(ticket_id)*100,2) porcentaje_de_resolucion
       FROM practica.customer_support_500
       GROUP BY employee_id
       HAVING Num_total_tickets>=2
       ORDER BY porcentaje_de_resolucion DESC;
       
       
       
       
