drop database if exists fresher_management;
create database fresher_management;
use fresher_management;
create table `Trainee` (
	TraineeID tinyint unsigned primary key auto_increment,
    Full_Name nvarchar(30) not null,
    Birth_Date date not null,
    Gender enum ('male' , 'female' , 'unknown') not null,
    ET_IQ tinyint unsigned check (ET_IQ between 0 and 20 ), -- max 20
    ET_Gmath tinyint check (ET_Gmath between 0 and 20 ), -- max 20
    ET_English tinyint check (ET_English between 0 and 50 ), -- max 50
    Training_Class nvarchar(30),
    Evaluation_Notes text
);

-- Add data to Trainne
insert into `Trainee` (Full_Name, Birth_Date, Gender , ET_IQ, ET_Gmath, ET_English, Training_Class, Evaluation_Notes) values
('Hamel Struis', '2021-10-02', 'male', 11, 18, 46, 'RU-123', 'Domainer'),
('Alanson Livesay', '2021-12-25', 'unknown', 16, 1, 38, 'AO-543', 'Kanlam'),
('Eadith McFarland', '2019-08-17', 'male', 9, 3, 39, 'US-432', 'Gembucket'),
('Adrien McComish', '2022-11-17', 'male', 5, 7, 38, 'US-564', 'Stringtough'),
('Arabele Glander', '2019-03-10', 'female', 8, 4, 44, 'CA-123', 'Quo Lux'),
('Lucinda Gasker', '2022-12-05', 'female', 12, 16, 36, 'US-765', 'Zontrax'),
('Egan Tolemache', '2023-04-02', 'male', 12, 5, 43, 'KR-654', 'Ventosanzap'),
('Adolph Scedall', '2020-10-04', 'unknown', 7, 10, 37, 'AF-876', 'Aerified'),
('Mychal Okie', '2020-09-05', 2, 0, 18, 0, 'AU-876', 'Bamity'),
('Valerye Barrell', '2021-04-06', 1, 10, 18, 43, 'BT-756', 'Redhold');

-- Pass exam
select `TraineeID`, `Full_Name`, `Birth_Date`, `Gender` from `Trainee` where `ET_IQ` >= 10 and `ET_Gmath` >= 10 and `ET_English` >= 25;

-- 

