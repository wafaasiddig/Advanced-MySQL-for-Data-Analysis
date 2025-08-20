-- Recusion in CTEs

SELECT * 
FROM employees ;

WITH RECURSIVE CTE1 AS (
SELECT 1 AS x

UNION ALL 

SELECT x + 1 
FROM CTE1 
WHERE x < 10
)
SELECT x 
FROM CTE1 ;


WITH RECURSIVE company_hierarchy  AS
(
SELECT employee_id , first_name , last_name , boss_id ,
        0 AS  hierarchy_level 
FROM employees 
WHERE boss_id IS NULL

UNION ALL 

SELECT e.employee_id , e.first_name , e.last_name , e.boss_id , hierarchy_level + 1 
FROM employees e , company_hierarchy ch
WHERE e.boss_id = ch.employee_id
)

SELECT ch.first_name Employee_first_name , 
       ch.last_name Employee_last_name,
       e.first_name Boss_first_name , 
       e.last_name Boss_last_name,
       hierarchy_level
FROM company_hierarchy ch 
JOIN employees e 
ON ch.boss_id = e.employee_id

;