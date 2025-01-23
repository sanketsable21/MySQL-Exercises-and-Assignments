CREATE DATABASE GYM_MANAGEMENT;

USE GYM_MANAGEMENT;

drop table user;

-- table 1
create table user(
user_id int primary key auto_increment,
first_name varchar(50) not null,
last_name varchar(50),
email varchar (50) unique,
phoneNo varchar(15),
gender enum('Male', 'Female', 'Other'),
join_date date
);

-- insert values
insert into user (first_name,last_name,email,phoneNo,gender,join_date)
values
('John', 'Doe', 'johndoe@example.com', '555-1234', 'Male', '2025-01-01'),
('Jane', 'Smith', 'janesmith@example.com', '555-5678', 'Female', '2025-01-10'),
('Michael', 'Johnson', 'michaelj@example.com', '555-8765','Male', '2025-01-12'),
('Emily', 'Davis', 'emilydavis@example.com', '555-3456', 'Female', '2025-01-03'),
('Chris', 'Martinez', 'chrismartinez@example.com', '555-7654', 'Male', '2025-01-09');

select * from user;

-- truncate query
truncate user;



-- SELECT QUERY

-- 1. select specific column from table
select first_name, phoneNo from user;

-- 2. select a data from date 
select * from user where join_date > '2025-01-10';



-- ALTER QUERY

-- 1. add a new column in table
alter table user 
add column end_date date default '2025-01-23';

-- 2. drop column from table
alter table user 
drop column end_date;



-- UPDATE QUERY

-- 1. update phonenumber where user = 1
update user set phoneNo = '8291621013'
where user_id = 1;

-- 2. update user last name
update user set last_name = 'sable'
where user_id = 2;

set sql_safe_updates = 0;



-- DELETE QUERY

-- 1. delete a perticular row from table
delete from user where user_id = 3;

/*You can temporarily disable foreign key checks to drop the table. However,
 this is risky because it leaves dangling references in child tables.*/

SET FOREIGN_KEY_CHECKS = 0;
SET FOREIGN_KEY_CHECKS = 1;

-- 2. delete a row using condition
delete from user 
where join_date > '2025-01-01';



-- RENAME QUERY

-- 1. rename any column
alter table user
rename column phoneNo to mobile;

-- 2. rename any column
alter table user 
rename column email to email_address;


drop table memberships;

-- table 2
CREATE TABLE Memberships (
membership_id INT AUTO_INCREMENT PRIMARY KEY,
membership_name VARCHAR(100),
duration_months INT,
price DECIMAL(10, 2),
benefits TEXT
);

-- insert values
insert into memberships(membership_name,duration_months,price,benefits)
values
('Basic Membership', 1, 50.00, 'Access to gym equipment and locker rooms'),
('Premium Membership', 12, 500.00, 'Access to gym equipment, locker rooms, classes, and personal trainer'),
('Family Membership', 6, 300.00, 'Access for 2 adults and 2 children to all facilities'),
('Student Membership', 3, 120.00, 'Discounted rate for students, includes full access to gym'),
('VIP Membership', 24, 1000.00, 'Includes all services, priority booking, and free guest passes');

select * from memberships;


-- SELECT QUERY

-- 1. select specific column from table
select membership_name, price from memberships;

-- 2. select a data from price 
select * from memberships where price >= 120;



-- ALTER QUERY

-- 1. add a new column in table
alter table memberships 
add column start_date date default '2025-01-23';

-- 2. drop column from table
alter table memberships 
drop column start_date;



-- UPDATE QUERY

-- 1. update price where month = 1
update memberships set price = '190'
where duration_months = 1;

-- 2. update membership name
update memberships set membership_name = 'Senior_Citizen_Membership'
where duration_months = 1;



-- DELETE QUERY

-- 1. delete row from table using like 
delete from memberships where benefits like 'Acc%';

/*You can temporarily disable foreign key checks to drop the table. However,
 this is risky because it leaves dangling references in child tables.*/

SET FOREIGN_KEY_CHECKS = 0;
SET FOREIGN_KEY_CHECKS = 1;

-- 2. delete a row using condition
delete from memberships 
where duration_months > 12;



-- RENAME QUERY

