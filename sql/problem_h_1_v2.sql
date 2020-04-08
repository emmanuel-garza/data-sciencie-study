-- Assuming that now is January 1, 2017, we want to 
-- find all high-value customers from 2016, who've made 
-- at least one order with a total value of $10,000 and 
-- give them VIP status. (6 rows)

SELECT
	det.orderid,
	ord.customerid,
	SUM(det.unitprice*det.quantity) AS nodisc,
	SUM((1-det.discount)*det.unitprice*det.quantity) AS disc
FROM
	orderdetails AS det	
	JOIN
	orders AS ord
	ON det.orderid = ord.orderid
WHERE
	EXTRACT(YEAR FROM ord.orderdate ) = '2016'
GROUP BY det.orderid, ord.customerid
HAVING 
	SUM((1-det.discount)*det.unitprice*det.quantity) > MONEY(15000)
ORDER BY 
	ord.customerid