--DEMO *** INNER JOIN ***


--PRIMJER 1 (Basic inner join)
SELECT Product.Name As ProductName, 
       ProductCategory.Name AS Category
FROM Product
INNER JOIN ProductCategory
ON Product.ProductCategoryID = ProductCategory.ProductCategoryID;



--PRIMJER 2 (Table aliases)
SELECT p.Name As ProductName, 
       c.Name AS Category
FROM Product AS p
JOIN ProductCategory As c
ON p.ProductCategoryID = c.ProductCategoryID;



--PRIMJER 3 - ERROR (WHERE se izvršava prije SELECT - ALISA UNKNOWN)
SELECT p.Name As ProductName, 
       c.Name AS Category
FROM Product AS p
JOIN ProductCategory As c
ON p.ProductCategoryID = c.ProductCategoryID
WHERE Category = 'Road Frames'



--PRIMJER 4 (WHERE clause)
SELECT p.Name As ProductName, 
       c.Name AS Category
FROM Product AS p
JOIN ProductCategory As c
ON p.ProductCategoryID = c.ProductCategoryID
WHERE c.Name = 'Road Frames'



--PRIMJER 5 (Unutar WHERE možemo korisiti i atribute koji nisu navedeni u SELECT)
SELECT p.Name As ProductName, 
       c.Name AS Category
FROM Product AS p
JOIN ProductCategory As c
ON p.ProductCategoryID = c.ProductCategoryID
WHERE p.ListPrice > 1000



--PRIMJER 6 (WHERE & ORDER BY)
SELECT p.Name As ProductName, 
       c.Name AS Category,
	   ListPrice
FROM Product AS p
JOIN ProductCategory As c
ON p.ProductCategoryID = c.ProductCategoryID
WHERE ListPrice > 1000
ORDER BY ListPrice DESC



--PRIMJER 7 (Joining more than 2 tables)
SELECT oh.SalesOrderNumber,
       CONVERT(VARCHAR(20), oh.OrderDate, 104) AS OrderDate,	   
	   p.Name As ProductName, 
	   od.OrderQty, 
	   od.UnitPrice, 
	   od.LineTotal
FROM SalesOrderHeader AS oh
JOIN SalesOrderDetail AS od
ON od.SalesOrderID = oh.SalesOrderID
JOIN Product AS p
ON od.ProductID = p.ProductID
ORDER BY oh.OrderDate, oh.SalesOrderID, od.SalesOrderDetailID;



--PRIMJER 8 (Multiple join predicates)
SELECT oh.SalesOrderNumber, 
       CONVERT(VARCHAR(20), oh.OrderDate, 104) AS OrderDate,	   
	   p.Name As ProductName, 
	   od.OrderQty, 
	   od.UnitPrice, 
	   od.LineTotal
FROM SalesOrderHeader AS oh
JOIN SalesOrderDetail AS od
ON od.SalesOrderID = oh.SalesOrderID
JOIN Product AS p
ON od.ProductID = p.ProductID 
WHERE od.OrderQty > 1
ORDER BY oh.OrderDate, oh.SalesOrderID, od.SalesOrderDetailID; 



/* LAB 1
Napisati upit koji će kao rezultat vratiti zajedničke podatke iz tabela Product i 
ProductCategory. Atributi (kolone) koje treba prikazati su IME KATEGORIJE (c.Name),
IME PROIZVODA (p.Name), ULAZNU CIJENU (p.StandardCost), IZLAZNU CIJENU (p.ListPrice). 
Potrebno je prikazati samo one podatke gdje je IME KATEGORIJE 'Mountain Bikes'. Finalni rezultat 
sortirat po ListPrice (od veće ka manjoj vrijednosti)
*/
SELECT c.Name as NameCategory, p.Name as NameProduct, p.StandardCost, p.ListPrice
FROM Product as p
INNER JOIN ProductCategory as c
ON p.ProductCategoryID = c.ProductCategoryID
WHERE c.Name = 'Mountain Bikes'
ORDER BY ListPrice DESC;