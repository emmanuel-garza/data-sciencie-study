/*
11. Show all Customers who have never placed an order with Employee 4.(16 rows)
*/

/*
Alternate solution: Do a union of 2 queties:
1) Customers who have never placed an order
2) Customers who have placed orders, but have never placed order with 4)
*/

SELECT
	*
FROM
	customers
WHERE
	customers.customerid NOT IN
	(SELECT DISTINCT
	 	tmp.customerid
	 FROM
	 	orders AS tmp
	 WHERE
	 	tmp.employeeid = 4)