/*
16.  Get a list of all unique ContactTitles from the 
Customers table. Use Distinct or Group By
*/

-- SELECT DISTINCT
-- 	contacttitle
-- FROM
-- 	customers;

SELECT
	contacttitle
FROM
	customers
GROUP BY contacttitle;