--DEMO *** FILTRIRANJE PODATAKA ***


--PRIMJER 1
SELECT ProductCategoryID, Name, Color, Size 
FROM Product 
WHERE ProductCategoryID = 6;



--PRIMJER 2 (U WHERE ne moramo korisiti atribute iz SELECT)
SELECT Name, Color, Size 
FROM Product 
WHERE ProductCategoryID = 6;



--PRIMJER 3
SELECT ProductCategoryID, Name, Color, Size 
FROM Product 
WHERE Color != 'Red';



--PRIMJER 4
SELECT ProductNumber, Name, ListPrice 
FROM Product 
WHERE ProductNumber LIKE 'FR%';



--PRIMJER 5
SELECT ProductNumber, Name, ListPrice 
FROM Product 
WHERE ProductNumber LIKE '_B%';



--PRIMJER 6
SELECT Name 
FROM Product 
WHERE SellEndDate IS NOT NULL;



--PRIMJER 7
SELECT Name, SellEndDate 
FROM Product 
WHERE SellEndDate BETWEEN '2019/1/1' AND '2019/12/31';



--PRIMJER 8
SELECT ProductCategoryID, Name, ListPrice 
FROM Product 
WHERE ProductCategoryID IN (5, 6, 7);



--PRIMJER 9
SELECT ProductCategoryID, Name, ListPrice, SellEndDate 
FROM Product 
WHERE ProductCategoryID IN (5, 6, 7) AND SellEndDate IS NULL;



--PRIMJER 10
SELECT ProductCategoryID, Name, ListPrice, SellEndDate 
FROM Product 
WHERE ProductCategoryID IN (5, 6, 7) AND SellEndDate IS NULL
ORDER BY ProductCategoryID, ListPrice DESC;





/* LAB 2
Iz tabele Product, prikazati Name, ProductCategoryID, ProductNumber, ali samo za 
one ProductNumber koji počinju sa 'FR' ili za one ProductCategoryID koje su jednake 
5 ili 6 ili 7.
*/ 
SELECT Name, ProductCategoryID, ProductNumber
FROM Product
WHERE ProductCategoryID IN (5,6,7) OR ProductNumber LIKE 'FR%';