WITH totalorders (orderid, nodisc, disc) AS (
	SELECT
		det.orderid,
		SUM(det.unitprice*det.quantity) AS "Order Total (No Disc)",
		SUM((1-det.discount)*det.unitprice*det.quantity) AS "Order Total (Disc)"
	FROM
		orderdetails AS det	
	GROUP BY det.orderid
	)

SELECT 
	ord.customerid,
	tot.*
FROM
	totalorders AS tot
	JOIN
	orders AS ord
		ON tot.orderid = ord.orderid
WHERE
	EXTRACT(YEAR FROM ord.orderdate ) = '2016'
	AND
	tot.nodisc > MONEY(15000)
ORDER BY customerid