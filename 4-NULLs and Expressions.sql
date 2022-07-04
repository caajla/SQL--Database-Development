--DEMO *** NULL FUNKCIJE ***


--PRIMJER 1 (NULL NUMBERS = 0)
SELECT Name, 
       ISNULL(TRY_CAST(Size AS Integer),0) AS NumericSize
FROM Product;


--PROVJERA REZULTAT BEZ ISNULL
SELECT Name, 
       TRY_CAST(Size AS Integer) AS NumericSize
FROM Product;



--PRIMJER 2 (NULL STRINGS = PRAZAN STRING)
SELECT ProductNumber,
       Color,
	   Size,
       ISNULL(Color, '') + ', ' + ISNULL(Size, '') AS ProductDetails
FROM Product;



-- PRIMJER 3 (Weight (decimal (8,2)))
SELECT Name, 
       ISNULL(Weight, 0) AS Weight
FROM Product;



--PRIMJER 4 (MULTI COLOR = NULL)
SELECT Name, 
       Color, 
	   NULLIF(Color, 'Multi') AS SingleColor
FROM Product;



--PRIMJER 5 (PRONAĐI PRVI NE NULL DATUM(
SELECT Name, 
       SellEndDate, 
       DiscontinuedDate, 
	   SellStartDate, 
	   COALESCE(DiscontinuedDate, SellEndDate, SellStartDate) AS LastActivity
FROM Product;



/* LAB 4
Prikazati listu jedinstvenih boja u tabeli Product, ali umjesto NULL vrijednosti 
prikazati 'None'. Rezultat treba da ima 1 kolonu: Color 
*/ 
SELECT ISNULL(Color, 'None') AS Color
FROM Product;

