/*
7. One of the salespeople thinks that she accidentally entered a line item 
twice on an order, each time with different ProductId, but the same quantity.  
She remembers that quantity was 60 or more. Show all OrderID that match this, 
ordered by OrderID. (5 rows)
*/

SELECT DISTINCT
	o1.orderid
FROM
	orderdetails AS o1
	JOIN
	orderdetails AS o2
	ON ( o1.orderid = o2.orderid AND
		o1.productid != o2.productid)
WHERE 
	o1.quantity >= 60
	AND
	o2.quantity >= 60
	AND
	o1.quantity = o2.quantity
ORDER BY o1.orderid