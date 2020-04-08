/*
1. Show the list with CategoryNames and the TotalNumber 
of products for each Category sorted by number of products 
in desc order. (8 rows). Here you have to combine JOIN and 
GROUP BY.
*/

SELECT
	cat.categoryname,
	COUNT(prod.productid) AS "TotalNumber"
FROM
	categories AS cat
	INNER JOIN
	products AS prod
	ON cat.categoryid = prod.categoryid
GROUP BY cat.categoryname
ORDER BY "TotalNumber" DESC;
	