/*
15. When was the first order in Orders? 
(1 row, 2014-07-04  8:00:00.000). 
You can use aggregate Min function or order by date  
in asc order and select LIMIT 1 only. 
*/

SELECT
	MIN(orderdate)
FROM
	orders
