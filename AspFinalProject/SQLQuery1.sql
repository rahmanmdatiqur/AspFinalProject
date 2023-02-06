create database HMSB
go
use HMSB
go
create table BloodGroup
(
	bg_id int identity primary key not null,
	bloodgroup nvarchar(50) not null
)
go
create table Disese
(
	id INT IDENTITY PRIMARY KEY,
	d_Name NVARCHAR(30) NOT NULL
)
go
create table Patient
(
	id INT IDENTITY PRIMARY KEY,
	pName NVARCHAR(50) NOT NULL,
	joinDate DATE NOT NULL,
	bg_id int references BloodGroup (bg_id)not null,
	d_Id INT REFERENCES Disese(id) NOT NULL,
	picture NVARCHAR(200) NULL,
	isActive BIT NULL
)
go

create table Doctor
(
	Dr_Name NVARCHAR(50) NOT NULL,
	bg_id int references BloodGroup (bg_id)not null,
	Dr_Contact NVARCHAR(20) NOT NULL,
	Dr_Email NVARCHAR(30) NOT NULL,

)
go
--create table Nurse
--(
--	N_Name NVARCHAR(50) NOT NULL,
--	N_Gender NVARCHAR(30) NOT NULL,
--	N_Contact NVARCHAR(20) NOT NULL,
--	N_Email NVARCHAR(30) NOT NULL,
--)
--go

create table Stuff
(
	s_Name NVARCHAR NOT NULL,
	s_JoinDate DATE NOT NULL,
	bg_id int references BloodGroup (bg_id)not null,
	s_Department NVARCHAR(30) NOT NULL,
	s_BasicSalary MONEY NOT NULL,
	s_Picture VARBINARY(MAX) NULL
)
go
INSERT INTO BloodGroup VALUES
('A+'),('A-')
go
select * from BloodGroup
go
select * from BloodGroup
go
select * from Disese
go
select * from Patient
go

select p.id, p.pName, p.joinDate, p.bg_id, b.bloodgroup, p.d_Id, d.d_Name, p.picture, p.isActive from Patient p Inner Join Disese d on d.id=p.d_Id Inner Join BloodGroup b on b.bg_id=p.bg_id
