drop database if exists testing_system;
create database testing_system;
use testing_system; 
create table `Department`(
	DepartmentID tinyint unsigned primary key auto_increment /* Tu tang 1 don vi */, 
    DepartmentName nvarchar(50) 
);
create table `Position`(
	PositionID tinyint unsigned primary key auto_increment,
    PositionName nvarchar(30)
);
create table `Account`(
	AccountID tinyint unsigned primary key auto_increment,
    Email nvarchar(50) unique key not null ,
    Username nvarchar(30) unique key not null,
    Fullname nvarchar(30) not null,
    DepartmentID tinyint unsigned, -- data type tuong tu
    PositionID tinyint unsigned,
    CreateDate datetime default(now()),
    foreign key (DepartmentID) references Department(DepartmentID),
    foreign key (PositionID) references `Position`(PositionID)
);
create table `Group`(
	GroupID tinyint unsigned primary key auto_increment,
    GroupName varchar(50) unique not null,
    CreatorID tinyint unsigned,
    CreateDate datetime default (now()),
    FOREIGN KEY (CreatorId) REFERENCES `Account`(AccountId)
);
create table `GroupAccount`(
	GroupID tinyint unsigned not null,
    AccountID tinyint unsigned not null,
    JoinDate datetime default (now()),
    foreign key (GroupID) references `Group`(GroupID),
    foreign key (AccountID) references `Account`(AccountID)
);
create table `TypeQuestion`(
	TypeID tinyint unsigned primary key auto_increment,
    TypeName ENUM('Essay', 'Multiple-Choices')
);
create table `CategoryQuestion`(
	CategoryID tinyint unsigned primary key auto_increment,
    CategoryName nvarchar(20)
);
create table `Question`(
	QuestionID tinyint unsigned primary key auto_increment,
    Content nvarchar(100) ,
    CategoryID tinyint unsigned, -- 10
    TypeID tinyint unsigned, -- 2
    CreatorID tinyint unsigned, -- 100
    CreateDate datetime default (now()),
    foreign key (CategoryID) references `CategoryQuestion`(CategoryID),
    foreign key (TypeId) references `TypeQuestion`(TypeID),
    foreign key (CreatorID) references `Account`(AccountID)
);
create table `Answer`(
	AnswerID tinyint unsigned primary key auto_increment,
    Content nvarchar(100) not null,
    QuestionID tinyint unsigned not null,
    isCorrect bit,
    foreign key (QuestionID) references `Question`(QuestionID)
);
create table `Exam`(
	ExamID tinyint unsigned primary key auto_increment,
    `Code` char(10),
    Title nvarchar(30),
    CategoryID tinyint unsigned, 
    Duration tinyint unsigned check (Duration >= 0 and Duration <= 180),
    CreatorID tinyint unsigned, 
    CreateDate datetime default (now()),
    foreign key (CategoryID) references `CategoryQuestion`(CategoryID),
    foreign key (CreatorID) references `Account`(AccountID)
);
create table `ExamQuestion`(
	ExamID tinyint unsigned not null,
    QuestionID tinyint unsigned not null,
    foreign key (QuestionID) references `Question`(QuestionID),
    foreign key (ExamID) references `Exam`(ExamID)
);

-- 1.Add data to department
insert into Department (DepartmentName) values
	('Engineering'),
	('Legal'),
	('Engineering'),
	('Engineering'),
	('Marketing'),
	('Business Development'),
	('Services'),
	('Accounting'),
	('Legal'),
	('Product Management');
    
-- 2.Add data to position
insert into `Position` (PositionName) values 
	('Registered Nurse'),
	('Electrical Engineer'),
	('Nurse Practicioner'),
	('Accountant I'),
	('Occupational Therapist'),
	('Office Assistant IV'),
	('VP Marketing'),
	('Marketing Assistant'),
	('Administrative Assistant IV'),
	('Desktop Support Technician');
    
