/*
6. We want to investigate some more shipping options for our 
customers. Return the three countries with the highest average 
freight ordered by average freight in descending order. Use 
GROUP BY, AVE() and LIMIT statements
*/

-- Version 1: Using LIMIT
-- SELECT
-- 	shipcountry, 
-- 	CAST(AVG( CAST(freight AS numeric) ) AS MONEY) AS "AverageFreight"
-- -- 	CAST(AVG( freight::numeric ) AS MONEY) AS "AverageFreight"
-- FROM
-- 	orders
-- GROUP BY shipcountry
-- ORDER BY "AverageFreight" DESC
-- LIMIT 3;
	
-- Version 2: Using Window Functions
SELECT *
FROM
	(SELECT
		shipcountry,
	 	AVG( freight::NUMERIC ) :: MONEY, 
		RANK() OVER(ORDER BY AVG( freight::NUMERIC ) DESC) AS "rank"
	FROM
		orders
	GROUP BY shipcountry) AS tmp
WHERE "rank" <= 3;