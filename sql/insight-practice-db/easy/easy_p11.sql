SELECT
	firstname,
	lastname,
	title,
	DATE(birthdate)
FROM
	employees
ORDER BY birthdate
	