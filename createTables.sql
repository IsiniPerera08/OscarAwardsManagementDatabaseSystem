CREATE DATABASE OscarAwards;

USE OscarAwards;

DROP TABLE IF EXISTS Ceremony;
CREATE TABLE Ceremony(
	Ceremony_Id INT(10) PRIMARY KEY,
    	Ceremony_Year INT(4) NOT NULL,
    	Ceremony_Date DATE,
    	Ceremony_Venue VARCHAR(85)
);

DROP TABLE IF EXISTS Category;
CREATE TABLE Category(
    	Category_Id INT(10) PRIMARY KEY,
    	Category_Name VARCHAR(85) NOT NULL,
    	Category_AwardType VARCHAR(85)
);

DROP TABLE IF EXISTS Nomination;
CREATE TABLE Nomination(
	Nomination_Id INT(10) PRIMARY KEY,
	Nomination_Role VARCHAR(100),
	Nomination_Nominees VARCHAR(200),
	Nomination_Title VARCHAR(100),
	Nomination_Result VARCHAR(100)
);

DROP TABLE IF EXISTS Film;
CREATE TABLE Film(
	Film_Id INT(10) PRIMARY KEY,
	Film_Title VARCHAR(150) NOT NULL,
	Film_Year INT(4)
);

DROP TABLE IF EXISTS Nominee;
CREATE TABLE Nominee(
	Nominee_Id INT(10) PRIMARY KEY,
	Nominee_FirstName VARCHAR(100) NOT NULL,
	Nominee_LastName VARCHAR(100),
	Nominee_Birthdate DATE
);

DROP TABLE IF EXISTS Country;
CREATE TABLE Country(
	Country_Name VARCHAR(100) PRIMARY KEY,
	Country_Nationality VARCHAR(100)
);