-- 3.Add data to account
insert into `Account` (Email, Username, Fullname, DepartmentID, PositionID) values 
	('aitzak0@de.vu', 'aitzak0', 'Annis Itzak', null, 1),
	('thoopper1@shop-pro.jp', 'thoopper1', 'Tabbie Hoopper', null, 9),
	('mtremoille2@auda.org.au', 'mtremoille2', 'Melitta Tremoille', 9, 3),
	('blamberto3@java.com', 'blamberto3', 'Boyd Lamberto', 1, 9),
	('hkryzhov4@scribd.com', 'hkryzhov4', 'Halie Kryzhov', 10, 9),
	('dmorhall5@tripod.com', 'dmorhall5', 'Danielle Morhall', 10, 5),
	('klorincz6@state.tx.us', 'klorincz6', 'Killy Lorincz', 8, 3),
	('mhayle7@bloomberg.com', 'mhayle7', 'Martyn Hayle', null, 8),
	('dgagie8@hubpages.com', 'dgagie8', 'Donn Gagie', 3, 9),
	('jbagguley9@wired.com', 'jbagguley9', 'Juana Bagguley', 1, 8),
	('jhedona@ca.gov', 'jhedona', 'Joelynn Hedon', 6, 9),
	('jleatherbarrowb@fema.gov', 'jleatherbarrowb', 'Jolene Leatherbarrow', null, 3),
	('cvasentsovc@imgur.com', 'cvasentsovc', 'Carleton Vasentsov', 4, 5),
	('vpresideyd@phoca.cz', 'vpresideyd', 'Vanny Presidey', 10, 1),
	('mjennaroye@ted.com', 'mjennaroye', 'Mose Jennaroy', 2, 2),
	('clawdhamf@miibeian.gov.cn', 'clawdhamf', 'Colly Lawdham', 8, 10),
	('lwilcottg@redcross.org', 'lwilcottg', 'Ly Wilcott', 6, 10),
	('dleeuwerinkh@cbsnews.com', 'dleeuwerinkh', 'Danit Leeuwerink', 2, 4),
	('mnasoni@chronoengine.com', 'mnasoni', 'Mela Nason', 9, 9),
	('rceaserj@shareasale.com', 'rceaserj', 'Raine Ceaser', 5, 2),
	('bskoggingsk@ebay.co.uk', 'bskoggingsk', 'Brittani Skoggings', 3, 5),
	('freedshawl@oakley.com', 'freedshawl', 'Farly Reedshaw', 4, 7),
	('rgreenhamm@shutterfly.com', 'rgreenhamm', 'Robenia Greenham', 3, 10),
	('aon@youku.com', 'aon', 'Ailyn O'' Hanvey', 6, 6),
	('olindleyo@spiegel.de', 'olindleyo', 'Ottilie Lindley', 4, 8),
	('dnovakp@samsung.com', 'dnovakp', 'Dulcea Novak', 10, null),
	('rfilipponiq@house.gov', 'rfilipponiq', 'Ree Filipponi', 9, 6),
	('rharbronr@booking.com', 'rharbronr', 'Rora Harbron', 4, 2),
	('fsebyers@canalblog.com', 'fsebyers', 'Fanchette Sebyer', 4, 4),
	('ashevellt@cafepress.com', 'ashevellt', 'Avrit Shevell', 9, 8),
	('gworssamu@psu.edu', 'gworssamu', 'Galvan Worssam', 10, 10),
	('bbutev@joomla.org', 'bbutev', 'Bernhard Bute', 9, null),
	('hcoopew@yahoo.com', 'hcoopew', 'Happy Coope', 1, 10),
	('idovinsonx@marriott.com', 'idovinsonx', 'Illa Dovinson', 3, 1),
	('dpratony@newyorker.com', 'dpratony', 'Deva Praton', 9, null),
	('wcoughz@google.nl', 'wcoughz', 'Walsh Cough', 3, 4),
	('jmccurlye10@symantec.com', 'jmccurlye10', 'Jennie McCurlye', 2, 7),
	('dmacgaughey11@e-recht24.de', 'dmacgaughey11', 'Dare MacGaughey', 7, 3),
	('dhulks12@cmu.edu', 'dhulks12', 'Diane Hulks', 9, null),
	('jmandell13@disqus.com', 'jmandell13', 'Justen Mandell', null, 10),
	('opeppett14@last.fm', 'opeppett14', 'Otto Peppett', 9, 3),
	('ysomersett15@delicious.com', 'ysomersett15', 'Ysabel Somersett', 4, 5),
	('soshirine16@who.int', 'soshirine16', 'Sutherland O''Shirine', 7, 6),
	('bdureden17@state.tx.us', 'bdureden17', 'Ber Dureden', 10, 2),
	('kcrummie18@cnn.com', 'kcrummie18', 'Kirstin Crummie', 8, 6),
	('sfirth19@a8.net', 'sfirth19', 'Shir Firth', 2, 7),
	('mkarlmann1a@discovery.com', 'mkarlmann1a', 'Meara Karlmann', 5, 6),
	('dbazelle1b@miitbeian.gov.cn', 'dbazelle1b', 'Dionis Bazelle', 5, null),
	('bvickress1c@dedecms.com', 'bvickress1c', 'Bernita Vickress', 4, 3),
	('hrailton1d@ucoz.com', 'hrailton1d', 'Hamilton Railton', 1, 6),
	('kblampey1e@a8.net', 'kblampey1e', 'Kailey Blampey', 2, 10),
	('jthurling1f@google.pl', 'jthurling1f', 'Jorge Thurling', 6, 10),
	('cblasik1g@odnoklassniki.ru', 'cblasik1g', 'Carrol Blasik', 10, 2),
	('vzuenelli1h@etsy.com', 'vzuenelli1h', 'Verge Zuenelli', 6, null),
	('jnoades1i@house.gov', 'jnoades1i', 'Jordana Noades', 6, 1),
	('gaitcheson1j@reverbnation.com', 'gaitcheson1j', 'Gusta Aitcheson', 5, null),
	('adomnin1k@hugedomains.com', 'adomnin1k', 'Abbie Domnin', 2, 10),
	('lcreenan1l@ovh.net', 'lcreenan1l', 'Leontyne Creenan', 6, 1),
	('mgarrett1m@studiopress.com', 'mgarrett1m', 'Marguerite Garrett', 2, null),
	('ahuxtable1n@soup.io', 'ahuxtable1n', 'Aloise Huxtable', 10, 9),
	('agentric1o@miibeian.gov.cn', 'agentric1o', 'Adele Gentric', 8, 4),
	('swhitehair1p@lulu.com', 'swhitehair1p', 'Sheeree Whitehair', 2, 1),
	('cstarton1q@cbsnews.com', 'cstarton1q', 'Consolata Starton', 1, 4),
	('lgrimmolby1r@acquirethisname.com', 'lgrimmolby1r', 'Lindsay Grimmolby', null, 6),
	('sbezant1s@usa.gov', 'sbezant1s', 'Shannen Bezant', 5, 5),
	('mriddiough1t@meetup.com', 'mriddiough1t', 'Marietta Riddiough', 2, 4),
	('aspears1u@wufoo.com', 'aspears1u', 'Aleda Spears', 5, 10),
	('trowbrey1v@patch.com', 'trowbrey1v', 'Tootsie Rowbrey', 7, 4),
	('gguillet1w@mapy.cz', 'gguillet1w', 'Giralda Guillet', 6, 8),
	('bemtage1x@about.me', 'bemtage1x', 'Bari Emtage', 10, 5),
	('ainderwick1y@time.com', 'ainderwick1y', 'Andrus Inderwick', 2, 2),
	('lgildersleaves1z@mac.com', 'lgildersleaves1z', 'Liv Gildersleaves', 7, 5),
	('glockey20@gravatar.com', 'glockey20', 'Gris Lockey', 8, 6),
	('cpedrozzi21@taobao.com', 'cpedrozzi21', 'Carlotta Pedrozzi', 2, 5),
	('tvankov22@nps.gov', 'tvankov22', 'Tessy Vankov', 2, 4),
	('cdering23@ucsd.edu', 'cdering23', 'Chantal Dering', 7, 9),
	('rbaguley24@hao123.com', 'rbaguley24', 'Ruthi Baguley', 10, 4),
	('jmcgrail25@flavors.me', 'jmcgrail25', 'Judi McGrail', 1, 6),
	('akebbell26@ucsd.edu', 'akebbell26', 'Ana Kebbell', 3, 2),
	('phutcheons27@springer.com', 'phutcheons27', 'Pearl Hutcheons', 1, 7),
	('jhagyard28@free.fr', 'jhagyard28', 'Jeannie Hagyard', 10, 9),
	('jsellors29@is.gd', 'jsellors29', 'Jeramie Sellors', null, 7),
	('rmugford2a@infoseek.co.jp', 'rmugford2a', 'Roderick Mugford', 3, 7),
	('pthonason2b@huffingtonpost.com', 'pthonason2b', 'Putnam Thonason', 2, 4),
	('cduffy2c@rakuten.co.jp', 'cduffy2c', 'Chane Duffy', 6, 9),
	('mdowers2d@xinhuanet.com', 'mdowers2d', 'Morley Dowers', 6, 6),
	('eduval2e@histats.com', 'eduval2e', 'Ettore Duval', 4, 10),
	('zbollands2f@last.fm', 'zbollands2f', 'Zulema Bollands', 1, null),
	('dbasson2g@networksolutions.com', 'dbasson2g', 'Domeniga Basson', null, 8),
	('jarmistead2h@unblog.fr', 'jarmistead2h', 'Johannes Armistead', 8, 4),
	('vogilvie2i@wunderground.com', 'vogilvie2i', 'Vic Ogilvie', 8, null),
	('kgarshore2j@liveinternet.ru', 'kgarshore2j', 'Kenneth Garshore', 1, 9),
	('fyaldren2k@wp.com', 'fyaldren2k', 'Freddie Yaldren', 3, null),
	('csawter2l@stumbleupon.com', 'csawter2l', 'Charmion Sawter', 9, null),
	('hjellings2m@nytimes.com', 'hjellings2m', 'Hermione Jellings', 2, 10),
	('wwickerson2n@netscape.com', 'wwickerson2n', 'Wilow Wickerson', 10, 9),
	('vbucknall2o@loc.gov', 'vbucknall2o', 'Violette Bucknall', 8, null),
	('apotteril2p@blogs.com', 'apotteril2p', 'Abbe Potteril', null, 2),
	('lryles2q@umn.edu', 'lryles2q', 'Lorens Ryles', 9, 3),
	('gtoulch2r@skyrock.com', 'gtoulch2r', 'Giovanni Toulch', 9, 1);

