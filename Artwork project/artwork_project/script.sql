SET storage_engine=InnoDB;
SET FOREIGN_KEY_CHECKS=1;
CREATE DATABASE IF NOT EXISTS Artwork;
USE Artwork;

DROP TABLE IF EXISTS Author;
DROP TABLE IF EXISTS Artwork;

SET AUTOCOMMIT=0;

START TRANSACTION;

CREATE TABLE Author (
  authorCode varchar(10) PRIMARY KEY,
  name varchar(30) NOT NULL,
  surname varchar(30) NOT NULL,
  birthYear integer NOT NULL,
  birthCity varchar(20) NOT NULL
);
CREATE TABLE Artwork (
  artworkCode varchar(10) PRIMARY KEY,
  name varchar(30) NOT NULL,
  category varchar(20) NOT NULL,
  city varchar(20) NOT NULL,
  country varchar(20) NOT NULL,
  author varchar(10) NOT NULL REFERENCES Author(authorCode) ON DELETE CASCADE
);

COMMIT;

START TRANSACTION;

INSERT INTO Author VALUES ('1', 'Gian Lorenzo', 'Bernini', 1598, 'Napoli');
INSERT INTO Author VALUES ('2', 'Francesco', 'Borromini', 1599, 'Bissone');

INSERT INTO Artwork VALUES ('1', 'Apollo e Dafne', 'sculpture', 'Roma', 'Italia', '1');
INSERT INTO Artwork VALUES ('2', 'Baldacchino S.Pietro', 'architecture', 'Roma', 'Italia', '1');
INSERT INTO Artwork VALUES ('3', 'Fontana dei fiumi', 'architecture', 'Roma', 'Italia', '1');
INSERT INTO Artwork VALUES ('4', 'S.Ivo la Sapienza', 'architecture', 'Roma', 'Italia', '2');

COMMIT;
