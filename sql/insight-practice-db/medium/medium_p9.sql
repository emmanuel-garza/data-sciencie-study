/*
9. Show OrderId, Quantity, ProductName, EmployeeID and LastName for each order 
in Orders table. Sort by OrderId and ProductID.(2155 rows). Yes, you have to JOIN 4 
tables and select only these columns.
*/

SELECT
	ord.orderid, 
	orddet.quantity,
	prod.productname,
	emp.employeeid,
	emp.lastname
FROM
	orders AS ord
	JOIN
	orderdetails AS orddet
	ON
	ord.orderid = orddet.orderid
	JOIN
	products AS prod
	ON
	orddet.productid = prod.productid
	JOIN
	employees AS emp
	ON
	ord.employeeid = emp.employeeid
ORDER BY ord.orderid, prod.productid
	