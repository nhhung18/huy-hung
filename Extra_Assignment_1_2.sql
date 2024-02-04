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
)


