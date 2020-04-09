/*
9. Get the list of all orders that are late. Ordered
by delay.
*/

SELECT 
	orderid,
	orderdate,
	requireddate,
	shippeddate,
	shippeddate-requireddate AS "diff"
FROM 
	orders
WHERE
	DATE_PART('days',shippeddate-requireddate) >= 0
ORDER BY "diff" DESC