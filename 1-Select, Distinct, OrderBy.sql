--DEMO *** SELECT / DISTINCT / ORDER BY ***


--PRIMJER 1 *** SELEKTOVANJE REDOVA ***


--PRIMJER 1.1
SELECT * FROM Product;



--PRIMJER 1.2
SELECT Name, StandardCost, ListPrice
FROM Product;



--PRIMJER 1.3
SELECT Name, 
       StandardCost, 
	   ListPrice, 
	   ListPrice - StandardCost
FROM Product;



--PRIMJER 1.4
SELECT Name, 
       StandardCost, 
	   ListPrice, 
	   ListPrice - StandardCost AS Margin
FROM Product;



--PRIMJER 1.5
SELECT ProductNumber, 
       Color, 
	   Size, 
	   Color + ', ' + Size AS ProductDetails
FROM Product; 





--PRIMJER 2 *** ELIMINACIJA DUPLIKATA ***


--PRIMJER 2.1
SELECT Color 
FROM Product;


SELECT DISTINCT Color
FROM Product;



--PRIMJER 2.2
SELECT FirstName
FROM Customer


SELECT DISTINCT FirstName
FROM Customer



--PRIMJER 2.3
--INICIJALNA PROVJERA REZULTATA (847 redova)
SELECT FirstName, LastName
FROM Customer
ORDER BY FirstName, LastName


SELECT DISTINCT FirstName, LastName
FROM Customer





--PRIMJER 3 *** SORTIRANJE REZULTATA ***


--PRIMJER 3.1
SELECT ProductID, Name, StandardCost, ListPrice 
FROM Product 
ORDER BY ListPrice  -- ASC DEFAULT



--PRIMJER 3.2
SELECT ProductID, Name, StandardCost, ListPrice 
FROM Product 
ORDER BY ListPrice DESC



--PRIMJER 3.3
SELECT * FROM SalesOrderHeader
ORDER BY TotalAmount DESC



--PRIMJER 3.4
SELECT * FROM SalesOrderHeader
ORDER BY OrderDate ASC, TotalAmount DESC



--PRIMJER 3.5 (Sortiranje možemo uraditi i po koloni koja nije u SELECT)
SELECT Name, StandardCost, ListPrice 
FROM Product 
ORDER BY ProductID DESC





/* LAB 1
Napisati upit koji će iz tabele Product vratiti podatke:  ProductID, ProductCategoryID, Name, StandardCost, ListPrice.
Podatke je potrebno sortirati inicijalno po ProductCategoryID (od manje ka vecoj vrijednosti), 
a nakon toga po ListPrice (od vece ka manjoj vrijednosti).
*/
SELECT ProductID, ProductCategoryID, Name, StandardCost, ListPrice
FROM Product
ORDER BY ProductCategoryID, ListPrice DESC;
