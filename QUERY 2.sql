-- attrition rate by department

SELECT Department,
       COUNT(*) AS total_employees,
       SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS attrition_count,
       ROUND(SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*) * 100, 2) AS attrition_rate_percentage
FROM employee_staging
GROUP BY Department
ORDER BY attrition_rate_percentage DESC;