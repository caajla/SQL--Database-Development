--DEMO *** KREIRANJE BAZE I OBJEKATA ***


/* KORAK 1 

* Kroz GUI kreiramo bazu podataka SalesDB
* Sve ostale karakteristike baze ostavimo na default-ne vrijednosti

*/


USE SalesDB




/* KORAK 2

* Kreiramo tabelu ProductCategory kroz GUI. 
* Tabela ima dva atributa (dvije kolone): ProductCategoryID int; Name nvarchar(50)
* Obje kolone ne smiju pohraniti NULL vrijednost
* Kreiramo PK kroz GUI na atributu ProductCategoryID
* Kroz GUI setujemo IDENTITY INSERT
* Pohranimo (snimimo) tabelu pod imenom ProductCategory

*/




-- KORAK 3.1. (Kreiramo tabelu Product kroz T-SQL kod)
CREATE TABLE Product(
	ProductID int IDENTITY(1,1) NOT NULL,
	Name nvarchar(50) NOT NULL,
	ProductNumber nvarchar(25) NOT NULL,
	Color nvarchar(15) NULL,
	StandardCost money NOT NULL,
	ListPrice money NOT NULL,
	Size nvarchar(5) NULL,
	Weight decimal(8, 2) NULL,
	ProductCategoryID int NOT NULL,
	SellStartDate datetime NOT NULL,
	SellEndDate datetime NULL,
	DiscontinuedDate datetime NULL)


-- KORAK 3.2. (Kroz GUI kreiramo PK_Product_ProductID)


-- KORAK 3.3. (Kroz GUI kreiramo FK_Product_ProductCategory_ProductCategoryID)




-- KORAK 4.1. (Kreiramo tabelu Customer kroz T-SQL kod)
CREATE TABLE Customer (
CustomerID int IDENTITY(1,1) NOT NULL,
Title nvarchar(8) NULL,
FirstName nvarchar(30) NOT NULL,
LastName nvarchar(30) NOT NULL,
CompanyName nvarchar(128) NULL,
SalesPerson nvarchar(256) NULL,
EmailAddress nvarchar(50) NULL,
Phone nvarchar(50) NULL)


--KORAK 4.2. (Kroz T-SQL kod kreiramo PK)
ALTER TABLE Customer
ADD PRIMARY KEY (CustomerID);




-- KORAK 5.1. (Kreiramo tabelu SalesOrderHeader kroz T-SQL kod)
CREATE TABLE SalesOrderHeader(
SalesOrderID int IDENTITY(1,1) PRIMARY KEY NOT NULL,
OrderDate datetime NOT NULL,
DueDate datetime NOT NULL,
ShipDate datetime NULL,
SalesOrderNumber nvarchar(20) NOT NULL,
CustomerID int NOT NULL,
TotalAmount  money NOT NULL)


-- KORAK 5.2. (Kreiramo tabelu SalesOrderHeader kroz T-SQL kod)
ALTER TABLE SalesOrderHeader
ADD FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID);




-- KORAK 6.1. (Kreiramo tabelu SalesOrderDetail kroz T-SQL kod)
CREATE TABLE SalesOrderDetail(
SalesOrderDetailID int IDENTITY(1,1) PRIMARY KEY NOT NULL,
SalesOrderID int NOT NULL REFERENCES SalesOrderHeader(SalesOrderID),
OrderQty smallint NOT NULL,
ProductID int NOT NULL REFERENCES Product(ProductID),
UnitPrice money NOT NULL,
UnitPriceDiscount money NOT NULL,
LineTotal money NOT NULL)




--LAB VJEŽBE


--LAB 1 (12 minuta)
--Kreirati tabelu CallLog, koja ce imati 6 kolona (atributa):
CREATE TABLE CallLog(
CallID int IDENTITY(1,1) PRIMARY KEY NOT NULL,
CallTime datetime NOT NULL DEFAULT GETDATE(),
SalesPerson nvarchar(256) NOT NULL,
CustomerID int NOT NULL FOREIGN KEY REFERENCES Customer(CustomerID),
PhoneNumber nvarchar(25) NULL,
Notes nvarchar(MAX) NULL)

--1. kolona: CallID 
--(tip podatka je cijeli broj; na koloni definisan IDENTITY; kolona je PK; ne smije pohraniti NULL vrijednosti)

--2. kolona: CallTime
--(tip podatka je datetime; ne smije pohraniti NULL vrijednosti; defaultna vrijednost je danasnji datum - DEFAULT GETDATE() )

--3. kolona: SalesPerson
--(tip podatka je nvarchar(256); ne smije pohraniti NULL vrijednosti)

--4. kolona: CustomerID
--(tip podatka je cijeli broj; ne smije pohraniti NULL vrijednosti; predstavlja FK na tabelu Customer - atribut CustomerID)

--5. kolona: PhoneNumber
--(tip podatka je nvarchar(25); smije pohraniti NULL vrijednosti)

--6. kolon: Notes
--(tip podatka je nvarchar(MAX); smije pohraniti NULL vrijednosti)







