/*
11. For each EmployeeID show a number of AllOrders and LateOrders
in one table.  Show "0" if there is no LateOrders for Employee.
(9 rows)
*/

SELECT
	tmp.employeeid,
	SUM(tmp.late+tmp.ontime) AS "AllOrders",
	SUM(tmp.late) AS "LateOrders"
FROM
	(SELECT
		orderid,
		employeeid,
		CASE
			WHEN DATE_PART('day', shippeddate-requireddate) >= 0 THEN 1
			ELSE 0
		END AS "late",
		CASE
			WHEN DATE_PART('day', shippeddate-requireddate) < 0 THEN 1
	 		WHEN shippeddate IS NULL THEN 1
			ELSE 0
		END AS "ontime"
	FROM
		orders) AS tmp
GROUP BY tmp.employeeid
