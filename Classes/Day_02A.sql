create database company;

use company;

-- For Employee Table-----------------------------------------------------------------------------------------------------------------

create table employee(
employee_id int primary key,
name varchar(50) not null,
employee_age int,
email varchar(70)
);

select * from employee;

insert into employee
values
(101,'Yash Gharud',29,'yashgharud@gmail.com'),
(102,'Sanket Sable',30,'sanketsable123@gmail.com'),
(103,'Anjali Patil',31,'anjalipatil123@gmail.com'),
(104,'Raj Mali',33,'rajmali123@gmail.com');

-- For Department Table-------------------------------------------------------------------------------------------

create table department(
department_id int primary key,
department_name varchar(20),
Employee_id int,
employee_name varchar(50)
);

select * from department;

insert into department
values
(1012,'AIML Department',101,'Yash'),
(1013,'Computer Department',102,'Sanket'),
(1014,'Data Manager Depart',103,'Anjali'),
(1015,'Electrical Depart',104,'Raj');

-- For Salary Table--------------------------------------------------------------------------------------------------------

create table salary(
salary_id int primary key,
amount_of_salary int,
Employee_id int,
employee_name varchar(50),
salary_status varchar(30)
);

select * from salary;

insert into salary
values
(1001,25000,101,'Yash','Pending'),
(1002,25000,102,'Sanket','Paid'),
(1003,25000,103,'Anjali','Pending'),
(1004,25000,104,'Raj','Paid');

-- For Position Table-----------------------------------------------------------------------------------

create table position1(
employee_id int Primary key,
employee_name varchar(50),
position_in_company varchar(50)
);

select * from position1;

insert into position1
values
(101,'Yash','Executive Manager'),
(102,'Sanket','Managing Director'),
(103,'Anjali','Assistant Manager'),
(104,'Raj','Sales Manager');

-- For Experience Table--------------------------------------------------------------------------------------

create table experience(
employee_id int Primary key,
employee_name varchar(50),
Experience varchar(60),
past_experience varchar(60)
);

select * from experience;

insert into experience
values
(101,'Yash','6 Years of Work Experince','Work with Cipla Company'),
(102,'Sanket','10 Years of Work Experince','Work with Acer Company'),
(103,'Anjali','5 Years of Work Experince','Work with Cognizant Company'),
(104,'Raj','7 Years of Work Experince','Work with HP Company');






