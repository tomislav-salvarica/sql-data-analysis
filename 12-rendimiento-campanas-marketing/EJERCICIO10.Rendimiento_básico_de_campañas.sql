-- EJERCICIO 10. Rendimiento básico de campañas
-- Calcula para cada channel, impresiones, clicks, conversiones, CTR (%), y tasa
-- de conversión (%). Redondea a 2 decimales.


-- Consulta 1. Rendimiento general por canal, pregunta que responde: Qué canales publicitarios
-- presentan mejores resultados globales?
SELECT channel,
	   SUM(impressions) total_impresiones,
       SUM(clicks) total_clicks,
       SUM(conversions) total_conversiones,
       ROUND(SUM(clicks)/NULLIF(SUM(impressions),0)*100,2) CTR_porcentaje,
       ROUND(SUM(conversions)/NULLIF(SUM(clicks),0)*100,2) tasa_conversion_porcentaje,
       SUM(revenue_attributed) ingresos_atribuidos,
       SUM(spend) gasto_publicitario,
       ROUND(SUM(revenue_attributed)/NULLIF(SUM(spend),0),2) ROAS
 FROM sql_powerbi_practice.marketing_campaigns_500
 GROUP BY channel
 ORDER BY ROAS DESC;

-- Consulta 2. Rendimiento por canal y tipo de campaña. Qué tipos de campaña funcionan mejor dentro de cada canal.
SELECT channel,
	   campaign_type,
	   SUM(impressions) total_impresiones,
       SUM(clicks) total_clicks,
       SUM(conversions) total_conversiones,
       ROUND(SUM(clicks)/NULLIF(SUM(impressions),0)*100,2) CTR_porcentaje,
       ROUND(SUM(conversions)/NULLIF(SUM(clicks),0)*100,2) tasa_conversion_porcentaje,
       SUM(revenue_attributed) ingresos_atribuidos,
       SUM(spend) gasto_publicitario,
       ROUND(SUM(revenue_attributed)/NULLIF(SUM(spend),0),2) ROAS
 FROM sql_powerbi_practice.marketing_campaigns_500
 GROUP BY channel, campaign_type
 ORDER BY ROAS DESC;
