/*
1. Assuming that now is January 1, 2017, we want to find all high-value customers 
from 2016, who've made at least one order with a total value of $10,000 and give 
them VIP status. (6 rows)
*/

SELECT
	ord.customerid,
	ord.orderid,
	SUM(orddet.unitprice * orddet.quantity) AS "TotalOrder"
FROM
	orderdetails AS orddet
	INNER JOIN
	orders AS ord
	ON orddet.orderid = ord.orderid
WHERE 
	DATE_PART('year',ord.orderdate) IN ('2016')
GROUP BY ord.customerid, ord.orderid
HAVING SUM(orddet.unitprice * orddet.quantity) > 10000::MONEY

-- -- This is my interpretation of the original statement. But it seems that it really
-- -- was asking for total orders through the year.
-- --- THIS WAS WRONG BECAUSE IN WE CAN HAVE MULTIPLE ORDERDETAILS WITH SAME ORDERID
-- SELECT
-- 	ord.customerid,
-- 	orddet.unitprice * orddet.quantity AS "TotalOrder"
-- FROM
-- 	orderdetails AS orddet
-- 	INNER JOIN
-- 	orders AS ord
-- 	ON orddet.orderid = ord.orderid
-- WHERE 
-- 	DATE_PART('year',ord.orderdate) IN ('2016')
-- 	AND 
-- 	orddet.unitprice * orddet.quantity > 10000::MONEY