
create database whats

create table [User]
(
	ID int primary key not null identity ,
	[Name] nvarchar(250) not null ,
	Email nvarchar(250) not null unique ,
	[Password] nvarchar(250) not null ,
	Age int not null ,
	[Address] nvarchar(250) not null,
	Gender bit not null,
	Phone nvarchar(20) not null , 
	IsActive bit not null , 
	Education nvarchar(250) not null 
)

create table [Admin]
(
	ID int primary key not null identity ,
	[Name] nvarchar(250) not null ,
	Email nvarchar(250) not null unique ,
	[Password] nvarchar(250) not null ,
	Age int not null ,
	[Address] nvarchar(250) not null,
	Gender bit not null,
	Phone nvarchar(20) not null , 
	IsActive bit not null 
)

Create table MainCategory (
	ID int primary key not null identity , 
	[Name] nvarchar(250) not null ,
	Discription nvarchar(1000) not null 

)

Create table MainCategoryLink (
	ID int primary key not null identity , 
	Link nvarchar(250) not null ,
	Discription nvarchar(1000) not null ,
	MainCategoryID int FOREIGN KEY REFERENCES MainCategory(ID)
)

Create table MainCategoryDocument (
	ID int primary key not null identity , 
	[File] nvarchar(1000) not null ,
	Discription nvarchar(1000) not null ,
	MainCategoryID int FOREIGN KEY REFERENCES MainCategory(ID)
)

Create table MainCategoryVedio(
	ID int primary key not null identity , 
	Vedio nvarchar(1000) not null ,
	Discription nvarchar(1000) not null ,
	MainCategoryID int FOREIGN KEY REFERENCES MainCategory(ID)
)

---------------------------------------------------------------------------------

Create table SubCategory (
	ID int primary key not null identity , 
	[Name] nvarchar(250) not null ,
	Discription nvarchar(1000) not null ,
	MainCategoryID int FOREIGN KEY REFERENCES MainCategory(ID)
	   
)

Create table  SubCategoryLink (
	ID int primary key not null identity , 
	Link nvarchar(250) not null ,
	Discription nvarchar(1000) not null ,
	 SubCategoryID int FOREIGN KEY REFERENCES  SubCategory(ID)
)

Create table SubCategoryDocument (
	ID int primary key not null identity , 
	[File] nvarchar(1000) not null ,
	Discription nvarchar(1000) not null ,
	 SubCategoryID int FOREIGN KEY REFERENCES  SubCategory(ID)
)

Create table SubCategoryVedio(
	ID int primary key not null identity , 
	Vedio nvarchar(1000) not null ,
	Discription nvarchar(1000) not null ,
	 SubCategoryID int FOREIGN KEY REFERENCES  SubCategory(ID)
)

------------------------------------------------------------


Create table Track (
	ID int primary key not null identity , 
	[Name] nvarchar(250) not null ,
	Discription nvarchar(1000) not null ,
	SubCategoryID int FOREIGN KEY REFERENCES SubCategory(ID)
	   
)

Create table  TrackLink (
	ID int primary key not null identity , 
	Link nvarchar(250) not null ,
	Discription nvarchar(1000) not null ,
	 TrackID int FOREIGN KEY REFERENCES  Track(ID)
)

Create table TrackDocument (
	ID int primary key not null identity , 
	[File] nvarchar(1000) not null ,
	Discription nvarchar(1000) not null ,
	TrackID int FOREIGN KEY REFERENCES  Track(ID)
)

Create table TrackVedio(
	ID int primary key not null identity , 
	Vedio nvarchar(1000) not null ,
	Discription nvarchar(1000) not null ,
	 TrackID int FOREIGN KEY REFERENCES  Track(ID)
)
 --------------------------------------------------------------------
 

Create table Course (
	ID int primary key not null identity , 
	[Name] nvarchar(250) not null ,
	Discription nvarchar(1000) not null ,
	   
)

create table TaskCourse(
	ID int primary key not null identity , 
	TrackID int not null FOREIGN KEY REFERENCES  Track(ID),
	CourseID int not null FOREIGN KEY REFERENCES  Course(ID),
	unique (TrackID,CourseID)	
)

Create table  CourseLink (
	ID int primary key not null identity , 
	Link nvarchar(250) not null ,
	Discription nvarchar(1000) not null ,
	CourseID int FOREIGN KEY REFERENCES  Course(ID)
)

Create table CourseDocument (
	ID int primary key not null identity , 
	[File] nvarchar(1000) not null ,
	Discription nvarchar(1000) not null ,
	CourseID int FOREIGN KEY REFERENCES  Course(ID)
)

Create table CourseVedio(
	ID int primary key not null identity , 
	Vedio nvarchar(1000) not null ,
	Discription nvarchar(1000) not null ,
	CourseID int FOREIGN KEY REFERENCES  Course(ID)
)

-----------------------------------------------------------
create table UserTrack 
(
	ID int primary key identity ,
	UserID int not null FOREIGN KEY REFERENCES [User](ID), 
	TrackID int not null FOREIGN KEY REFERENCES Track(ID),
	[Date] datetime not null
)

create table FinishedCourse
(
	ID int primary key identity ,
	CourseID int FOREIGN KEY REFERENCES  Course(ID),
	UserTrackID int FOREIGN KEY REFERENCES  UserTrack(ID)
)

create table UserCertificate
(
	ID int primary key identity ,
	Title nvarchar(250) not null, 
	UserID int not null FOREIGN KEY REFERENCES  [User](ID)
)

create table UserSocialLink
(
	ID int primary key identity ,
	Link nvarchar(500) not null, 
	UserID int not null FOREIGN KEY REFERENCES  [User](ID)
)

create table Skill
(
	ID int primary key identity ,
	Skill nvarchar(250) not null ,
	
)

create table UserSkill
(
	ID int primary key identity ,
	SkillID int not null FOREIGN KEY REFERENCES  Skill(ID),
	UserID int not null FOREIGN KEY REFERENCES  [User](ID),
	[Level] int not null,
	unique (SkillID,UserID)
)

create table [Message] 
(
	ID int primary key identity ,
	Email nvarchar(50) not null  ,
	[Message] nvarchar(1000) not null ,
	[Date] Datetime not null ,
	IsRead bit not null default 0
)


ALTER TABLE FinishedCourseAdd CONSTRAINT UK_FinishedCourse 
UNIQUE (CourseID,UserTrackID); 

drop table UserSkill

alter table Course add IsDeleted bit not null default 0

alter table[dbo].[UserSocialLink] alter column UserID int not null

