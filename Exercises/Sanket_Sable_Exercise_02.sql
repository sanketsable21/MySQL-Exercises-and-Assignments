-- Create database 
create database hospital;

-- Delete any database
drop database hospital;

-- Use and work any database
use hospital;

-- ---------------------------------------------------------Table-01 Queries-----------------------------------------------------

-- Create a Doctor table

create table Doctor(
Doctor_id int primary key,
name varchar(50) not null,
Specialization varchar(50),
Experience varchar(20),
Availability varchar(50)
);

-- show table data 
select * from Doctor;

-- inserting values
insert into Doctor
values
(1001,'Dr.Suresh','Eye Specialist','10 Years','Yes'),
(1002,'Dr.Meghna','Heart Specialist','12 years','Yes'),
(1003,'Dr.Aashish','psychiatrics','7 Years','No'),
(1004,'Dr.Dipali','Ear Specialist','14 Years','No'),
(1005,'Dr.Sandip','Bone Specialist','5 Years','This week Not Possible');


-- -----------------------------------------------------Table-02 Queries-----------------------------------------------------

-- Create a patient table

create table Patient(
Patient_id int primary key,
name varchar(50) not null,
DOB varchar(50),
gender varchar(10),
address varchar(50)
);

-- show table data 
select * from Patient;

-- inserting values
insert into Patient
values
(101,'Jayesh','21 May 2005','Male','Mumbai'),
(102,'Rushikesh','03 April 2005','Male','Delhi'),
(103,'Soham','14 January 2005','Male','Pune'),
(104,'Yash','29 July 2005','Male','Goa'),
(105,'Karan','18 October 2005','Male','Madhya Pradesh');



-- -----------------------------------------------------Table-03 Queries-----------------------------------------------------

-- Create a Appointment table

create table Appointment(
Appointment_id int primary key,
Patient_id int,
Doctor_id int,
Appointment_Date varchar(50),
status varchar(50)
);

-- show table data 
select * from Appointment;

-- inserting values
insert into Appointment
values
(1011,101,1001,'10 March 2024','Pending'),
(1022,102,1002,'30 April 2024','Confirm'),
(1033,103,1003,'21 May 2024','Rejected'),
(1044,104,1004,'22 May 2024','Done'),
(1055,105,1005,'10 March 2024','Pending');


-- -----------------------------------------------------Table-04 Queries-----------------------------------------------------

-- Create a Mediacal_Record table

create table Medical_Record(
Record_id int primary key,
Patient_id int,
Medical_Type varchar(50),
Treatment varchar(50),
last_visit varchar(50)
);

-- show table data 
select * from Medical_Record;

-- inserting values
insert into Medical_Record
values
(43,101,'Internal Medicine','Medications','21 May 2024'),
(44,102,'Surgery','Surgical Treatments','30 July 2024'),
(45,103,'Pediatrics','Therapies','10 May 2024'),
(46,104,'Psychiatry','Preventive Care','31 March 2024'),
(47,105,'Emergency Medicine','Alternative Treatments','04 April 2024');



-- -----------------------------------------------------Table-05 Queries-----------------------------------------------------

-- Create a Billing table

create table Billing(
Billing_id int primary key,
Patient_id int,
Amount int,
Date varchar(50),
Status varchar(50)
);

-- show table data 
select * from Billing;

-- inserting values
insert into Billing
values
(1201,101,50000,'21 May 2024','Clear'),
(1202,102,100000,'30 July 2024','20000 Remaining'),
(1203,103,20000,'10 May 2024','Pending'),
(1204,104,120000,'31 March 2024','20000 Remaining'),
(1205,105,150000,'04 April 2024','Pending');
