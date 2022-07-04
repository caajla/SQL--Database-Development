--DEMO *** UDF ***


--PRIMJER 1 (KREIRAMO UDF SKALARNU FUNKCIJU)
CREATE OR ALTER FUNCTION f_CustomerFullName
	(@id AS INT)
RETURNS VARCHAR(100)
AS
BEGIN
	DECLARE @FullName VARCHAR(100);
	SELECT @FullName = FirstName + ' ' + LastName
	FROM Customer
	WHERE CustomerID = @id;
	RETURN @FullName;
END;





--PROVJERIMO RAZULTATE ZA ID = 1
SELECT * FROM Customer
WHERE CustomerID = 1





--PRIMJER 1-1 (POZOVEMO SKALARNU FUNKCIJU ZA ID = 1)
SELECT dbo.f_CustomerFullName(1) AS FullName;





--PRIMJER 1-2 (PRIMJERPOZOVEMO SKALARNU FUNKCIJU NAD SVAKIM ID IZ TABELE Customer)
SELECT CustomerID,
       dbo.f_CustomerFullName(CustomerID) AS FullName,
	   EmailAddress
FROM Customer
ORDER BY CustomerID





--PRIMJER 1-3 (POZOVEMO SKALARNU FUNKCIJU NAD SVAKIM ID IZ TABELE SalesLT.SalesOrderHeader)
SELECT SalesOrderID,
       dbo.f_CustomerFullName(CustomerID) AS CustomerName,
	   SalesOrderNumber,
	   CONVERT(VARCHAR(20), OrderDate, 104) OrderDate
FROM SalesOrderHeader
ORDER BY CustomerName





--PRIMJER 2 (KREIRAMO FUNKCIJU KOJA RADI IZRACUNAVANJE NETO PRODAJE)
CREATE OR ALTER FUNCTION udfNetSale(
    @quantity INT,
    @list_price DEC(10,2),
    @discount DEC(4,2)
)
RETURNS DEC(10,2)
AS 
BEGIN
    RETURN @quantity * @list_price * (1 - @discount);
END;





--PRIMJER 2-1 (EKSPLICITNO DEFINISANE VRIJEDNOSTI)
SELECT dbo.udfNetSale(10,100,0.1) AS NetSale;





--PRIMJER 2-2 (POZOVEMO FUNKCIJU NAD TABELOM SalesLT.SalesOrderDetail)
SELECT SalesOrderID, 
       SUM(dbo.udfNetSale(OrderQty, UnitPrice, UnitPriceDiscount)) AS NetAmount
FROM SalesOrderDetail
GROUP BY SalesOrderID
ORDER BY NetAmount DESC;





/* LAB 2 
Kreirati UDF SalesLT.f_CustomerAddress koja ce za ulazni parametar CustomerID, 
vratiti skalarnu vrijednost oblika "49925 Crestview Drive N.E. (Rio Rancho, New Mexico)".
Nakon kreiranja funkcije napisati upit koji ce iz tabele SalesLT.Customer vratiti 
podataka CustomerID. Druga kolona tog upita ce biti poziv funkcije 
SalesLT.f_CustomerFullName, koja ce za ulazni parametar CustomerID vratiti CustomerName. 
Treca kolona ce biti poziv funkcije SalesLT.f_CustomerAddress, koja ce za ulazni 
parametar CustomerID vratiti CustomerAddress.
*/
--KREIRAMO FUNKCIJU SalesLT.f_CustomerAddress
CREATE OR ALTER FUNCTION f_CustomerAddress
	(@id AS INT)
RETURNS VARCHAR(100)
AS
BEGIN
	DECLARE @FullAddress VARCHAR(100);
	SELECT @FullAddress = AddressLine1 + ' (' + City + ', ' + StateProvince + ')' 
	FROM CustomerAddress ca
	WHERE CustomerID = @id;
	RETURN @FullAddress;
END;



--POZIVANJE DVIJE UDF SKALRANE FUNCKIJE
--ODREDJEN BROJ CustomerID nema adresu u tabeli CustomerAddress, pa je rezultat NULL
SELECT CustomerID,
       dbo.f_CustomerFullName(CustomerID) AS CustomerName,
	   dbo.f_CustomerAddress(CustomerID) AS CustomerAddress    
FROM Customer
ORDER BY CustomerID