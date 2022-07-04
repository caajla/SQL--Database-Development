--DEMO *** CROSS JOIN ***


--Call each customer once per product
SELECT p.Name, 
       c.FirstName, 
	   c.LastName, 
	   c.Phone,
	   c.EmailAddress
FROM Product as p
CROSS JOIN Customer as c





--DEMO *** SELF JOIN ***

--KORAK 1: BRIŠEMO TABELU SalesLT.Employee
DROP TABLE Employee
GO


--KORAK 2: KREIRAMO NOVU TABELU Employee, koju koristimo u donjem primjeru
CREATE TABLE Employee
(EmployeeID int IDENTITY PRIMARY KEY,
EmployeeName nvarchar(256),
ManagerID int);
GO


--KORAK 3: RADIMO INSERT I UPDATE NAD TABELOM Employee
INSERT INTO Employee (EmployeeName, ManagerID)
SELECT DISTINCT Salesperson, NULLIF(CAST(RIGHT(SalesPerson, 1) as INT), 0)
FROM Customer;
GO
UPDATE Employee
SET ManagerID = (SELECT MIN(EmployeeID) FROM Employee WHERE ManagerID IS NULL)
WHERE ManagerID IS NULL
AND EmployeeID > (SELECT MIN(EmployeeID) FROM Employee WHERE ManagerID IS NULL);
GO
 

 --KORAK 4 RADIMO SELECT NAD TABELOM SalesLT.Employee
 SELECT * FROM Employee



-- PRIMJER 1 (RADMO SELF JOIN)
SELECT e.EmployeeName, 
       m.EmployeeName AS ManagerName
FROM Employee AS e
LEFT JOIN Employee AS m
ON e.ManagerID = m.EmployeeID
ORDER BY e.ManagerID;