-- 4. Add data to group
insert into `Group`(Groupname, CreatorID) values
 ('Group 1', 58),
 ('Group 2', 11),
 ('Group 3', 7),
 ('Group 4', 44),
 ('Group 5', 42),
 ('Group 6', 50),
 ('Group 7', 16),
 ('Group 8', 46),
 ('Group 9', 48),
 ('Group 10', 42),
 ('Group 11', 1),
 ('Group 12', 93),
 ('Group 13', 51),
 ('Group 14', 100),
 ('Group 15', 31),
 ('Group 16', 91),
 ('Group 17', 70),
 ('Group 18', 87),
 ('Group 19', 17),
 ('Group 20', 36),
 ('Group 21', 49),
 ('Group 22', 96),
 ('Group 23', 37),
 ('Group 24', 44),
 ('Group 25', 74),
 ('Group 26', 14),
 ('Group 27', 51),
 ('Group 28', 4),
 ('Group 29', 28),
 ('Group 30', 48),
 ('Group 31', 70),
 ('Group 32', 26),
 ('Group 33', 21),
 ('Group 34', 80),
 ('Group 35', 92),
 ('Group 36', 90),
 ('Group 37', 29),
 ('Group 38', 20),
 ('Group 39', 95),
 ('Group 40', 70),
 ('Group 41', 39),
 ('Group 42', 50),
 ('Group 43', 89),
 ('Group 44', 88),
 ('Group 45', 86),
 ('Group 46', 35),
 ('Group 47', 95),
 ('Group 48', 47),
 ('Group 49', 57),
 ('Group 50', 64),
 ('Group 51', 72),
 ('Group 52', 10),
 ('Group 53', 96),
 ('Group 54', 70),
 ('Group 55', 45),
 ('Group 56', 44),
 ('Group 57', 44),
 ('Group 58', 93),
 ('Group 59', 58),
 ('Group 60', 15),
 ('Group 61', 100),
 ('Group 62', 86),
 ('Group 63', 67),
 ('Group 64', 65),
 ('Group 65', 6),
 ('Group 66', 46),
 ('Group 67', 43),
 ('Group 68', 54),
 ('Group 69', 63),
 ('Group 70', 81),
 ('Group 71', 56),
 ('Group 72', 53),
 ('Group 73', 92),
 ('Group 74', 32),
 ('Group 75', 79),
 ('Group 76', 100),
 ('Group 77', 40),
 ('Group 78', 75),
 ('Group 79', 24),
 ('Group 80', 70),
 ('Group 81', 50),
 ('Group 82', 36),
 ('Group 83', 93),
 ('Group 84', 25),
 ('Group 85', 35),
 ('Group 86', 74),
 ('Group 87', 29),
 ('Group 88', 89),
 ('Group 89', 82),
 ('Group 90', 27),
 ('Group 91', 30),
 ('Group 92', 34),
 ('Group 93', 64),
 ('Group 94', 36),
 ('Group 95', 77),
 ('Group 96', 59),
 ('Group 97', 99),
 ('Group 98', 54),
 ('Group 99', 60),
 ( 'Group 100', 40);

