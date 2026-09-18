--1) Prevents deletion of a film tht still has a nomination

DROP TRIGGER IF EXISTS Before_Film_Delete_Block;
DELIMITER$$
CREATE TRIGGER Before_Film_Delete_Block
BEFORE DELETE ON Film
FOR EACH ROW
BEGIN
DECLARE nom_count INT DEFAULT 0;
SELECT COUNT(*) INTO nom_count
FROM Nomination
WHERE Nomination_Title= OLD.Film_Title;

IF nom_count >0 then
SIGNAL SQLSTATE '45000'
SET MESSAGE_TEXT= 'Cannot delete film: nomination still reference this title';
END IF;
END $$
DELIMITER ;


--2)Prevents the increasing filmyear after nominations exist

DROP TRIGGER IF EXISTS Before_Film_Year_Update;
DELIMITER $$
CREATE TRIGGER Before_Film_Year_Update
BEFORE UPDATE ON Film
FOR EACH ROW
BEGIN
DECLARE has_noms INT DEFAULT 0;

--only check if the yr is changing:
IF NEW.Film_Year <> OLD.Film_Year THEN
SELECT COUNT(*) INTO has_noms
FROM Nomination
WHERE Nomination_Title = OLD.Film_Title;

--if nomination exist and user tries to move the yr later than the old yr, block it
IF has_noms > 0 AND NEW.Film_Year > OLD.Film_Year THEN
SIGNAL SQLSTATE '45000'
SET MESSAGE_TEXT= 'Error: Cannot increase Film_Year after nominations exist';
END IF;
END IF;
END $$
DELIMITER ;
"""
