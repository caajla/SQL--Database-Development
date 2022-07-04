--DEMO *** Aggregate Functions ***


--PRIMJER 1
SELECT COUNT(ProductID) AS Products, 
       COUNT(DISTINCT ProductCategoryID) AS Categories, 
	   AVG(ListPrice) AS AveragePrice
FROM Product;


--PRIMJER 1 (PROVJERA REZULTATA)
SELECT ProductID,
       ProductCategoryID,
	   ListPrice
FROM Product



--PRIMJER 2 (REZULTAT NIJE ISPRAVAN)
SELECT COUNT(*) AS Products, 
       COUNT(ProductCategoryID) AS Categories, 
	   AVG(ListPrice) AS AveragePrice
FROM Product;



--PRIMJER 3
SELECT COUNT(*) AS Products, 
       COUNT(DISTINCT ProductCategoryID) AS Categories, 
	   AVG(ListPrice) AS AveragePrice,
	   SUM(ListPrice) AS TotalListPrice
FROM Product;



--PRIMJER 4
SELECT COUNT(p.ProductID) AS BikeModels, 
       AVG(p.ListPrice) AveragePrice
FROM Product AS p
JOIN ProductCategory AS c
ON p.ProductCategoryID = c.ProductCategoryID
WHERE c.Name LIKE '%Bikes';



/* LAB 3
Napisati upit koji ce iz tabele Product vratiti podatke: Ukupan broj proizvoda, ukupan broj razlicitih 
kategorija proizvoda, Minimalnu cijenu ListPrice, Maksimalnu cijenu ListPrice, Prosjecnu cijenu ListPrice i 
Prosjecnu ListPrice zaokruženu na 2 decimale. Rezultat treba da ima 6 kolona: 
Products / Categories / MinListPrice / MaxListPrice / AvgListPrice / RoundAvgListPrice
*/
SELECT COUNT(ProductID) as Products ,COUNT(ProductCategoryID) as Categories, MIN(ListPrice) as MinListPrice , 
       MAX(ListPrice) as MaxListPrice, AVG(ListPrice) as AvgListPrice, ROUND(AVG(ListPrice), 2) as RoundAvgListPrice
FROM Product