--  5.Add data to group account
insert into GroupAccount (GroupID, AccountID) values 
	(1, 1),
	(2, 2),
	(3, 3),
	(4, 4),
	(5, 5),
	(6, 6),
	(7, 7),
	(8, 8),
	(9, 9),
	(10, 10),
	(11, 11),
	(12, 12),
	(13, 13),
	(14, 14),
	(15, 15),
	(16, 16),
	(17, 17),
	(18, 18),
	(19, 19),
	(20, 20),
	(21, 21),
	(22, 22),
	(23, 23),
	(24, 24),
	(25, 25),
	(26, 26),
	(27, 27),
	(28, 28),
	(29, 29),
	(30, 30),
	(31, 31),
	(32, 32),
	(33, 33),
	(34, 34),
	(35, 35),
	(36, 36),
	(37, 37),
	(38, 38),
	(39, 39),
	(40, 40),
	(41, 41),
	(42, 42),
	(43, 43),
	(44, 44),
	(45, 45),
	(46, 46),
	(47, 47),
	(48, 48),
	(49, 49),
	(50, 50),
	(51, 51),
	(52, 52),
	(53, 53),
	(54, 54),
	(55, 55),
	(56, 56),
	(57, 57),
	(58, 58),
	(59, 59),
	(60, 60),
	(61, 61),
	(62, 62),
	(63, 63),
	(64, 64),
	(65, 65),
	(66, 66),
	(67, 67),
	(68, 68),
	(69, 69),
	(70, 70),
	(71, 71),
	(72, 72),
	(73, 73),
	(74, 74),
	(75, 75),
	(76, 76),
	(77, 77),
	(78, 78),
	(79, 79),
	(80, 80),
	(81, 81),
	(82, 82),
	(83, 83),
	(84, 84),
	(85, 85),
	(86, 86),
	(87, 87),
	(88, 88),
	(89, 89),
	(90, 90),
	(91, 91),
	(92, 92),
	(93, 93),
	(94, 94),
	(95, 95),
	(96, 96),
	(97, 97),
	(98, 98),
	(99, 99),
	(100,100);
    
