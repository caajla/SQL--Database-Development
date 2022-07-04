--DEMO *** OUTER JOIN ***


--PRIMJER 1
SELECT c.FirstName, 
       c.LastName, 
	   oh.SalesOrderNumber
FROM Customer AS c
LEFT OUTER JOIN SalesOrderHeader AS oh
ON c.CustomerID = oh.CustomerID
ORDER BY  oh.SalesOrderNumber DESC;


--PROVJERA REZULTAT
SELECT * FROM Customer



--PRIMJER 2
SELECT c.FirstName, 
       c.LastName, 
	   oh.SalesOrderNumber
FROM Customer AS c
LEFT OUTER JOIN SalesOrderHeader AS oh
ON c.CustomerID = oh.CustomerID
WHERE oh.SalesOrderNumber IS NULL
ORDER BY c.CustomerID;



--PRIMJER 3 (1. NACIN)
SELECT c.FirstName, 
       c.LastName, 
	   oh.SalesOrderNumber
FROM Customer AS c
LEFT OUTER JOIN SalesOrderHeader AS oh
ON c.CustomerID = oh.CustomerID
WHERE oh.SalesOrderNumber IS NOT NULL
ORDER BY c.CustomerID;


--PRIMJER 3 (2. NACIN)
SELECT c.FirstName, 
       c.LastName, 
	   oh.SalesOrderNumber
FROM Customer AS c
RIGHT OUTER JOIN SalesOrderHeader AS oh
ON c.CustomerID = oh.CustomerID
ORDER BY c.CustomerID;


--PRIMJER 3 (3. NACIN)
SELECT c.FirstName, 
       c.LastName, 
	   oh.SalesOrderNumber
FROM Customer AS c
INNER JOIN SalesOrderHeader AS oh
ON c.CustomerID = oh.CustomerID
ORDER BY c.CustomerID;



--PRIMJER 4
SELECT p.Name As ProductName, 
       oh.SalesOrderNumber
FROM Product AS p
LEFT JOIN SalesOrderDetail AS od
ON p.ProductID = od.ProductID
LEFT JOIN SalesOrderHeader AS oh --Dodatna tabela koju smo dodali takodjer mora biti LEFT JOIN
ON od.SalesOrderID = oh.SalesOrderID
ORDER BY p.ProductID;



--PRIMJER 5
SELECT p.Name As ProductName, 
       c.Name AS Category, 
	   oh.SalesOrderNumber
FROM Product AS p
LEFT OUTER JOIN SalesOrderDetail AS od
ON p.ProductID = od.ProductID
LEFT OUTER JOIN SalesOrderHeader AS oh
ON od.SalesOrderID = oh.SalesOrderID
INNER JOIN ProductCategory AS c --DODAJEMO NA PRVU TABELU, TAKO DA MOŽEMO KORISTITI INNER JOIN
ON p.ProductCategoryID = c.ProductCategoryID
ORDER BY p.ProductID;



/* LAB 2
Napisati upit koji ce vratiti FirstName i LastName iz tabele Customer (vratiti kao jednu
kolonu koja ce se zvati Customer) i SalesOrderNumber iz tabele SalesOrderHeader, 
ali samo za one Customere koji su kupili neki proizvod (gdje imamo SalesOrderNumber). 
*/
SELECT (c.FirstName + ' ' + c.LastName) as Customer, oh.SalesOrderNumber
FROM Customer as c
LEFT JOIN SalesOrderHeader as oh
ON c.CustomerID = oh.CustomerID
WHERE oh.SalesOrderNumber IS NOT NULL;



