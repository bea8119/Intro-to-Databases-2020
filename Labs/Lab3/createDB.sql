SET storage_engine=InnoDB;

CREATE DATABASE IF NOT EXISTS Gym;
USE Gym;

SET FOREIGN_KEY_CHECKS=1;

DROP TABLE schedule ;
DROP TABLE trainer ;
DROP TABLE course ;

create table trainer(
SSN char(16) not null primary key, 
Name varchar(20) not null, 
Surname varchar(20) not null, 
DateOfBirth date not null,
Email varchar(30) not null, 
PhoneNo int
);

create table course (
CId char(5) not null primary key, 
Name varchar(40) not null, 
Type varchar(20) not null, 
Level int
);

create table schedule (
SSN char(16) not null, 
Day varchar(20) not null, 
StartTime time not null, 
Duration int not null, 
CId char(5) not null, 
GymRoom char(2),
primary key(SSN, Day, StartTime),
foreign key (SSN) references trainer(SSN),
foreign key (CId) references course(CId)
);
