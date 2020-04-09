/*
12. Add percentage of LateOrders column rounded by 0.01%.
*/

SELECT
	tmp.employeeid,
	SUM(tmp.late+tmp.ontime) AS "AllOrders",
	SUM(tmp.late) AS "LateOrders",
	(100.0 * SUM(tmp.late) / SUM(tmp.late+tmp.ontime)) :: NUMERIC(10,2) AS "PercentLate"
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
