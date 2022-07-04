--DEMO *** SCALAR FUNCTIONS ***


--PRIMJER 1
SELECT YEAR(SellStartDate) AS SellStartYear, 
       SellStartDate, 
	   ProductID, 
	   Name
FROM Product
ORDER BY SellStartYear



--PRIMJER 2
SELECT YEAR(SellStartDate) AS SellStartYear, 
	   DATENAME(mm,SellStartDate) AS SellStartMonth,
       DAY(SellStartDate) AS SellStartDay, 
	   DATENAME(dw, SellStartDate) AS SellStartWeekday,
	   CONVERT(NVARCHAR(30), SellStartDate, 104) AS SellStartDate,
	   ProductID, 
	   Name
FROM Product
ORDER BY SellStartYear;



--PRIMJER 3: SINTAKSA - DATEDIFF ( datepart , startdate , enddate )
SELECT DATEDIFF(yy,SellStartDate, GETDATE()) AS YearsSold, 
       ProductID, 
	   Name, 
	   SellStartDate
FROM Product
ORDER BY ProductID;



--PRIMJER 4
SELECT UPPER(Name) AS ProductName, 
       Name
FROM Product;



--PRIMJER 5
SELECT	ProductID,
		UPPER(Name) AS ProductName,
		Weight,
		ROUND(Weight, 0) AS ApproxWeight
FROM Product;



--PRIMJER 6
SELECT CONCAT(FirstName + ' ', LastName) AS FullName
FROM Customer;



--PRIMJER 7
SELECT Name, 
       ProductNumber, 
	   LEFT(ProductNumber, 2) AS ProductType
FROM Product;



/* LAB 1
Napisati upit koji ce iz tabele Product vratiti podatke: ProductID, Name (prikazati velikom slovom), 
SellStartDate (Konvertovan na EURO FORMAT), SellStartDate (prikaz imena mjeseca velikom slovomom, npr. JUNE), eight 
(zaokružiti na cijeli broj, npr. ako je broj 123,89 na izlazu prikazati 124). Upit filtrirati samo za one proizvode 
gdje je godina od SellStartDate jednaka 2019. Rezultat sortirat po ProductId. Rezultat treba da ima 5 kolona: 
ProductID / Name / FormatDate / SellStartMonth / ApproxWeight
*/
SELECT ProductID, UPPER(Name) as Name, CONVERT(nvarchar(30), SellStartDate, 104) AS FormatDate, DATENAME(mm, SellStartDate) as SellStartMonth, ROUND(Weight, 0) as ApproxWeight
FROM Product
WHERE  YEAR(SellStartDate)= 2019
ORDER BY ProductID;