-- 6. Add data to typequestion
insert into TypeQuestion(TypeID, TypeName) values
	(1, 'Essay'),
    (2, 'Multiple-Choices');
    
-- 7.Add data to CategoryQuestion
insert into CategoryQuestion(CategoryName) value
	('Java'),
    ('C#'),
    ('SQL'),
    ('Python'),
    ('C++'),
    ('.NET'),
    ('Golang'),
    ('Ruby'),
    ('PHP'),
    ('JS');
    
-- 8.Add data to Question
insert into Question (Content, CategoryID, TypeID, CreatorID) values
	('Content1', 4, 1, 37),
	('Content2', 5, 1, 20),
	('Content3', 6, 1, 38),
	('Content4', 2, 1, 13),
	('Content5', 3, 2, 51),
	('Content6', 6, 1, 7),
	('Content7', 10, 2, 81),
	('Content8', 2, 2, 25),
	('Content9', 5, 2, 100),
	('Content10', 5, 1, 84),
	('Content11', 9, 2, 96),
	('Content12', 8, 1, 74),
	('Content13', 4, 2, 18),
	('Content14', 7, 1, 95),
	('Content15', 2, 2, 22),
	('Content16', 5, 1, 82),
	('Content17', 10, 2, 17),
	('Content18', 3, 2, 4),
	('Content19', 7, 2, 6),
	('Content20', 10, 2, 2),
	('Content21', 8, 2, 46),
	('Content22', 1, 2, 98),
	('Content23', 1, 1, 69),
	('Content24', 1, 2, 15),
	('Content25', 4, 2, 22),
	('Content26', 9, 2, 8),
	('Content27', 2, 1, 94),
	('Content28', 8, 2, 20),
	('Content29', 8, 2, 83),
	('Content30', 4, 1, 38),
	('Content31', 8, 1, 31),
	('Content32', 7, 1, 62),
	('Content33', 8, 2, 42),
	('Content34', 1, 2, 66),
	('Content35', 8, 1, 38),
	('Content36', 6, 1, 49),
	('Content37', 1, 1, 42),
	('Content38', 8, 1, 70),
	('Content39', 7, 1, 58),
	('Content40', 10, 2, 8),
	('Content41', 7, 2, 32),
	('Content42', 9, 1, 7),
	('Content43', 8, 2, 71),
	('Content44', 7, 1, 7),
	('Content45', 9, 2, 93),
	('Content46', 10, 2, 31),
	('Content47', 10, 1, 61),
	('Content48', 10, 2, 65),
	('Content49', 10, 2, 37),
	('Content50', 4, 1, 80),
	('Content51', 4, 2, 20),
	('Content52', 6, 2, 15),
	('Content53', 10, 2, 72),
	('Content54', 6, 2, 93),
	('Content55', 2, 2, 61),
	('Content56', 3, 1, 68),
	('Content57', 4, 1, 73),
	('Content58', 7, 2, 64),
	('Content59', 4, 1, 80),
	('Content60', 1, 2, 46),
	('Content61', 6, 2, 72),
	('Content62', 3, 2, 28),
	('Content63', 6, 1, 21),
	('Content64', 5, 1, 56),
	('Content65', 1, 1, 70),
	('Content66', 10, 2, 80),
	('Content67', 10, 1, 35),
	('Content68', 10, 1, 49),
	('Content69', 5, 2, 8),
	('Content70', 8, 2, 10),
	('Content71', 2, 1, 23),
	('Content72', 9, 2, 22),
	('Content73', 6, 1, 75),
	('Content74', 8, 1, 34),
	('Content75', 5, 1, 37),
	('Content76', 5, 1, 71),
	('Content77', 4, 1, 47),
	('Content78', 9, 1, 24),
	('Content79', 1, 2, 92),
	('Content80', 4, 1, 46),
	('Content81', 4, 2, 12),
	('Content82', 8, 1, 47),
	('Content83', 10, 1, 57),
	('Content84', 7, 2, 58),
	('Content85', 7, 2, 61),
	('Content86', 9, 2, 89),
	('Content87', 7, 2, 66),
	('Content88', 5, 1, 45),
	('Content89', 5, 2, 55),
	('Content90', 2, 2, 89),
	('Content91', 1, 2, 82),
	('Content92', 6, 2, 47),
	('Content93', 3, 2, 55),
	('Content94', 10, 2, 45),
	('Content95', 8, 1, 43),
	('Content96', 6, 2, 64),
	('Content97', 7, 2, 62),
	('Content98', 5, 1, 26),
	('Content99', 4, 2, 37),
	( 'Content100', 2, 1, 1);
   
