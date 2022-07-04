--DEMO *** HAVING ***

--PRIMJER 1
SELECT Salesperson, 
       COUNT(CustomerID) Customers
FROM Customer
GROUP BY Salesperson
ORDER BY Salesperson;


--PRIMJER 1 (ERROR)
SELECT Salesperson, 
       COUNT(CustomerID) Customers
FROM Customer
WHERE COUNT(CustomerID) > 100
GROUP BY Salesperson
ORDER BY Salesperson;


--PRIMJER 1 (HAVING koristimo, kako bi filtrirali agregatne funkcije)
SELECT Salesperson, 
       COUNT(CustomerID) Customers
FROM Customer
GROUP BY Salesperson
HAVING COUNT(CustomerID) < 100
ORDER BY Salesperson;



/*PRIMJER 2 (Ukupni prihod po svakom pojedinacnom proizvodu gdje je cijena veca od 1000 i gdje je 
ukupni priod veci od 20000 */

SELECT p.Name, 
       SUM(sod.LineTotal) AS TotalRevenue
FROM SalesOrderDetail AS sod
JOIN Product AS p
ON p.ProductID = sod.ProductID
WHERE p.ListPrice > 1000
GROUP BY Name
HAVING SUM (LineTotal) > 20000
ORDER BY TotalRevenue DESC



/* LAB 5
Napisati upit koji ce vratiti podatke iz tabela SalesOrderHeader, SalesOrderDetail, Customer. 
Za sve one prodavace koji nemaju registravaonu niti jednu prodaju(narudzbenicu) potrebno je
vratiti podataka iz baze (vratiti NULL vrijednost) - voditi racuna koji JOIN koristimo.
Podatke je potrebno grupisati po atributu SalesPerson. Izlazni rezultat treba da prikaze
tri kolone:
- SalesPerson
- Ukupan broj kupaca po svakom pojedinacnom prodavacu 
- Ukupnu ostvarenu sumu po svakom pojedinacnom prodavacu
Izlazni rezultat filtrirati samo za one prodavace koji imaju vise od 100 kupaca
Rezultat sortirati po Ukupnoj sumi ostvarenoj po svakom pojedinacnom prodavacu
*/

SELECT c.SalesPerson,
       COUNT (c. CustomerID) AS CountCustomers,
       SUM (sod.LineTotal) AS Revenue
FROM Customer AS c 
LEFT JOIN  SalesOrderHeader AS soh
ON SOH.CustomerID = C.CustomerID 
LEFT JOIN SalesOrderDetail AS sod 
ON soh.SalesOrderID = sod.SalesOrderID
GROUP BY c.SalesPerson
HAVING COUNT (c. CustomerID)>100
ORDER BY Revenue DESC, CountCustomers DESC
