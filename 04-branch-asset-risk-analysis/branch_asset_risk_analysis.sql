-- Control de activos e inversión por sucursal
-- Situación: el área de operaciones quiere comparar la inversión realizada en cada sucursal con el valor de los activos desplegados en ella.
WITH branch_risk as (
		SELECT branch_id,
		   branch_name,
           branch_city,
           ROUND(MAX(Branch_Investment_Cost),2) Total_Investment,
           ROUND(SUM(asset_cost),2) Total_Cost,
           COUNT(CASE WHEN PA500.asset_status='Active' THEN 1 END) Total_Active_Assets,
           COUNT(CASE WHEN PA500.asset_status='Inactive' THEN 1 END) Total_Inactive_Assets,
           COUNT(CASE WHEN PA500.asset_status='Under Maintenance' THEN 1 END) Total_Assets_under_Maintenance,
           COUNT(pa500.deployed_branch) Total_Assets
		FROM practica.branch_500 pb500
		INNER JOIN practica.activos_500 pa500
		ON pb500.branch_id=pa500.deployed_branch
		GROUP BY pb500.branch_id,
		   pb500.branch_name,
           pb500.branch_city
		HAVING COUNT(pa500.deployed_branch)>=3
					),		
risk as (
		SELECT *,
           ROUND((Total_Inactive_Assets+Total_Assets_under_Maintenance)/Total_Assets*100,2) risk_porcentage
		FROM branch_risk
        )
SELECT *,
	   CASE WHEN risk_porcentage>=50 THEN 'High risk'
			WHEN risk_porcentage>=25 THEN 'Medium risk'
			ELSE 'Low risk' END as risk_ranking
FROM risk
ORDER BY risk_porcentage DESC;