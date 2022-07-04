--DEMO *** Logical functions ***


--PRIMJER 1 (ISNUMERIC)
SELECT Name, 
       Size AS NumericSize,
	   ISNUMERIC(Size) as IsNumericSize
FROM Product



--PRIMJER 2 (ISNUMERIC & WHERE) 
SELECT Name, 
       Size AS NumericSize,
	   ISNUMERIC(Size) as IsNumericSize
FROM Product
WHERE ISNUMERIC(Size) = 1



--PRIMJER 3 (IIF)
SELECT Name, 
       ProductCategoryID,
       IIF(ProductCategoryID IN (5,6,7), 'Bike', 'Other') AS ProductType
FROM Product
ORDER BY ProductCategoryID;



--PRIMJER 4 (IIF)
SELECT Name, 
       ProductCategoryID,
	   ListPrice,
       IIF(ListPrice > 1000, 'High', 'Low') AS PricePoint
FROM Product
ORDER BY ListPrice DESC;



--PRIMJER 5 (IIF & ISNUMERIC)
SELECT Name, 
       Size,
       IIF(ISNUMERIC(Size) = 1, 'Numeric', 'Non-Numeric') AS SizeType
FROM Product;



--PRIMJER 6 (CHOOSE)
SELECT ProductCategoryID,
       CHOOSE (ProductCategoryID, 'Bikes','Components','Clothing','Accessories') AS ProductType
FROM ProductCategory




/* LAB 2
Napisati upit koji ce iz tabele Product vratiti podatke: ProductID, Name (prikazati velikom slovom),
Weight (zaokružiti na cijeli broj, npr. ako je broj 123,89 na izlazu prikazati 124,00), SellStartDate 
(Prikazati samo godinu od SellStartDate) i Size. Upit filtrirati samo za one proizvode gdje je Size 
NUMERICKA vrijednost. Rezultat treba da ima 5 kolona: 
ProductID / ProductName / ApproxWeight / SellStartYear / Size
*/
SELECT ProductID, UPPER(Name) as ProductName, ROUND(Weight,0) as ApproxWeight, YEAR(SellStartDate) as SellStartYear, Size
FROM Product
WHERE ISNUMERIC(Size)=1;
