SET storage_engine=InnoDB;

CREATE DATABASE IF NOT EXISTS Cycling;
USE Cycling;

SET FOREIGN_KEY_CHECKS=1;

DROP TABLE IF EXISTS individual_classification ;
DROP TABLE IF EXISTS cyclist ;
DROP TABLE IF EXISTS stage ;
DROP TABLE IF EXISTS team ;


create table team(
 CodT char(5),
 NameT varchar(35) not null,
 FoundationYear int not null, 
 LegalAddress varchar(45) not null,
	primary key(CodT)
);


create table cyclist(
CodC char(5) primary key, 
Name varchar(35) not null, 
Surname varchar(35) not null, 
Nationality varchar(5) not null, 
CodT char(5), 
BirthYear int not null,
foreign key(CodT) references team(CodT)
		on delete cascade
		on update cascade
);


create table stage(
Edition int not null
check (Edition >0), 
CodS int not null
check (CodS >0), 
StartingCity varchar(35) not null, 
ArrivalCity varchar(35) not null, 
Length float not null, 
HeightDifference float not null, 
DifficultyLevel int not null 
check (  DifficultyLevel> 0
	and DifficultyLevel<=10  ),
primary key(Edition, CodS)
);

create table individual_classification(
CodC char(5) not null, 
CodS int not null
 check (CodS >0),
Edition int not null
check (Edition > 0), 
Ranking int not null 
check (Ranking >0),
primary key(CodC, CodS, Edition),
foreign key (CodC) references cyclist(CodC)
			on delete cascade
			on update cascade,
foreign key (Edition, CodS) references stage(Edition, CodS)
			on delete cascade
			on update cascade
);

INSERT INTO team values
 ('t001', 'Astana', 2000, 'via inventata 2, città 00223, ITA'),
 ('t002', 'Sky', 2005, 'via inventata 3, città 00223, ITA');
 
 INSERT INTO cyclist values
 ('c001', 'Mario', 'Rossi', 'ITA', 't001', 1997),
 ('c002', 'Pietro', 'Verdi', 'FR', 't002', 1998),
 ('c003', 'Paolo', 'Rossi', 'USA', 't001', 1999),
 ('c004', 'Pippo', 'Rossi', 'USA', 't001', 1995),
 ('c005', 'Pluto', 'Rossi', 'RUS', 't002', 1997);
 
 INSERT INTO stage VALUES
 (1, 1, 'Paris', 'Versaille', 35000, 300, 6),
 (2, 2, 'Torino', 'Firenze', 45000, 200, 5),
 (2, 3, 'Roma', 'Latina', 33000, 250, 6)
 (2, 1, 'Paris', 'Bordeaux', 35000, 300, 6);
 
 INSERT INTO individual_classification values
 ('c001', 2, 2, 1),
 ('c003', 2, 2, 2),
 ('c002', 2, 2, 3),
 ('c004', 1, 1, 1),
 ('c005', 1, 1, 2),
 ('c001', 1, 1, 3),
 ('c005', 3, 2, 1),
 ('c001', 1, 2, 4)
 ;


/* Given the code of a cyclist and the code of a 
stage (up to your choice),show the rankings obtained
by the cyclist in the various editions. 
For each cyclist, display name, surname, name of the team to 
which they belong and the identifying attributes of the 
chosen stage. 
Sort the results in ascending order of Edition.*/

SELECT Name, Surname, NameT, ic.Edition, StartingCity, ArrivalCity, Ranking 
FROM cyclist c, team t, individual_classification ic, stage s 
WHERE c.CodC=ic.CodC AND t.CodT=c.CodT AND s.CodS=ic.CodS 
		AND s.Edition=ic.Edition 
		AND c.CodC='c001' AND s.CodS=1 
GROUP BY Name, Surname, NameT, ic.Edition 
order by Edition asc;



/* Insert into the database the data related to 
a new cyclist and a ranking*/
INSERT INTO cyclist  values
('c006', 'Plu', 'Rossi', 'RUS', 't002', 1997);
INSERT INTO individual_classification values
 ('c006', 2, 2, 4);




