LOAD DATA LOCAL INFILE '/home/Isini/database/Ceremony.csv'
INTO TABLE Ceremony
FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n'
IGNORE 1 LINES
(Ceremony_Id, Ceremony_Year, Ceremony_Date, Ceremony_Venue);


LOAD DATA LOCAL INFILE '/home/Isini/database/Category.csv'
INTO TABLE Category
FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n'
IGNORE 1 LINES
(Category_Id, Category_Name, Category_AwardType);


LOAD DATA LOCAL INFILE '/home/Isini/database/Film.csv'
INTO TABLE Film
FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n'
IGNORE 1 LINES
(Film_Id, Film_Title, Film_Year);


LOAD DATA LOCAL INFILE '/home/Isini/database/Nominee.csv'
INTO TABLE Nominee
FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n'
IGNORE 1 LINES
(Nominee_Id, Nominee_FirstName, Nominee_LastName, Nominee_Birthdate);


LOAD DATA LOCAL INFILE '/home/Isini/database/Country.csv'
INTO TABLE Country
FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n'
IGNORE 1 LINES
(Country_Name, Country_Nationality);


LOAD DATA LOCAL INFILE '/home/Isini/database/Nomination.csv'
INTO TABLE Nomination
FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n'
IGNORE 1 LINES
(NOmination_Id, Nomination_Role, Nomination_Nominees, Nomination_Title, Nomination_Result);
