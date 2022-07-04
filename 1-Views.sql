--DEMO *** VIEWS ***


--PRIMJER 1.1 (KREIRANJE VIEW-a)
CREATE OR ALTER VIEW vProductOrders
AS
SELECT oh.SalesOrderNumber,
       CONVERT(VARCHAR(20), oh.OrderDate, 104) AS OrderDate,
	   oh.CustomerID,
	   p.Name As ProductName,
	   p.ProductID,
	   p.ProductCategoryID,
	   od.OrderQty, 
	   od.UnitPrice, 
	   od.LineTotal
FROM SalesOrderHeader AS oh
JOIN SalesOrderDetail AS od
ON od.SalesOrderID = oh.SalesOrderID
JOIN Product AS p
ON od.ProductID = p.ProductID





--PRIMJER 1.2 (PISANJE UPITA NA VIEW-u)
SELECT * FROM vProductOrders
ORDER BY OrderDate, SalesOrderNumber





--PRIMJER 1.3 (PISANJE UPITA NA VIEW-u)
SELECT * FROM vProductOrders
WHERE OrderDate = '01.06.2021'
ORDER BY LineTotal DESC





--PRIMJER 2 (VIEW & GROUP BY)
SELECT ProductName,
       COUNT(ProductID) AS ProductCounts,
	   AVG (UnitPrice) AS AvgProductPrice,
	   SUM (OrderQty) AS Quantity
FROM vProductOrders
GROUP BY ProductName
ORDER BY AvgProductPrice DESC 





--PRIMJER 3 (JOIN VIEW & TABLE)
SELECT pc.Name,
       COUNT(ProductID) AS CategoriesCount,
	   AVG (UnitPrice) AS AvgProductPrice,
	   SUM (OrderQty) AS Quantity
FROM vProductOrders vpo
JOIN ProductCategory pc
ON vpo.ProductCategoryID = pc.ProductCategoryID
GROUP BY pc.Name
ORDER BY AvgProductPrice DESC 





--PRIMJER 4.1 (JOIN VIEW & TABLE)
SELECT c.SalesPerson,
       COUNT(c.CustomerID) AS Customers,
	   SUM (LineTotal) AS SumLineTotal
FROM vProductOrders vpo
JOIN Customer c
ON c.CustomerID = vpo.CustomerID
GROUP BY c.SalesPerson
ORDER BY SumLineTotal DESC 
-- Da li je ovaj rezultat OK ???





--PRIMJER 4.2 (JOIN VIEW & TABLE)
SELECT c.SalesPerson,
       COUNT(c.CustomerID) AS Customers,
	   SUM (LineTotal) AS SumLineTotal
FROM vProductOrders vpo
RIGHT JOIN Customer c
ON c.CustomerID = vpo.CustomerID
GROUP BY c.SalesPerson
ORDER BY SumLineTotal DESC 
-- Voditi računa iz kojeg skupa podataka koristimo atribut CustomerID





--PRIMJER 5.1 (VIEW & CORRELATED SUBQUERY)
CREATE OR ALTER VIEW vAvgSellingPrice
AS
SELECT ProductID, 
       Name, 
	   StandardCost, 
	   ListPrice,
	   (SELECT AVG(UnitPrice)
	    FROM SalesOrderDetail AS SOD
	    WHERE P.ProductID = SOD.ProductID) AS AvgSellingPrice
FROM Product AS P





--PRIMJER 5.2 (VIEW & CORRELATED SUBQUERY)
SELECT * FROM vAvgSellingPrice





--PRIMJER 5.3 (VIEW & CORRELATED SUBQUERY)
SELECT * FROM vAvgSellingPrice AS asp
WHERE StandardCost > (SELECT AVG(UnitPrice)
                      FROM SalesOrderDetail AS SOD
					  WHERE asp.ProductID = SOD.ProductID)
ORDER BY asp.ProductID;





/* LAB 1
Kreirati VIEW koji će nam vratiti ProductID i Name, ali samo za one proizvode koji u 
tabeli SalesOrderDetail imaju narudzbenicu u kojima je kolicina veca od 15 puta,
za taj konkretni proizvod. ProductID i Name se nalaze u tabeli Product, a 
kolicina (OrderQty) se nalazi u tabeli SalesOrderDetail
*/
CREATE OR ALTER VIEW vProductQty
AS
SELECT ProductID, Name FROM Product
WHERE ProductID IN
(SELECT ProductID FROM SalesOrderDetail
WHERE OrderQty>15)



SELECT * FROM vProductQty



--PROVJERA REZULTATA
SELECT * FROM SalesOrderDetail
WHERE OrderQty > 15



--IZMJENA NA VIEW
ALTER VIEW vProductQty
AS
SELECT ProductID, Name FROM Product
WHERE ProductID IN
(SELECT ProductID FROM SalesOrderDetail
WHERE OrderQty>20)



--UPIT SE MOZE RIJESITI I SA INNER JOIN
CREATE OR ALTER VIEW vProductQty
AS
SELECT p.ProductId, Name
FROM Product p
INNER JOIN SalesOrderDetail od
ON p.ProductID=od.ProductID
WHERE OrderQTY>15



SELECT * FROM vProductQty



--PROVJERA REZULTATA
SELECT * FROM SalesOrderDetail
WHERE OrderQty > 15
