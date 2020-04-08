SELECT
	firstname,
	lastname,
	CONCAT(firstname, ' ', lastname) AS fullname
FROM
	employees;
	