-- 1. rename any column
alter table memberships
rename column price to cost;

-- 2. rename any column
alter table memberships 
rename column benefits to advantages;



-- table 3
create table user_membership(
user_id int,
membership_id int,
start_date date,
end_date date,
foreign key (user_id) references user (user_id),
foreign key (membership_id) references memberships(membership_id)
);

-- insert values
insert into user_membership(user_id,membership_id,start_date,end_date)
values
(1, 1, '2025-01-01', '2025-02-01'),
(2, 2, '2025-01-10', '2026-01-10'),
(3, 2, '2025-01-12', '2025-07-12'),
(4, 4, '2025-01-03', '2025-04-03'),
(5, 3, '2025-01-09', '2027-01-09');

select * from user_membership;



-- SELECT QUERY

-- 1. select specific column from table
select membership_id, start_date from user_membership;

-- 2. select a data from date 
select * from user_membership where end_date > '2025-02-01';



-- ALTER QUERY

-- 1. add a new column in table
alter table user_membership 
add column balance int default 130;

-- 2. drop column from table
alter table user_membership 
drop column balance;



-- UPDATE QUERY

-- 1. update balance of user_id = 1
update user_membership set balance = '0'
where user_id = 1;

-- 2. update membership name
update user_membership set end_date = '2025-12-31'
where user_id = 3;



-- DELETE QUERY

-- 1. delete row from table using like 
delete from user_membership where start_date like '%-1%';

/*You can temporarily disable foreign key checks to drop the table. However,
 this is risky because it leaves dangling references in child tables.*/

SET FOREIGN_KEY_CHECKS = 0;
SET FOREIGN_KEY_CHECKS = 1;

-- 2. delete a row using condition
delete from user_membership 
where user_id > 5;



-- RENAME QUERY

-- 1. rename any column
alter table user_membership
rename column end_date to due_date;

-- 2. rename any column
alter table user_membership 
rename column start_date to from_date;



-- table 4
CREATE TABLE Trainers (
trainer_id INT AUTO_INCREMENT PRIMARY KEY,
first_name VARCHAR(100),
last_name VARCHAR(100),
email VARCHAR(100) UNIQUE,
phone VARCHAR(15),
certification VARCHAR(100),
hire_date DATE,
status ENUM('Active', 'Inactive')
);

-- insert values
INSERT INTO Trainers (first_name, last_name, email, phone, certification, hire_date, status)
VALUES
('David', 'Williams', 'davidwilliams@example.com', '555-9999', 'Certified Personal Trainer', '2024-12-01', 'Active'),
('Sarah', 'Brown', 'sarahbrown@example.com', '555-1122', 'Certified Yoga Instructor', '2024-08-15', 'Inactive'),
('James', 'Miller', 'jamesmiller@example.com', '555-3344', 'Certified Strength Coach', '2024-05-20', 'Active'),
('Olivia', 'Taylor', 'oliviataylor@example.com', '555-4455', 'Certified Nutritionist', '2024-11-01', 'Active'),
('Daniel', 'Wilson', 'danielwilson@example.com', '555-5566', 'Certified CrossFit Trainer', '2024-09-15', 'Active');

select *from trainers;


-- table 5
CREATE TABLE Payments (
payment_id INT AUTO_INCREMENT PRIMARY KEY,
user_id INT,
amount DECIMAL(10, 2),
payment_date DATE,
payment_method ENUM('Credit Card', 'Debit Card', 'Cash', 'Bank Transfer'),
payment_status ENUM('Pending', 'Completed', 'Failed'),
FOREIGN KEY (user_id) REFERENCES User(user_id)
);

drop database GYM_MANAGEMENT;

select version();

-- insert values
INSERT INTO Payments (user_id, amount, payment_date, payment_method, payment_status)
VALUES
(1, 50.00, '2025-01-05', 'Credit Card', 'Completed'),
(2, 120.00, '2025-01-12', 'Debit Card', 'Completed'),
(3, 500.00, '2025-01-11', 'Bank Transfer', 'Pending'),
(4, 60.00, '2025-01-06', 'Cash', 'Completed'),
(5, 300.00, '2025-01-09', 'Credit Card', 'Completed');

select * from Payments;