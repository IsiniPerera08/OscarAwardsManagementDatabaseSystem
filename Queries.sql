--1) Counts the rows

SELECT COUNT(*) AS totalRowsCeremony FROM Ceremony;
SELECT COUNT(*) AS totalRowsCategory FROM Category;
SELECT COUNT(*) AS totalRowsCountry FROM Country;
SELECT COUNT(*) AS totalRowsFilm FROM Film;
SELECT COUNT(*) AS totalRowsNominee FROM Nominee;
SELECT COUNT(*) AS totalRowsNomination FROM Nomination;


--2) See the data

SELECT * 
FROM Ceremony;

SELECT * 
FROM Category;

SELECT *
FROM Country;

SELECT *
FROM Film;

SELECT *
FROM Nominee;

SELECT * 
FROM Nomination;


--3) All nominations for specific film

SELECT *
FROM Nomination
WHERE Nomination_Title = "Silent River";


--4) Films with more than 2 nominations(DESC)

SELECT Nomination_Title AS FilmTitle,
COUNT(*) AS TotalNominations
FROM Nomination
GROUP BY Nomination_Title
HAVING COUNT(*) > 2
ORDER BY TotalNominations DESC, FilmTitle ASC;


--5) Winner name per film (one row per film), the nominationResult stores the winner's name

SELECT 
Nomination_Title AS FilmTitle,
MAX(Nomination_Result) AS WinnerName
FROM Nomination
GROUP BY Nomination_Title 
ORDER BY FilmTitle;


--6) Winning nominations for a specific year (EDIT the year)

SELECT 
f.Film_Title, 
f.Film_Year,
n.Nomination_Role,
n.Nomination_Nominees AS NomineeName,
n.Nomination_Result AS WinnerName
FROM Film f
JOIN Nomination n
ON n.Nomination_Title= f.Film_Title
WHERE f.Film_Year= 2016
AND n.Nomination_Result= n.Nomination_Nominees 
ORDER BY f.Film_Title, n.Nomination_Role;


--7) Film with the most nominations overall

SELECT 
n.Nomination_Title AS FilmTitle,
COUNT(*) AS TotalNominations
FROM Nomination n
GROUP BY n.Nomination_Title
ORDER BY TotalNominations DESC, FilmTitle ASC;


--8) Top 10 most nominated people

SELECT 
n.Nomination_Nominees AS FullName,
COUNT(*) AS Nominations
FROM Nomination n
GROUP BY n.Nomination_Nominees
ORDER BY Nominations DESC, FullName ASC;


--9) Categories related to 'Best Picture'

SELECT Category_Id, Category_Name, Category_AwardType
FROM Category
WHERE Category_Name LIKE '%Best Picture%'
ORDER BY Category_Name;


--10) Ceremonies in a year range

SELECT Ceremony_Id, Ceremony_Year, Ceremony_Venue
FROM Ceremony
WHERE Ceremony_Year BETWEEN 2000 AND 2025
ORDER BY Ceremony_Year DESC, Ceremony_Id DESC;


--11) Films that have atleast 1 win but no more than 1 variation Query

SELECT Film_Title, Wins
FROM(
	SELECT n.Nomination_Title AS Film_Title,
	SUM(n.Nomination_Result= n.Nomination_Nominees) AS Wins
	FROM Nomination n
	GROUP BY n.Nomination_Title
) x
WHERE x.Wins BETWEEN 1 AND 1
ORDER BY x.Wins DESC, x.Film_Title ASC;

