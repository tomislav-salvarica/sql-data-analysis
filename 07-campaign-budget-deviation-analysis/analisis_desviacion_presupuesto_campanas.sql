-- Proyecto 07: Análisis de desviación presupuestaria de campañas
-- Objetivo: identificar campañas que superaron su presupuesto
-- y analizar el sobrecoste, la desviación porcentual y la duración.

SELECT
    campaign_name,
    DATEDIFF(end_date, start_date) AS duracion_dias,
    budget,
    spend,
    spend - budget AS diferencia_presupuesto,
    ROUND((spend - budget) / budget * 100, 2) AS porcentaje_desviacion
FROM marketing_campaigns_500
WHERE spend > budget
ORDER BY diferencia_presupuesto DESC;
