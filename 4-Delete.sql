--DEMO *** DELETE ***

--PRIMJER 1

SELECT * FROM CallLog;

DELETE FROM CallLog
WHERE CustomerID = 529;

SELECT * FROM CallLog;



--PRIMJER 2

SELECT * FROM CallLog;

-- Delete rows (voditi racuna koji je tip podatka)
DELETE FROM CallLog
WHERE SalesPerson = 'adventure-works\pamela0'

SELECT * FROM CallLog;



--PRIMJER 3

SELECT * FROM CallLog;

-- Delete rows (zadnjih 7 dana)
DELETE FROM CallLog
WHERE CallTime < DATEADD(dd, -2, GETDATE());

SELECT * FROM CallLog;



-- Truncate the table
TRUNCATE TABLE CallLog;

SELECT * FROM CallLog;

DROP TABLE CallLog;

SELECT * FROM CallLog;



--PRIMJER 4

--INICIJALNA PROVJERA
SELECT * FROM ProductCategory
WHERE ProductCategoryID = 39

--INICIJALNA PROVJERA
SELECT * FROM Product
WHERE ProductCategoryID = 39


--ERROR / PARRENT - CHILD
DELETE FROM ProductCategory
WHERE ProductCategoryID = 39



--PRIMJER 5

--INICIJALNA PROVJERA CHILD TABELE
SELECT * FROM Product
WHERE ProductCategoryID = 39

--DELETE CHILD
DELETE FROM Product
WHERE ProductCategoryID = 39

--PROVJERA CHILD TABELE
SELECT * FROM Product
WHERE ProductCategoryID = 39


--INICIJALNA PROVJERA PARRENT TABELE
SELECT * FROM ProductCategory
WHERE ProductCategoryID = 39

--DELETE PARRENT
DELETE FROM ProductCategory
WHERE ProductCategoryID = 39

--PROVJERA PARRENT TABELE
SELECT * FROM ProductCategory
WHERE ProductCategoryID = 39



--PRIMJER 6

--INICIJALNO PROVJERIMO ZADNJI INSERTOVAN ID U TABELI Product
SELECT * FROM Product
WHERE ProductID = IDENT_CURRENT('Product')


--RADIMO DELETE NAD TABELOM Product, NA OSNOVU ZADNJEG ID-a 
DELETE FROM Product
WHERE ProductID = IDENT_CURRENT('Product')


--PROVJERA PODATAKA U TABELI Product
SELECT * FROM Product




/* LAB 4 (5 minuta)
Iz tabele Customer obrisati recorde cije ime pocinje sa 'Ron' ili je broj telefona '121-555-0121'. Prvo provjerite da li 
postoje rekordi u bazi, koji zadovoljavaju ove uslove, a onda uraditi naredbu DELETE.
*/
SELECT * FROM Customer
WHERE FirstName LIKE 'Ron%' OR Phone = '121-555-0121'; --4kolone afektovane

DELETE FROM Customer
WHERE FirstName LIKE 'Ron%' OR Phone = '121-555-0121';

SELECT * FROM Customer


