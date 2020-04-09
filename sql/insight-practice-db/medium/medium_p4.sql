/*
4. Incorporate UnitsInOrder and Discontinued fields. 
So, now UnitsInOrder + UnitsInStock <= ReorderLevel and 
Discontinued flag is False. (2 rows)
*/

SELECT
	productid
FROM
	products
WHERE
	unitsonorder + unitsinstock <= reorderlevel 
	AND
	discontinued IS FALSE
ORDER BY productid
