-- Single line Comment

# This is also a Single line Comment

/*
This is the 
Multiple line 
comment
*/

# Note : MySQL is not a Case-Sensitive language. as create & CREATE will be treated as same

-- Create database
create database school;

-- use and work any database
use school;

# Delete any database (ctrl+enter to execute query)
drop database school;

-- -----------------------------------------------------Table Queries--------------------------------------------------

-- Create a student table

create table student(
id int primary key, -- primary key = unique + not null
name varchar(50) not null,
age int not null,
standard varchar(10) not null,
gender varchar(10),
division varchar(5)
);

-- show table data 
select * from student;

-- method-1 to insert values
insert into student (id,name,age,standard,gender,division)
values
(1,'jitesh',5,'2nd','male','A');

-- method-2 to insert values
insert into student
values
(2,'mayuresh',5,'2nd','male','A');

-- remove all existing records from a table 
truncate student;

-- remove complete table structure including attributes
drop table student;

-- method-3 to insert multiple values
insert into student
values
(1,'mayuresh',5,'2nd','male','A'),
(2,'jitesh',5,'2nd','male','A'),
(3,'yash',5,'2nd','male','A'),
(4,'soham',5,'2nd','male','A'),
(5,'karan',5,'2nd','male','A');



/*
Usage of Comments

1.Documentation: Comments can be used to Document the purpose of the SQL query or the logic behind complex operation.
2.Debugging: You can temporarily disable parts of your SQL code by commenting them out, which is useful for debugging.
3.Collaboration: When working in teams, comments help communicate intent and functionality of the code to other developers.
*/