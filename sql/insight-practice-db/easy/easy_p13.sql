/* Select OrderID, ProductID, UnitPrice, Quantity and create 
new column TotalPrice (ignore Discount) for OrderDetails.
Order by OrderID and ProductID. (2155 rows)
*/

SELECT
	orderid,
	productid,
	unitprice,
	quantity,
	(unitprice * quantity) AS totalprice
FROM
	orderdetails
ORDER BY orderid, productid