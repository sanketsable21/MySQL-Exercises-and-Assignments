-- Quiz-1 [2 Hrs ( 500 Points )]
-- time - 11.45am to 1.45pm

/*
Task :- 
Database- Laptop

1. Create 5 tables within minimun 5 attributes using proper datatypes & constraints (100 points)
2. Insert 10 values in each table (data must be unique & relevant)(100 points)
3. Write queries to drop, truncate % show data for each table & database (100 Points)
4. Do proper documentation (100 Points)
5. Write 10 queries (conditional) using select (100 points)
*/

create database laptop_showroom;

drop database laptop_showroom;

use laptop_showroom;

-- Table 1 - Employees
create table employees(
Emp_id int primary key auto_increment,
Name varchar(40),
Email varchar(40) unique,
Phone varchar(20),
Salary int not null,
Gender varchar(20)
);

drop table employees;

insert into employees ( Name, Email, Phone, Salary, Gender )
values
('Sanket Sable','sanketsable123@gmail.com','8291621013',35000,'Male'),
('Yash Garud','yashgarud123@gmail.com','8998646835','30000','Male'),
('Anjali Patil','anjalipatil123@gmail.com','7684614681',32000,'Female'),
('Mukkashshaf Momin','mukashshafmomin123@gmail.com','8666846848',29000,'Female'),
('Karan Khegde','karankhegde123@gmail.com','9004178250',24000,'Male'),
('Nupur Lotekar','nupurlotekar123@gmail.com','7715821977',35000,'Male'),
('Tanay Kadam','tanaykadam123@gmail.com','8498646658',25000,'Male'),
('Rohit Thorat','rohitthorat123@gmail.com','8684684684',34000,'Male'),
('Soham Choudhary','sohamchoudhary123@gmail.com','9898664635',28000,'Male'),
('Aniket Potale','aniketpotale123@gmail.com','7651615318',29000,'Male');

truncate employees;

select * from employees;

-- Table 2 - customers
create table customers(
Cust_id int primary key not null auto_increment,
Name varchar(50),
Email varchar(50) unique,
Phone varchar(20),
Address Varchar(20)
);

drop table customers;

insert into customers ( Name, Email, Phone, Address )
values
('Raj Mali','rajmali123@gmail.com',8468468464,'Mumbai'),
('Rakhi Samant','rakhisamant123@gmail.com',9664684615,'Dombivali'),
('Mahendra Samant','mahendrasamant12@gmail.com',9864846516,'Thane'),
('Anand Tawade','anandtawade123@gmail.com',7876464864,'Diva'),
('Amol Jadhav','amoljadhav123@gmail.com',8464654616,'Badlapur'),
('Pavan Jadhav','pavanjadhav123@gmail.com',8784616168,'Badlapur'),
('Damu Gadekar','damugadekar123@gmail.com',8918646468,'Dombivali'),
('Dipali Sable','dipalisable123@gmail.com',9594354453,'Dombivali'),
('Rushikesh Bambarde','rushibambarde123@gmail.com',7447313953,'CSMT'),
('Jayesh Kusal','jayeshkusal123@gmail.com',7846464468,'Vashi');

truncate customers;

select * from customers;

-- Table 3 - laptops
create table laptops (
    LaptopID int primary key auto_increment,
    Brand varchar(50),
    Processor varchar(100),
    RAM varchar(50),
    Storage varchar(100),
    Price decimal(10,2), -- Price in dollars
    Stock int
);

drop table laptops;

insert into laptops (Brand, Processor, RAM, Storage, Price, Stock) -- laptop price in dollars
values
('Apple', 'M2 Pro', '16GB', '512GB SSD', 1899.99, 15),
('Dell', 'Intel Core i7-13700H', '16GB', '1TB SSD', 1499.99, 20),
('HP', 'AMD Ryzen 7 7735HS', '32GB', '1TB SSD', 1299.99, 10),
('Lenovo', 'Intel Core i5-12500H', '8GB', '512GB SSD', 999.99, 25),
('Asus', 'AMD Ryzen 9 7945HX', '32GB', '2TB SSD', 1799.99, 12),
('Acer', 'Intel Core i3-1215U', '8GB', '256GB SSD', 599.99, 30),
('MSI', 'Intel Core i9-13980HX', '64GB', '2TB SSD', 2499.99, 8),
('Samsung', 'Intel Core i7-1260P', '16GB', '512GB SSD', 1299.99, 18),
('Razer', 'Intel Core i9-13900H', '32GB', '1TB SSD', 2299.99, 7),
('Microsoft', 'Intel Core i5-1235U', '8GB', '256GB SSD', 899.99, 22);

truncate laptops;

select * from laptops;

-- Table 4 - orders
create table Orders (
    Order_id int primary key auto_increment,
    Cust_id int,
    Order_date varchar(30),
    Total_amount decimal(10,2), -- amount is in dollars
    Status varchar(20)
);

drop database orders;

insert into Orders (Customer_id, Order_date, Total_amount, Status) -- amount is in dollars
values
(1, '2025-01-01 10:30:00', 1200.50, 'Completed'),
(2, '2025-01-02 14:15:00', 850.75, 'Pending'),
(3, '2025-01-03 16:00:00', 1350.00, 'Completed'),
(4, '2025-01-04 09:45:00', 999.99, 'Shipped'),
(5, '2025-01-05 18:20:00', 1750.25, 'Completed'),
(6, '2025-01-06 12:10:00', 725.00, 'Cancelled'),
(7, '2025-01-07 11:55:00', 2100.80, 'Completed'),
(8, '2025-01-08 15:35:00', 1350.50, 'Pending'),
(9, '2025-01-09 13:40:00', 950.99, 'Shipped'),
(10, '2025-01-10 17:25:00', 1899.00, 'Completed');

truncate orders;

select * from orders;

-- Table 5 - Payments
create table payments (
    Payment_id int primary key auto_increment,
    Order_id int,
    Payment_date varchar(30),
    Amount decimal(10,2), -- amount is in dollars
    Payment_method varchar(20)
);

drop database payments;

insert into Payments (Order_id, Payment_date, Amount, Payment_method) -- amount is in dollars
values
(1, '2025-01-01', 1200.50, 'Credit Card'),
(2, '2025-01-02', 850.75, 'Debit Card'),
(3, '2025-01-03', 1350.00, 'Net Banking'),
(4, '2025-01-04', 999.99, 'UPI'),
(5, '2025-01-05', 1750.25, 'Cash'),
(6, '2025-01-06', 725.00, 'Credit Card'),
(7, '2025-01-07', 2100.80, 'Debit Card'),
(8, '2025-01-08', 1350.50, 'Net Banking'),
(9, '2025-01-09', 950.99, 'UPI'),
(10, '2025-01-10', 1899.00, 'Cash');

truncate payments;

select * from payments;



-- 1. Select query for select the particular column
select Name, Salary from employees;

-- 2. select query for a particular amount of salary
select * from employees where Salary = 35000;

-- 3. select query for ordered name in descending order
select * from customers order by Address desc; 

-- 4. select query for ordered salary in ascending order
select * from customers order by Phone asc;

-- 5. select laptops with price between two amount
select * from laptops where price between 1000.99 and 1600.99;

-- 6. select laptops price is greater than a particular amount
select * from laptops where price > 1600.99;

-- 7. Select orders with specific status
select * from orders where status = 'Completed';

-- 8. select orders Order_date is greater than certain date
select * from orders where Order_date > '2025-01-03';

-- 9. select payment_method for a Payment_date
select * from payments where Payment_method = 'Credit Card';

-- 10. select query for amount in descending order
select * from payments order by amount asc;