/*
7.Return the same result as previous problem, but for only 2015. 
You can use BETWEEN statements. France should be the third country.
*/

SELECT 
	shipcountry,
	AVG( freight::NUMERIC ) :: MONEY AS "AvgFreight"
FROM
	orders
WHERE DATE(orderdate) BETWEEN '01-01-2015' AND '12-31-2015'
GROUP BY shipcountry
ORDER BY "AvgFreight" DESC
LIMIT 3;