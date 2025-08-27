-- Using Temporary Tables 

CREATE TEMPORARY TABLE temp_table
(
first_name varchar(50),
last_name varchar(50) ,
favorite_movie varchar(100)
);

SELECT * 
FROM temp_table;

INSERT INTO  temp_table
VALUES ('Wafaa','Siddig','The Man Who Knew Infinity');


SELECT * 
FROM temp_table;

CREATE TEMPORARY TABLE temp_table2
SELECT * 
FROM employees 
WHERE salary > 5000;


SELECT * 
FROM temp_table2;
