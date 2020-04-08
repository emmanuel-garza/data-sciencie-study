/*
19. Show the OrderID, OrderDate(date only) and 
CompanyName(Shippers) for all Orders with OrderID<10270. 
Sort by OrderID. (22 rows). Note: when you join two tables,
the field that's joined on not necessarily need to have the 
same name - ShipVia in Orders and ShipperID in Shippers.
*/

SELECT
	ord.orderid,
	DATE(ord.orderdate),
	ship.companyname
FROM
	shippers AS ship
	INNER JOIN
	orders AS ord
	ON ord.shipvia = ship.shipperid
WHERE ord.orderid < 10270
ORDER BY ord.orderid