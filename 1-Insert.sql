--DEMO *** INSERT ***


--INICIJALNI KORAK - KREIRAMO TABELU
CREATE TABLE CallLog
(
	CallID int IDENTITY PRIMARY KEY NOT NULL,
	CallTime datetime NOT NULL DEFAULT GETDATE(),
	SalesPerson nvarchar(256) NOT NULL,
	CustomerID int NOT NULL REFERENCES Customer(CustomerID),
	PhoneNumber nvarchar(25) NULL,
	Notes nvarchar(max) NULL
);
GO



--PRIMJER 1 (INSERT)
INSERT INTO CallLog
VALUES
('2015-01-01T12:30:00', 'adventure-works\pamela0', 1, '245-555-0173', 'Returning call re: enquiry about delivery');


SELECT * FROM CallLog;



--PRIMJER 2 (INSERT - DEFAULT i NULL)
INSERT INTO CallLog
VALUES
(DEFAULT, 'adventure-works\david8', 2, '170-555-0127', NULL);


SELECT * FROM CallLog;



--PRIMJER 3 (INSERT - EKSPLICITNE KOLONE)
INSERT INTO CallLog (SalesPerson, CustomerID, PhoneNumber)
VALUES
('adventure-works\jillian0', 3, '279-555-0130');


SELECT * FROM CallLog;



--PRIMJER 4 (INSERT MULTIPLE ROWS)
INSERT INTO CallLog
VALUES
(DATEADD(dd,-2, GETDATE()), 'adventure-works\jillian0', 4, '710-555-0173', NULL),
(DEFAULT, 'adventure-works\shu0', 5, '828-555-0186', 'Called to arrange deliver of order 10987');


SELECT * FROM CallLog;



--PRIMJER 5 (INSERT KAO REZULTAT NEKOG UPITA)
INSERT INTO CallLog (SalesPerson, CustomerID, PhoneNumber, Notes)
SELECT SalesPerson, CustomerID, Phone, 'Sales promotion call'
FROM Customer
WHERE CompanyName = 'Big-Time Bike Store';


SELECT * FROM CallLog;




/* LAB 1 (5 minuta)
U tabelu CallLog insertovati sledece podatke:
	SalesPerson: 'adventure-works\student'
	CustomerID: 12
	PhoneNumber: '111-222-3333'
*/
INSERT INTO CallLog (SalesPerson, CustomerID, PhoneNumber)
VALUES('adventure-works\student', 12, '111-222-3333');


SELECT * FROM CallLog;