-- 9. Add data to answer
insert into Answer (Content, QuestionID, isCorrect) values
 ('Content1', 1, 0),
 ('Content2', 2, 1),
 ('Content3', 3, 1),
 ('Content4', 4, 0),
 ('Content5', 5, 1),
 ('Content6', 6, 1),
 ('Content7', 7, 1),
 ('Content8', 8, 1),
 ('Content9', 9, 1),
 ('Content10', 10, 1),
 ('Content11', 11, 0),
 ('Content12', 12, 1),
 ('Content13', 13, 1),
 ('Content14', 14, 1),
 ('Content15', 15, 0),
 ('Content16', 16, 0),
 ('Content17', 17, 0),
 ('Content18', 18, 0),
 ('Content19', 19, 1),
 ('Content20', 20, 0),
 ('Content21', 21, 0),
 ('Content22', 22, 1),
 ('Content23', 23, 0),
 ('Content24', 24, 1),
 ('Content25', 25, 0),
 ('Content26', 26, 0),
 ('Content27', 27, 1),
 ('Content28', 28, 0),
 ('Content29', 29, 1),
 ('Content30', 30, 0),
 ('Content31', 31, 0),
 ('Content32', 32, 1),
 ('Content33', 33, 1),
 ('Content34', 34, 1),
 ('Content35', 35, 0),
 ('Content36', 36, 0),
 ('Content37', 37, 1),
 ('Content38', 38, 1),
 ('Content39', 39, 1),
 ('Content40', 40, 0),
 ('Content41', 41, 1),
 ('Content42', 42, 0),
 ('Content43', 43, 1),
 ('Content44', 44, 1),
 ('Content45', 45, 1),
 ('Content46', 46, 1),
 ('Content47', 47, 0),
 ('Content48', 48, 0),
 ('Content49', 49, 0),
 ('Content50', 50, 1),
 ('Content51', 51, 0),
 ('Content52', 52, 1),
 ('Content53', 53, 1),
 ('Content54', 54, 0),
 ('Content55', 55, 1),
 ('Content56', 56, 0),
 ('Content57', 57, 0),
 ('Content58', 58, 1),
 ('Content59', 59, 0),
 ('Content60', 60, 0),
 ('Content61', 61, 0),
 ('Content62', 62, 1),
 ('Content63', 63, 1),
 ('Content64', 64, 0),
 ('Content65', 65, 1),
 ('Content66', 66, 0),
 ('Content67', 67, 1),
 ('Content68', 68, 0),
 ('Content69', 69, 0),
 ('Content70', 70, 1),
 ('Content71', 71, 1),
 ('Content72', 72, 0),
 ('Content73', 73, 1),
 ('Content74', 74, 0),
 ('Content75', 75, 0),
 ('Content76', 76, 1),
 ('Content77', 77, 1),
 ('Content78', 78, 0),
 ('Content79', 79, 0),
 ('Content80', 80, 0),
 ('Content81', 81, 0),
 ('Content82', 82, 0),
 ('Content83', 83, 0),
 ('Content84', 84, 0),
 ('Content85', 85, 0),
 ('Content86', 86, 1),
 ('Content87', 87, 0),
 ('Content88', 88, 1),
 ('Content89', 89, 1),
 ('Content90', 90, 1),
 ('Content91', 91, 0),
 ('Content92', 92, 1),
 ('Content93', 93, 0),
 ('Content94', 94, 0),
 ('Content95', 95, 0),
 ('Content96', 96, 0),
 ('Content97', 97, 0),
 ('Content98', 98, 0),
 ('Content99', 99, 1),
 ( 'Content100', 100, 0);
   
   
