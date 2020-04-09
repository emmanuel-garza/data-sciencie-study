/*
5. We want to identify the size of the table for our website. 
Show the top 10 orders with maximum items. Ordered by number of items.

Top 10 -> Windowing function, RANK
*/

SELECT * FROM
	(SELECT
		RANK() OVER(ORDER BY tmp."count" DESC) AS "rank",
		tmp.orderid,
		tmp."count"
	FROM
		(SELECT
			orderid, COUNT(*) AS "count"
		FROM
			orderdetails
		GROUP BY orderid) AS tmp
	ORDER BY tmp."count" DESC) AS tmp2
WHERE tmp2."rank" <= 10
