﻿create database OnlineLearn

create table Role (
	roleID int identity(1, 1) primary key not null,
	roleName varchar(50) not null
)

create table Account (
	accountID int primary key not null,
	email varchar(255) not null,
	password varchar(255) not null,
	emailVerify bit default 0,
	role int references Role(roleID),
	status bit default 1
)

create table Student (
	studentID int primary key references Account(accountID),
	name nvarchar(255) not null,
	cashInWallet money default 0,
	imageURL NVARCHAR(MAX)
)

create table Expert (
	expertID int primary key references Account(accountID),
	name nvarchar(255) not null,
	imageURL NVARCHAR(MAX),
	phone varchar(20),
	description NVARCHAR(MAX),
)

create table Admin (
	adminID int primary key references Account(accountID),
	name nvarchar(255) not null,
	imageURL NVARCHAR(MAX),
	phone varchar(20)
)

create table Category (
	categoryID int identity(1, 1) primary key not null,
	categoryName nvarchar(100) not null,
)

create table Course (
	courseID int identity(1, 1) primary key not null,
	courseName nvarchar(255) not null,
	description NVARCHAR(MAX) not null,
	courseImage NVARCHAR(MAX) not null,
	expertID int references Expert(expertID) not null,
	price money not null,
	releasedDate datetime DEFAULT(getdate()),
	status bit default 1 
)

create table Enroll (
	courseID int references Course(courseID) not null,
	studentID int references Student(studentID) not null,
	registeredDate datetime DEFAULT(getdate()),
	primary key (courseID, studentID)
)

create table Rate (
	rateID int identity(1, 1) primary key not null,
	star int not null, 
	studentID int references Student(studentID) not null,
	content NVARCHAR(MAX),
	courseID int references Course(courseID) not null
)

create table Course_Category (
	courseID int references Course(courseID) not null,
	categoryID int references Category(categoryID) not null,
	primary key (courseID, categoryID)
)

create table Transaction_History (
	transactionID int identity(1, 1) primary key not null,
	studentID int references Account(accountID),
	time datetime DEFAULT(getdate()),
	amount money not null,
	courseID int references Course(courseID) not null
)

create table Chapter (
	chapterID int identity(1, 1) primary key not null,
	chapterName nvarchar(255) not null,
	courseID int references Course(courseID) not null,
	position int not null,
	status bit default 1
)

create table Lesson (
	lessonID int identity(1, 1) primary key not null,
	lessonName nvarchar(255),
	chapterID int references Chapter(chapterID) not null,
	videoUrl NVARCHAR(MAX) not null,
	content NVARCHAR(MAX) not null,
	status bit default 1,
	position int not null
)

create table Quiz (
	quizID int identity(1, 1) primary key not null,
	chapterID int references Chapter(chapterID) not null,
	quizName nvarchar(255),
	passRate float default 50,
	position int not null,
	status bit default 1
)

create table Question (
	questionID int identity(1, 1) primary key not null,
	content NVARCHAR(MAX) not null,
	explanation NVARCHAR(MAX) not null,
	quizID int references Quiz(quizID),
	status bit default 1
)

create table [Option] (
	optionID int identity(1, 1) primary key not null,
	questionID int references Question(questionID) not null,
	content NVARCHAR(MAX),
	isTrue bit default 0 
)

create table Quiz_Record (
	quizRecordID int identity(1, 1) primary key not null,
	time datetime DEFAULT(getdate()),
	studentID int references Student(studentID) not null,
	grade float not null,
	quizID int references Quiz(quizID) not null
)

create table Answer_Record (
	quizRecordID int references Quiz_Record(quizRecordID) not null,
	questionID int references Question(questionID) not null,
	answerID int references [Option](optionID),
)

create table Lesson_Learned (
	studentID int references Student(studentID) not null,
	lessonID int references Lesson(lessonID) not null,
)