-- 10.Add data to exam
insert into Exam (Code, Title, Duration, CategoryID, CreatorID) values
	(112, 'Exam 1', 53, 2, 30),
	(192, 'Exam 2', 26, 3, 2),
	(122, 'Exam 3', 172, 4, 41),
	(167, 'Exam 4', 48, 8, 38),
	(127, 'Exam 5', 169, 7, 30),
	(128, 'Exam 6', 16, 10, 49),
	(196, 'Exam 7', 96, 1, 33),
	(100, 'Exam 8', 52, 2, 57),
	(152, 'Exam 9', 61, 3, 27),
	(153, 'Exam 10', 107, 9, 71),
	(113, 'Exam 11', 166, 4, 2),
	(173, 'Exam 12', 51, 3, 70),
	(185, 'Exam 13', 14, 9, 46),
	(121, 'Exam 14', 45, 2, 92),
	(122, 'Exam 15', 92, 6, 35),
	(122, 'Exam 16', 87, 2, 30),
	(155, 'Exam 17', 167, 6, 39),
	(184, 'Exam 18', 126, 6, 8),
	(121, 'Exam 19', 180, 10, 63),
	(180, 'Exam 20', 132, 9, 38),
	(140, 'Exam 21', 161, 10, 54),
	(175, 'Exam 22', 102, 5, 1),
	(162, 'Exam 23', 157, 7, 26),
	(166, 'Exam 24', 92, 4, 100),
	(175, 'Exam 25', 82, 1, 99),
	(153, 'Exam 26', 161, 2, 95),
	(112, 'Exam 27', 81, 1, 90),
	(163, 'Exam 28', 160, 6, 54),
	(127, 'Exam 29', 69, 5, 31),
	(121, 'Exam 30', 99, 3, 38),
	(116, 'Exam 31', 134, 3, 93),
	(195, 'Exam 32', 25, 3, 38),
	(187, 'Exam 33', 9, 7, 2),
	(136, 'Exam 34', 57, 5, 66),
	(114, 'Exam 35', 156, 9, 62),
	(176, 'Exam 36', 32, 2, 89),
	(140, 'Exam 37', 57, 8, 92),
	(173, 'Exam 38', 55, 7, 4),
	(145, 'Exam 39', 27, 6, 91),
	(186, 'Exam 40', 93, 2, 88),
	(177, 'Exam 41', 177, 4, 85),
	(197, 'Exam 42', 78, 4, 55),
	(162, 'Exam 43', 47, 4, 43),
	(155, 'Exam 44', 14, 9, 62),
	(190, 'Exam 45', 129, 7, 49),
	(190, 'Exam 46', 80, 2, 61),
	(192, 'Exam 47', 27, 7, 23),
	(105, 'Exam 48', 65, 10, 84),
	(130, 'Exam 49', 58, 5, 91),
	(149, 'Exam 50', 139, 2, 22),
	(187, 'Exam 51', 109, 9, 58),
	(139, 'Exam 52', 125, 6, 89),
	(191, 'Exam 53', 171, 4, 68),
	(169, 'Exam 54', 32, 5, 41),
	(143, 'Exam 55', 124, 3, 24),
	(104, 'Exam 56', 155, 1, 97),
	(123, 'Exam 57', 147, 4, 23),
	(177, 'Exam 58', 63, 4, 5),
	(163, 'Exam 59', 100, 1, 84),
	(184, 'Exam 60', 82, 1, 50),
	(156, 'Exam 61', 144, 5, 97),
	(104, 'Exam 62', 30, 9, 34),
	(116, 'Exam 63', 12, 4, 35),
	(157, 'Exam 64', 45, 9, 46),
	(169, 'Exam 65', 112, 4, 16),
	(172, 'Exam 66', 79, 4, 73),
	(189, 'Exam 67', 141, 5, 54),
	(173, 'Exam 68', 5, 4, 76),
	(129, 'Exam 69', 29, 6, 13),
	(132, 'Exam 70', 13, 4, 70),
	(193, 'Exam 71', 88, 5, 14),
	(109, 'Exam 72', 135, 1, 1),
	(135, 'Exam 73', 149, 3, 54),
	(147, 'Exam 74', 65, 7, 90),
	(179, 'Exam 75', 177, 10, 18),
	(116, 'Exam 76', 45, 7, 11),
	(179, 'Exam 77', 31, 9, 10),
	(119, 'Exam 78', 116, 4, 19),
	(170, 'Exam 79', 117, 7, 34),
	(108, 'Exam 80', 95, 1, 53),
	(118, 'Exam 81', 163, 2, 9),
	(167, 'Exam 82', 51, 8, 59),
	(132, 'Exam 83', 71, 1, 58),
	(150, 'Exam 84', 9, 3, 3),
	(179, 'Exam 85', 180, 7, 5),
	(184, 'Exam 86', 6, 10, 98),
	(129, 'Exam 87', 86, 7, 29),
	(126, 'Exam 88', 168, 7, 3),
	(181, 'Exam 89', 0, 6, 41),
	(178, 'Exam 90', 96, 6, 14),
	(151, 'Exam 91', 140, 1, 14),
	(188, 'Exam 92', 109, 2, 71),
	(192, 'Exam 93', 16, 10, 75),
	(153, 'Exam 94', 177, 8, 65),
	(120, 'Exam 95', 7, 8, 45),
	(111, 'Exam 96', 77, 1, 48),
	(190, 'Exam 97', 15, 4, 38),
	(170, 'Exam 98', 126, 2, 48),
	(145, 'Exam 99', 89, 2, 65),
	( 130, 'Exam 100', 64, 3, 42);

