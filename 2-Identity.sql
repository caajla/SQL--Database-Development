--DEMO *** IDENTITY ***


--PRIMJER 1 (Retrieving inserted identity)
INSERT INTO CallLog (SalesPerson, CustomerID, PhoneNumber)
VALUES
('adventure-works\josé1', 10, '150-555-0127');


SELECT SCOPE_IDENTITY();


SELECT * FROM CallLog;



--PRIMJER 2 (Pokušaj unosa CallID) => ERROR
INSERT INTO CallLog (CallID, SalesPerson, CustomerID, PhoneNumber)
VALUES
(11, 'adventure-works\josé1', 11, '926-555-0159');



--PRIMJER 3 (Overriding Identity (SET IDENTITY_INSERT Omogucava da se ekplictne vrijednosti insertuju u identity kolonu))
SET IDENTITY_INSERT CallLog ON;


INSERT INTO CallLog (CallID, SalesPerson, CustomerID, PhoneNumber)
VALUES
(11, 'adventure-works\josé1', 11, '926-555-0159');


SET IDENTITY_INSERT CallLog OFF;


SELECT * FROM CallLog;



--PRIMJER 4 (Retrieving inserted identity)
INSERT INTO CallLog (SalesPerson, CustomerID, PhoneNumber)
VALUES
('adventure-works\shu0', 10, '151-777-0127');


SELECT * FROM CallLog;  -- Obrati pažnju na CallID



--PRIMJER 4 (Insert a product)
INSERT INTO Product (Name, ProductNumber, StandardCost, ListPrice, ProductCategoryID, SellStartDate)
VALUES
('LED Lights1', 'LT-L1231', 2.56, 12.99, 37, GETDATE());


SELECT SCOPE_IDENTITY();


SELECT * FROM Product
WHERE ProductID = SCOPE_IDENTITY();


SELECT * FROM Product
WHERE ProductID = IDENT_CURRENT('Product')



--PRIMJER 4 (Insert a new category with two products)
INSERT INTO ProductCategory (Name)
VALUES
('Bells and Horns');


SELECT * FROM ProductCategory
WHERE ProductCategoryID = IDENT_CURRENT('ProductCategory')


INSERT INTO Product (Name, ProductNumber, StandardCost, ListPrice, ProductCategoryID, SellStartDate)
VALUES
('Bicycle Bell', 'BB-RING', 2.47, 4.99, IDENT_CURRENT('ProductCategory'), GETDATE()),
('Bicycle Horn', 'BH-PARP', 1.29, 3.75, IDENT_CURRENT('ProductCategory'), GETDATE());


SELECT * FROM Product;



/* LAB 2 (5 minuta)
U tabelu Customer insertovati sledece vrijednosti: 
('Mujo', 'Mujic', 'Bitology', 'adventure-works\josé1'),
('Pero', 'Peric', 'Bitology', 'adventure-works\josé1'), 
za atribute (FirstName, LastName, CompanyName, SalesPerson). 
Nakon toga uz pomoc naredbe SCOPE_IDENTITY(); identifikovati poslednji insertovani record. 
*/
INSERT INTO Customer (FirstName, LastName, CompanyName, SalesPerson)
VALUES ('Mujo', 'Mujic', 'Bitology', 'adventure-works\josé1'),
       ('Pero', 'Peric', 'Bitology', 'adventure-works\josé1');

SELECT SCOPE_IDENTITY() AS LastRecord;







