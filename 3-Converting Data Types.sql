--DEM0 *** KONVERZIJA TIPOVA PODATAKA ***


--PRIMJER 1
SELECT ProductID + Name
FROM Product; 
--Pogledati tipove podataka ProductID i Name u tabeli SalesLT.Product
--ERROR: Pokušavamo sabrati INT + NAVARCHAR



--PRIMJER 2.1 (CAST)
SELECT CAST(ProductID AS varchar(5)) + ': ' + Name AS ProductName
FROM Product;



--PRIMJER 2.2 (CONVERT)
SELECT CONVERT(varchar(5), ProductID) + ': ' + Name AS ProductName
FROM Product;



--PRIMJER 3 (CONVERT DATES)
SELECT SellStartDate,
       CONVERT(nvarchar(30), SellStartDate) AS ConvertedDate,
	   CONVERT(nvarchar(30), SellStartDate, 126) AS ISO8601FormatDate,
	   CONVERT(nvarchar(30), SellStartDate, 104) AS EuropeFormatDate
FROM Product;



--PRIMJER 4.1 (DATES & WHERE)
SELECT SellStartDate,
       CONVERT(nvarchar(30), SellStartDate) AS ConvertedDate,
	   CONVERT(nvarchar(30), SellStartDate, 126) AS ISO8601FormatDate,
	   CONVERT(nvarchar(30), SellStartDate, 104) AS EuropeFormatDate
FROM Product
WHERE SellStartDate BETWEEN '2019-01-01' AND '2019-12-31'



--PRIMJER 4.2 (CONVERT DATES & WHERE & ALIAS)
SELECT SellStartDate,
       CONVERT(nvarchar(30), SellStartDate) AS ConvertedDate,
	   CONVERT(nvarchar(30), SellStartDate, 126) AS ISO8601FormatDate,
	   CONVERT(nvarchar(30), SellStartDate, 104) AS EuropeFormatDate
FROM Product
WHERE EuropeFormatDate BETWEEN '01.01.2019' AND '31.12.2019'  --ERROR



--PRIMJER 4.3 (CONVERT DATES & WHERE)
SELECT SellStartDate,
       CONVERT(nvarchar(30), SellStartDate) AS ConvertedDate,
	   CONVERT(nvarchar(30), SellStartDate, 126) AS ISO8601FormatDate,
	   CONVERT(nvarchar(30), SellStartDate, 104) AS EuropeFormatDate
FROM Product
WHERE CONVERT(nvarchar(30), SellStartDate, 104) BETWEEN '01.01.2019' AND '31.12.2019' 
--PROBLEM TIP PODATKA (NVARCHAR)



--PRIMJER 5.1 (TRY TO CAST)
SELECT Name, 
       CAST (Size AS Integer) AS NumericSize
FROM Product; 
--ERROR: Pokušavam uraditi konverziju karaktera M u integer



--PRIMJER 5.2 (TRY_CAST)
SELECT Name, 
       TRY_CAST (Size AS Integer) AS NumericSize
FROM Product;
--NO ERROR: Ako konverzija nije moguća, vrati NULL



--PRIMJER 6 (TRY_CONVERT)
SELECT Name, 
       TRY_CONVERT (Integer, Size) AS NumericSize
FROM Product;
--NO ERROR: Ako konverzija nije moguća, vrati NULL





/* LAB 3
Napisati upit koji će iz tabele Product vratiti podatke o IMENU PROIZVODA (Name), 
CIJENI (ListPrice) i DATUM POČETKA PRODAJE (SellStartDate). Datum početka prodaje mora 
biti prikazan dva puta u rezultatu. Prva kolona predstavlja incijalni datum, a druga kolona 
predstavlja konvertovani datum prema europskom standardu. Kod za europski standard datuma
je 104. Rezultat filtrirati za ProductCategoryID 5,6,7 i da je SellStartDate u 2019-toj godini
*/
SELECT Name, ListPrice, SellStartDate, CONVERT(nvarchar(30),SellStartDate, 104) AS EuropeFormatDate
FROM Product
WHERE ProductCategoryID IN(5,6,7) AND SellStartDate BETWEEN '2019-01-01' AND '2019-12-31';
