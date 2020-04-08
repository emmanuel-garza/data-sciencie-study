/*
17. Get a NumberOfCustomers for each Country where we 
have Customers. Order it by NumberOfCustomers 
in DESC order.(21 rows). Use Group By clause.
*/

SELECT
	country,
	COUNT(customerid) AS "numberofcustomers"
FROM
	customers
GROUP BY country
ORDER BY "numberofcustomers" DESC;