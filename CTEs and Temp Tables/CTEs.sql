-- Using common Table Expressions 

SELECT * 
FROM customer_orders ;


SELECT product_id , 
	   SUM(order_total),
       SUM(tip),
       COUNT(tip)
FROM customer_orders
WHERE tip != 0 
GROUP BY product_id ;


WITH CTE1 AS (
SELECT product_id , 
	   SUM(order_total),
       SUM(tip),
       COUNT(tip)
FROM customer_orders
WHERE tip != 0 
GROUP BY product_id
)

SELECT * 
FROM CTE1
WHERE `SUM(tip)` > 3 ;


WITH CTE2(product_id , sum_order_total, tip_sum, tip_count) AS (
SELECT product_id , 
	   SUM(order_total),
       SUM(tip),
       COUNT(tip) 
FROM customer_orders
WHERE tip != 0 
GROUP BY product_id
)

SELECT product_id ,
       ROUND((tip_sum /tip_count),2)
FROM CTE2
;


SELECT product_id ,
       ROUND((`SUM(tip)`/`COUNT(tip)`),2)
FROM(
SELECT product_id , 
	   SUM(order_total),
       SUM(tip),
       COUNT(tip) 
FROM customer_orders
WHERE tip != 0 
GROUP BY product_id
) AS Subquery_EXample
GROUP BY product_id ; 



WITH CTE3 AS (
SELECT product_id , 
	   SUM(order_total),
       SUM(tip),
       COUNT(tip) 
FROM customer_orders
WHERE tip != 0 
GROUP BY product_id
),

CTE4 AS (
SELECT product_id , 
	   SUM(order_total),
       SUM(tip),
       COUNT(tip) 
FROM customer_orders
GROUP BY product_id
)
SELECT  * 
FROM CTE3 
JOIN CTE4 
  ON CTE3.product_id = CTE4.product_id
;