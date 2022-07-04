--DEMO *** UNION & UNION ALL ***


--KORAK 1: CREATE VIEW vCustomers
CREATE VIEW vCustomers
AS
SELECT DISTINCT FirstName, LastName
FROM Customer
WHERE LastName >= 'M'
OR CustomerID=3;
GO


--KORAK 2: CREATE VIEW vEmployees
CREATE VIEW vEmployees
AS
SELECT DISTINCT FirstName, LastName
FROM Customer
WHERE LastName <= 'M'
OR CustomerID = 3;
GO


--PROVJERA PODATAKA - BROJ REDOVA: 336
SELECT FirstName, LastName
FROM vEmployees


--PROVJERA PODATAKA - BROJ REDOVA: 106
SELECT FirstName, LastName
FROM vCustomers



--PRIMJER 1 (336 + 106 = 442) - UNION UKLANJA DUPLIKAT (441)
SELECT FirstName, LastName
FROM vEmployees
UNION
SELECT FirstName, LastName
FROM vCustomers



--PRIMJER 2 (336 + 106 = 442) - UNION ALL NE UKLANJA DUPLIKAT (442)
SELECT FirstName, LastName
FROM vEmployees
UNION ALL
SELECT FirstName, LastName
FROM vCustomers



--PRIMJER 3 (DODATNA KOLONA - 442)
SELECT FirstName, LastName, 'Employee' AS Type
FROM vEmployees
UNION
SELECT FirstName, LastName, 'Customer'
FROM vCustomers



--PRIMJER 4 (DODATNA KOLONA - 442)
SELECT FirstName, LastName, 'Employee' AS Type
FROM vEmployees
UNION ALL
SELECT FirstName, LastName, 'Customer'
FROM vCustomers





--DEMO *** INTERSECT & EXCEPT ***


--PRIMJER 5 *** INTERSECT *** (1 RED)
SELECT FirstName, LastName
FROM vEmployees
INTERSECT
SELECT FirstName, LastName
FROM vCustomers
ORDER BY LastName;



--PRIMJER 6 *** EXCEPT *** (106 - 1 (zajednicki) = 105 REDOVA)
SELECT FirstName, LastName
FROM vCustomers
EXCEPT
SELECT FirstName, LastName
FROM vEmployees
ORDER BY LastName;