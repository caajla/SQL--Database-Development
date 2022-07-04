--DEMO *** UPDATE ***

--PRIMJER 1

SELECT * FROM CallLog;

-- Update a table
UPDATE CallLog
SET Notes = 'No notes'
WHERE Notes IS NULL;

SELECT * FROM CallLog;



--PRIMJER 2

-- Update multiple columns

SELECT * FROM CallLog;

UPDATE CallLog
SET SalesPerson = '', PhoneNumber = ''

SELECT * FROM CallLog;



--PRIMJER 3

-- Update from results of a query

SELECT * FROM CallLog;

UPDATE CallLog 
SET SalesPerson = c.SalesPerson, PhoneNumber = c.Phone
FROM Customer AS c
WHERE c.CustomerID = CallLog.CustomerID; --vraćene kolone preko Customer tabele koje su obrisane u prethodnom zadatku

SELECT * FROM CallLog;



--PRIMJER 4

-- Inicijalna provjera rezultata ListPrice
SELECT * FROM Product
WHERE ProductCategoryID = 38

UPDATE Product
SET ListPrice = ListPrice * 1.1
WHERE ProductCategoryID = 38

-- Provjera ListPrice nakon UPDATE-a
SELECT * FROM Product
WHERE ProductCategoryID = 38



--PRIMJER 5

-- Discontinue products
SELECT * FROM Product 
WHERE ProductCategoryID=35
--DiscontinuedDate = NULL

UPDATE Product
SET DiscontinuedDate = GETDATE()
WHERE ProductCategoryID = 35

SELECT * FROM Product 
WHERE ProductCategoryID=35
--DiscontinuedDate = GETDATE



/* LAB 3 (5 minuta)
Uraditi UPDATE tabele SalesLT.Customer, na nacin da izmjenite podatke FirstName i 
LastName korisnika u svoje ime i prezime, za CustomerID = 10. Upit treba da uradi 
update samo jednog reda.
*/
SELECT * FROM Customer;

UPDATE Customer
SET FirstName = 'Ajla', LastName = 'Camovic'
WHERE CustomerID = 10;

SELECT * FROM Customer;
