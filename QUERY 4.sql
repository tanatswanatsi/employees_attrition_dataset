-- years since last promotion vs attrition

SELECT Attrition,
       ROUND(AVG(`Years Since Last Promotion`), 1) AS avg_years_since_promotion,
       ROUND(AVG(`Years At Company`), 1) AS avg_tenure
FROM employee_staging
GROUP BY Attrition;