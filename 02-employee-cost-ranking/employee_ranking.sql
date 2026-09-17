-- identify the top 3 employees by current anual cost for each department

SELECT* FROM
(
SELECT Department, Employee_name, ROUND(Current_Annual_CTC) current_anual_cost, 
	RANK() OVER(PARTITION BY Department ORDER BY Current_Annual_CTC DESC) AS rank_in_dep
	FROM employee_data_500 
    ) as subquery
    WHERE rank_in_dep IN(1,2,3);