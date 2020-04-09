/*
8. Return the same result as the previous problem, but 
for the last 12 months only.
*/

SELECT
	ord.shipcountry,
	AVG(ord.freight::NUMERIC) :: MONEY AS "AvgFreight"
FROM
	orders AS ord
WHERE 
	ord.orderdate BETWEEN
	(SELECT MAX(DATE(tmp.orderdate)) FROM orders AS tmp) - INTERVAL '12 month'
	AND
	(SELECT MAX(DATE(tmp.orderdate)) FROM orders AS tmp)
GROUP BY shipcountry
ORDER BY "AvgFreight" DESC
LIMIT 3;