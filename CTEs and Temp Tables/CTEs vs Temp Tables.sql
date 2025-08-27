-- Temp Tables vs CTEs :-

-- In terms of 
-- 1. How they 're stored in memory 
-- 2. How they handle complex queries 


-- an example of using CTEs is with window functions 

WITH CTE AS(
SELECT * , 
       ROW_NUMBER()OVER (PARTITION BY department ORDER BY salary DESC) row_num
FROM employees)

SELECT *
FROM  CTE 
WHERE row_num > 2;


CREATE TEMPORARY TABLE temp_table
SELECT * , 
       ROW_NUMBER()OVER (PARTITION BY department ORDER BY salary DESC) row_num
FROM employees;

SELECT * 
FROM temp_table;