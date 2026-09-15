-- Marketing Campaign Budget Analysis
-- Clasificación de campañas según su presupuesto
-- y comparación del gasto real frente al presupuesto asignado.

SELECT
    campaign_ID,
    campaign_name,
    campaign_budget,

    CASE
        WHEN campaign_budget <= 10000 THEN 'Low budget'
        WHEN campaign_budget > 10000 AND campaign_budget <= 25000 THEN 'Decent budget'
        WHEN campaign_budget > 25000 THEN 'High budget'
    END AS budget_category,

    CASE
        WHEN campaign_spend > campaign_budget THEN 'Over budget'
        ELSE 'Within budget'
    END AS spend_check

FROM practica1.campaigns;
