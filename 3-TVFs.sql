--DEMO *** TVF ***


--PRIMJER 1
CREATE OR ALTER FUNCTION tvfCustomersByCity
(@City AS VARCHAR(20))
RETURNS TABLE
AS
RETURN
(SELECT c.CustomerID, 
        c.FirstName, 
		c.LastName, 
		ca.AddressLine1, 
		ca.City, 
		ca.StateProvince
 FROM Customer c 
 JOIN CustomerAddress ca
 ON c.CustomerID = ca.CustomerID
 WHERE City = @City);


SELECT * FROM tvfCustomersByCity('Be')

SELECT * FROM tvfCustomersByCity('Bellevue')

SELECT * FROM tvfCustomersByCity('Seattle')

SELECT CustomerID, FirstName, LastName FROM tvfCustomersByCity('London')





--PRIMJER 2
CREATE OR ALTER FUNCTION tvfCustomersByCityPatern
(@Patern AS VARCHAR(20))
RETURNS TABLE
AS
RETURN
(SELECT	c.CustomerID, 
        c.FirstName, 
		c.LastName, 
		ca.AddressLine1, 
		ca.City, 
		ca.StateProvince
 FROM Customer C 
 JOIN CustomerAddress CA
 ON C.CustomerID=CA.CustomerID
 WHERE City LIKE @Patern + '%');
 --WHERE City LIKE '%' + @Patern + '%');
 --WHERE City LIKE '%' + @Patern);



SELECT * FROM tvfCustomersByCityPatern('Be')
 




--PRIMJER 3 (Ulazni parametar - LOV)
--ALTER DATABASE AdventureWorksLT2019 SET COMPATIBILITY_LEVEL = 130

CREATE OR ALTER FUNCTION tvfCustomersByCity
(@ListaGradova AS NVARCHAR(500))
RETURNS TABLE
AS
RETURN
(SELECT c.CustomerID, 
        c.FirstName, 
		c.LastName, 
		ca.AddressLine1, 
		ca.City, 
		ca.StateProvince
FROM Customer c 
JOIN CustomerAddress ca
ON c.CustomerID = ca.CustomerID
WHERE City IN (SELECT value FROM STRING_SPLIT(@listaGradova, ';')));
 


SELECT * FROM tvfCustomersByCity('Dallas;Toronto;Montreal;Vancouver')





--PRIMJER 4
CREATE OR ALTER FUNCTION tvfCustomersByStateProvince
(@State AS VARCHAR(20))
RETURNS TABLE
AS
RETURN
(SELECT c.CustomerID, 
        c.FirstName, 
		c.LastName, 
		ca.AddressLine1, 
		ca.City, 
		ca.StateProvince
FROM Customer c 
JOIN CustomerAddress ca
ON c.CustomerID = ca.CustomerID
 WHERE StateProvince=@State);



SELECT * FROM tvfCustomersByStateProvince('California')

SELECT * FROM tvfCustomersByStateProvince('Texas')

SELECT * FROM tvfCustomersByStateProvince('England')





--PRIMJER 5
CREATE OR ALTER FUNCTION tvfMaxUnitPrice 
(@SalesOrderID int)
RETURNS TABLE
AS
RETURN
SELECT SalesOrderID, 
       MAX(UnitPrice) AS MaxUnitPrice 
FROM SalesOrderDetail
WHERE SalesOrderID=@SalesOrderID
GROUP BY SalesOrderID;



SELECT * FROM tvfMaxUnitPrice('71780')



--PROVJERA REZULTATA
SELECT SalesOrderID, UnitPrice
FROM SalesOrderDetail
WHERE SalesOrderID = 71780
ORDER BY UnitPrice DESC





/* LAB 3
Kreirati TVF tvfSalesPerson, koja ce kao ulazni parametar prihvatiti jednu 
vrijednost @SalesPerson AS NVARCHAR(50). TVF treba vratiti podatke iz tabela 
SalesOrderHeader, SalesOrderDetail, Customer. Za sve one 
prodavace koji nemaju registravaonu niti jednu prodaju(narudzbenicu) potrebno je 
vratiti podataka iz baze (vratiti NULL vrijednost). Podatke je potrebno grupisati 
po atributu SalesPerson. Izlazni rezultat treba da na osnovu ulaznog parametra prikaze 
sledece rezultate:
- SalesPerson
- Ukupan broj kupaca po svakom pojedinacnom prodavacu (bez obzira da li su kupci 
ostvarili kupovinu ili ne)
- Ukupnu ostvarenu sumu po svakom pojedinacnom prodavacu, zaokruženu na dvije decimale
bez obzira da li je suma neka vrijednost ili NULL)

Nakon kreiranja TVF, istu pozvati kako bi provjerili rezultate, kao npr.

SELECT * FROM tvfSalesPerson('adventure-works\josé1')
SELECT * FROM tvfSalesPerson('adventure-works\jae0')
SELECT * FROM tvfSalesPerson('adventure-works\shu0')
*/
CREATE OR ALTER FUNCTION tvfSalesPerson
(@SalesPerson AS NVARCHAR(50))
RETURNS TABLE
AS
RETURN
(SELECT c.SalesPerson,
        COUNT (c. CustomerID) AS CountCustomers,
        ROUND(SUM (sod.LineTotal),2) AS Revenue
FROM SalesOrderHeader AS soh
INNER JOIN SalesOrderDetail AS sod
ON soh.SalesOrderID = sod.SalesOrderID
RIGHT JOIN Customer AS c
ON SOH.CustomerID = C.CustomerID
WHERE SalesPerson = @SalesPerson
GROUP BY c.SalesPerson)



SELECT * FROM tvfSalesPerson('adventure-works\josé1')

SELECT * FROM tvfSalesPerson('adventure-works\jae0')

SELECT * FROM tvfSalesPerson('adventure-works\shu0')
