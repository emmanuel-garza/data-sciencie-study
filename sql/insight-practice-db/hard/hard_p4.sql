/*
4. At the end of the month salespeople are trying harder to get orders. 
Select all orders which were placed on the last day of the month. Ordered by 
EmployeeID and OrderID. (24 rows)
*/

SELECT
	employeeid, orderid, orderdate, DATE_PART('day', orderdate) AS "day", 
	DATE_PART('month', orderdate) AS "month"
FROM
	orders
WHERE 
	DATE_PART('month', orderdate + interval '1 day') != DATE_PART('month', orderdate)
ORDER BY employeeid, orderid