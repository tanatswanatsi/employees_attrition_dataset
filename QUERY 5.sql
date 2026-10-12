-- average salary by dapartment

SELECT Department,
       ROUND(AVG(Salary), 2) AS avg_salary
FROM employee_staging
GROUP BY Department
ORDER BY avg_salary DESC;