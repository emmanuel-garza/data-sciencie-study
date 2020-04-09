/*
2.  What if a sales person changes her mind and instead of 1 order with 
>$10,000 would ask about $15,000 in total during 2016?
*/

SELECT
	ord.customerid,
	ord.orderid,
	SUM(orddet.unitprice * orddet.quantity * (1-orddet.discount))  AS "TotalOrder"
FROM
	orders AS ord
	JOIN
	orderdetails AS orddet
	ON ord.orderid = orddet.orderid
WHERE DATE_PART('year',ord.orderdate) = '2016'
GROUP BY ord.customerid, ord.orderid
HAVING SUM(orddet.unitprice * orddet.quantity * (1-orddet.discount)) > 15000::MONEY
ORDER BY "TotalOrder"