--1) Get Person Nomination History

DELIMITER $$
CREATE PROCEDURE GetPersonNominationHistory(IN p_fullname VARCHAR(255))
BEGIN
SELECT 
n.Nomination_Title AS Film_Title,
n.Nomination_Role AS Role,
CASE WHEN n.Nomination_Result = n.Nomination_Nominees THEN 'WINNER' ELSE 'Nominee' END AS Status
FROM Nomination AS n
WHERE n.Nomination_Nominees = p_fullname
ORDER BY n.Nomination_Title, n.Nomination_Role;
END $$
DELIMITER;


--2) CountFilmNominations

DELIMITER $$
CREATE PROCEDURE CountFilmNominations(IN p_title VARCHAR(255), OUT out_total INT)
BEGIN
SELECT COUNT(*) INTO Out_total
FROM Nomination
WHERE Nomination_Title = p_title;
END$$
DELIMITER;


--3) WinnersByYear

DELIMITER $$
CREATE PROCEDURE WinnersByYear(IN p_year INT)
BEGIN
SELECT 
f.Film_Title,
f.Film_Year,
n.Nomination_Role AS Role,
n.Nomination_Result AS WinnerName
FROM Film f
JOIN Nomination n
ON n.Nomination_Title= f.Film_Title
WHERE f.Film_Year= p_year
AND n.Nomination_Result= n.Nomination_Nominees
ORDER BY f.Film_Title, n.Nomination_Role;
END$$
DELIMITER;



--4) TopNominees

DELIMITER $$
CREATE PROCEDURE TopNominees(IN p_limit INT)
BEGIN
SELECT
n.Nomination_Nominees AS FullName,
COUNT(*) AS Nominations
FROM Nomination n
GROUP BY n.Nomination_Nominees
ORDER BY Nominations DESC, FullName ASC
LIMIT p_limit;
END$$
DELIMITER;


--5) Search Category

DELIMITER $$
CREATE PROCEDURE SearchCategories(IN p_like VARCHAR(100))
BEGIN
SELECT Category_Id, Category_Name, Category_AwardType
FROM Category
WHERE Category_Name like p_like
OR Category_AwardType Like p_like
ORDER BY Category_Name;
END $$
DELIMITER ;



--6) Add nominee

DELIMITER $$
CREATE PROCEDURE AddNominee(
IN p_first VARCHAR(100),
IN p_last VARCHAR(100),
IN p_birth DATE,
OUT new_id INT
)
BEGIN
DECLARE next_id INT;
SELECT IFNULL(MAX(Nominee_Id),0)+1 INTO next_id From Nominee;
INSERT INTO Nominee (Nominee_Id, Nominee_FirstName, Nominee_LastName, Nominee_birthdate)
VALUES (next_id, p_first, p_last, p_birth);
SET new_id = next_id;
END $$
DELIMITER ;


--7) UPDATE WINNER FOR FILM

DELIMITER $$
CREATE PROCEDURE UpdateWinnerForFIlm(IN p_title VARCHAR(255), in p_winner VARCHAR(200))
BEGIN
UPDATE Nomination
SET Nomination_Result = p_winner
WHERE Nomination_Title = p_title;
END $$
DELIMITER; 


