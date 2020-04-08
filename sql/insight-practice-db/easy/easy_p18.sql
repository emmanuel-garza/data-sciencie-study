/*
18. Show ProductID(Products), SupplierID(Suppliers,Products) 
and CompanyName(Suppliers) for each product from Products. 
(77 rows). This question introduces a new concept - 
INNER JOIN.
*/

SELECT
	prod.productid,
	sup.supplierid,
	sup.companyname
FROM
	products AS prod
	INNER JOIN
	suppliers AS sup
	ON CAST(prod.supplierid AS TEXT) = sup.supplierid;