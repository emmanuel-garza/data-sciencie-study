/*
10.  Which salespeople have the most late orders?
*/

SELECT
	tmp.employeeid,
	CONCAT(e.firstname, ' ', e.lastname) AS "name",
	COUNT(*) AS "count"
FROM
	(SELECT 
		orderid,
		employeeid,
		orderdate,
		requireddate,
		shippeddate,
		shippeddate-requireddate AS "diff"
	FROM 
		orders
	WHERE
		DATE_PART('days',shippeddate-requireddate) >= 0
	ORDER BY "diff" DESC) AS tmp
	JOIN
	employees AS e
	ON
	tmp.employeeid = e.employeeid
GROUP BY tmp.employeeid, "name"
ORDER BY "count" DESC