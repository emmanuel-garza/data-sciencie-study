/*
10. Show all "customers" you have never placed an order.(2 rows). 
You can use LEFT JOIN
*/

SELECT 
	cus.customerid,
	cus.companyname,
	cus.contactname,
	cus.contacttitle
FROM
	customers AS cus
	LEFT JOIN
	orders AS ord
	ON cus.customerid = ord.customerid
WHERE
	ord.orderid IS NULL;