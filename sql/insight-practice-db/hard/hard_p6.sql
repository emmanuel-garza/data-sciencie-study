/*
6. Select 2% of the OrderDetails table. (41 rows). Use statement  random() < 0.02
*/

SELECT * FROM
	(SELECT 
		*, random()::numeric(10,2) AS "rnd"
	FROM
		orderdetails) AS tmp
WHERE tmp.rnd < 0.2
