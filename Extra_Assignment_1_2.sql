-- Ex 1
drop database if exists fresher_management;
create database fresher_management;
use fresher_management;
create table `Trainee` (
	TraineeID tinyint unsigned primary key auto_increment,
    Full_Name nvarchar(30) not null,
    Birth_Date date not null,
    Gender enum ('male' , 'female' , 'unknown') not null,
    ET_IQ tinyint unsigned check (ET_IQ between 0 and 20 ), -- max 20
    ET_Gmath tinyint unsigned check (ET_Gmath between 0 and 20 ), -- max 20
    ET_English tinyint unsigned check (ET_English between 0 and 20 ), -- max 50
    Training_Class nvarchar(30),
    Evaluation_Notes text
);
alter table `Trainee` 
add VTI_Account tinyint unique key not null;

-- Ex 2
create table `EX2` (
	ID int unsigned primary key auto_increment,
    `Name` nvarchar(30) not null,
    `Code` nvarchar(5),
    ModifiedDate datetime default(now())
);

-- Ex 3
create table `EX3` (
	ID int unsigned primary key auto_increment,
	`Name` nvarchar(30),
    BirthDate date,
    Gender Enum ('0' , '1' , '  '),
    IsDeletedFlag enum('0' , '1')
);
 

