/* 
2. In the Customers table, show the total number of 
Customers per Country and City. (69 rows)
*/

/*
Here I used a partition function, but the alternative is to 
use aggregate and then join
*/

SELECT DISTINCT
	city,
	country,
	COUNT(*) OVER(PARTITION BY city) AS "Customers per City"
FROM
	customers
ORDER BY "Customers per City" DESC;