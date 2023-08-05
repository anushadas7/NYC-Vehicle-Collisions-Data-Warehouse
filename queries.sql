--a)number of collisions
SELECT COUNT(DISTINCT UniqueID)
FROM Fact_MVCollision

--b)number of people injured
SELECT COUNT(Person_ID)
FROM FCT_Person
WHERE Person_Injury = 'Injured'

--c)total people killed
SELECT COUNT(Person_ID)
FROM FCT_Person
WHERE Person_Injury ='killed'

--d)How Many Car Accidents Are There in NYC Every Year?
SELECT d.YearNumber AS Year, COUNT(mv.UniqueID) AS Collisions 
FROM Fact_MVCollision mv
JOIN Fact_Crash c
ON mv.CrashSK = c.CrashSK
JOIN Dim_Date d
ON c.DateSK = d.DateSK
GROUP BY d.YearNumber
ORDER BY d.YearNumber

--e)Which Boroughs in New York City Have the Most Accidents?
SELECT TOP 1 c.Borough AS Borough, COUNT(mv.UniqueID) AS Collisions 
FROM Fact_MVCollision mv
JOIN Fact_Crash c
ON mv.CrashSK = c.CrashSK
WHERE c.Borough!= 'NULL' 
GROUP BY Borough
ORDER BY Collisions DESC





