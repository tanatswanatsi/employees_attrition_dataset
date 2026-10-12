-- overall attrition rate 

SELECT Attrition,
       COUNT(*) AS total,
       ROUND(COUNT(*) / (SELECT COUNT(*) FROM employee_staging) * 100, 2) AS percentage
FROM employee_staging
GROUP BY Attrition;