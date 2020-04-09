/* 
3. What Products do we have in our inventory that needs to be 
reordered? Sort results by ProductID.  (22 rows). Use 
UnitsInStock field  <=  ReorderLevel field only
*/

SELECT
	productid,
	productname
FROM
	products
WHERE unitsinstock <= reorderlevel
ORDER BY productid;