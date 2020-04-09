/*
5.  Create a list of all Customers sorted by Region and put 
customers with Null Region value at the beginning (not at 
the end). By default Null values are at the end. So, you have 
to create a new column HasRegion (0/1) with CASE statement and 
Order By two columns: HasRegion and Region.
*/

SELECT
	customerid,
	region,
	CASE 
		WHEN region IS NULL THEN 0
		ELSE 1
	END AS "HasRegion"
FROM
	customers
ORDER BY "HasRegion", region;