-- 11. Add data to exam ExamQuestion
insert into ExamQuestion(ExamID, QuestionID) values 
	(1, 1),
	(2, 2),
	(3, 3),
	(4, 4),
	(5, 5),
	(6, 6),
	(7, 7),
	(8, 8),
	(9, 9),
	(10, 10),
	(11, 11),
	(12, 12),
	(13, 13),
	(14, 14),
	(15, 15),
	(16, 16),
	(17, 17),
	(18, 18),
	(19, 19),
	(20, 20),
	(21, 21),
	(22, 22),
	(23, 23),
	(24, 24),
	(25, 25),
	(26, 26),
	(27, 27),
	(28, 28),
	(29, 29),
	(30, 30),
	(31, 31),
	(32, 32),
	(33, 33),
	(34, 34),
	(35, 35),
	(36, 36),
	(37, 37),
	(38, 38),
	(39, 39),
	(40, 40),
	(41, 41),
	(42, 42),
	(43, 43),
	(44, 44),
	(45, 45),
	(46, 46),
	(47, 47),
	(48, 48),
	(49, 49),
	(50, 50),
	(51, 51),
	(52, 52),
	(53, 53),
	(54, 54),
	(55, 55),
	(56, 56),
	(57, 57),
	(58, 58),
	(59, 59),
	(60, 60),
	(61, 61),
	(62, 62),
	(63, 63),
	(64, 64),
	(65, 65),
	(66, 66),
	(67, 67),
	(68, 68),
	(69, 69),
	(70, 70),
	(71, 71),
	(72, 72),
	(73, 73),
	(74, 74),
	(75, 75),
	(76, 76),
	(77, 77),
	(78, 78),
	(79, 79),
	(80, 80),
	(81, 81),
	(82, 82),
	(83, 83),
	(84, 84),
	(85, 85),
	(86, 86),
	(87, 87),
	(88, 88),
	(89, 89),
	(90, 90),
	(91, 91),
	(92, 92),
	(93, 93),
	(94, 94),
	(95, 95),
	(96, 96),
	(97, 97),
	(98, 98),
	(99, 99),
	(100,100);

	


