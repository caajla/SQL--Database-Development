--DEMO *** GROUP BY ***


--PRIMJER 1 (ERROR)
SELECT Salesperson, 
       COUNT(CustomerID) Customers
FROM Customer
ORDER BY Salesperson;



--PRIMJER 2
SELECT Salesperson, 
       COUNT(CustomerID) Customers
FROM Customer
GROUP BY Salesperson
ORDER BY Salesperson;



--PRIMJER 3
SELECT c.Salesperson, 
       SUM(oh.TotalAmount) AS SalesRevenue
FROM Customer c
LEFT JOIN SalesOrderHeader oh
ON c.CustomerID = oh.CustomerID
GROUP BY c.Salesperson
ORDER BY SalesRevenue DESC;



--PRIMJER 4
SELECT c.Salesperson, 
       ROUND(ISNULL(SUM(oh.TotalAmount), 0.00),0) SalesRevenue
FROM Customer c
LEFT JOIN SalesOrderHeader oh
ON c.CustomerID = oh.CustomerID
GROUP BY c.Salesperson
ORDER BY SalesRevenue DESC;



--PRIMJER 5
SELECT c.Salesperson, 
       CONCAT(c.FirstName + ' ', c.LastName) AS Customer, 
	   ISNULL(SUM(oh.TotalAmount), 0.00) SalesRevenue
FROM Customer c
LEFT JOIN SalesOrderHeader oh
ON c.CustomerID = oh.CustomerID
GROUP BY c.Salesperson, CONCAT(c.FirstName +' ', c.LastName)
ORDER BY SalesRevenue, Customer



--PRIMJER 6 (Ukupni prihod po svakom pojedinacnom proizvodu, koji smo prodali)
SELECT p.Name, 
       SUM(sod.LineTotal) AS TotalRevenue
FROM SalesOrderDetail AS sod
JOIN Product AS p
ON p.ProductID = sod.ProductID
GROUP BY Name
ORDER BY TotalRevenue DESC



--PRIMJER 7 (Ukupni prihod po svakom pojedinacnom proizvodu gdje je cijena veca od 1000)
SELECT p.Name, 
       SUM(sod.LineTotal) AS TotalRevenue,
	   COUNT(p.Name) AS CountProductName
FROM SalesOrderDetail AS sod
JOIN Product AS p
ON p.ProductID = sod.ProductID
WHERE ListPrice > 1000
GROUP BY Name
ORDER BY TotalRevenue DESC



/* LAB 4
Napisati upit koji ce vratiti zajednicke podatke iz tabela SalesOrderHeader, SalesOrderDetail. 
Podatke je potrebno grupisati po atributu SalesOrderNumber. Izlazni rezultat treba da prikaze
tri kolone:
- SalesOrderNumber
- Ukupan broj prodanih proizvoda po svakoj pojedinacnoj narudzbenici
- Ukupnu ostvarenu sumu po svakoj pojedinacnoj narudzbenici, zaokruzenu na dvije decimale
Rezultat sortirati po Ukupnoj sumi ostvarenoj po svakoj pojedinacnoj narudzbenici
*/
SELECT oh.SalesOrderNumber,
       COUNT(od.ProductID) AS BrProizvodaPoNarudzbi,
       ROUND(SUM(od.LineTotal), 2) AS SumaPoNarudzbi
FROM SalesOrderHeader AS oh
JOIN SalesOrderDetail AS od
ON od.SalesOrderID = oh.SalesOrderID
GROUP BY oh.SalesOrderNumber
ORDER BY SumaPoNarudzbi DESC
