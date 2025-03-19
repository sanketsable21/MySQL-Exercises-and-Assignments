create database xyzcollege;
drop database xyzcollege;
use xyzcollege;

-- Foreign keys
-- Delete and Update cascade

/*
What are Foreign keys?
--> A Foreign key is a field in one table that links to the primary key of another table .
It creates a relation between the two tables.

Delete Cascade
--> A delete cascade means that when a record in the parent table (The table with the primary key) is deleted, 
all corresponding records in the child table (The table with the foreign key) will also be deleted automatically.

Update Cascade
--> An update cascade means that when the primary key of record in the parent table is updated, all corresponding foreign keys in the child table will also 
be updated automatically. 
*/

-- Create 5 tables (Departments, Faculty, Students, Marks, and Salary)

-- Table - 01
create table departments(
DepartmentID int primary key,
-- unique identifier for each department
DepartmentName varchar(100) not null,
-- name of the department cannot be null
DepartmentHead varchar(100),
-- Head of the department (Optional)
CreationDate date not null,
-- Date the department was created, cannot be null
Budget decimal(15, 2) check (Budget >= 0),
-- Budget for the department must be non-negative
Location varchar(100),
-- Location of the department (Optional)
PhoneNumber varchar(100),
-- Conatact phone number for the department
Email varchar(100) unique,
-- Email address for the department, must be unique
Status ENUM ('Active','Inactive') Default 'Active'
-- Status of the department (default is 'active')
);

drop table departments;

-- insert values
INSERT INTO Departments (DepartmentID, DepartmentName, DepartmentHead, CreationDate, Budget, Location, PhoneNumber, Email, Status) VALUES
(1, 'Computer Science', 'Dr. Aditi Joshi', '2015-08-01', 600000.00, 'Main Campus', '022-12345678', 'cs@mumbaiuniversity.edu', 'Active'),
(2, 'Mechanical Engineering', 'Dr. Rohan Mehta', '2016-07-15', 550000.00, 'Engineering Block', '022-23456789', 'mech@mumbaiuniversity.edu', 'Active'),
(3, 'Civil Engineering', 'Dr. Priya Sharma', '2017-09-10', 500000.00, 'Engineering Block', '022-34567890', 'civil@mumbaiuniversity.edu', 'Active'),
(4, 'Electrical Engineering', 'Dr. Vikram Singh', '2018-01-20', 520000.00, 'Engineering Block', '022-45678901', 'electrical@mumbaiuniversity.edu','Inactive'),
(5, 'Information Technology', 'Dr. Neha Gupta', '2019-03-05', 480000.00, 'IT Building', '022-56789012', 'it@mumbaiuniversity.edu', 'Active'),
(6, 'Business Administration', 'Dr. Sanjay Rao', '2014-11-11', 700000.00, 'Management Building', '022-67890123', 'business@mumbaiuniversity.edu', 'Active'),
(7, 'Psychology', 'Dr. Anjali Verma', '2020-02-25', 300000.00, 'Arts Block', '022-78901234', 'psychology@mumbaiuniversity.edu', 'Active'),
(8, 'Economics', 'Dr. Karan Desai', '2018-06-30', 350000.00, 'Social Sciences Building', '022-89012345', 'economics@mumbaiuniversity.edu', 'Inactive'),
(9, 'Mathematics', 'Dr. Sneha Patil', '2016-04-15', 400000.00, 'Science Block', '022-90123456', 'maths@mumbaiuniversity.edu', 'Active'),
(10, 'History', 'Dr. Amit Bhatia', '2015-12-01', 250000.00, 'Arts Block', '022-01234567', 'history@mumbaiuniversity.edu', 'Active');

select * from departments;

-- Table - 2
create table faculty(
FacultyID int primary key,
-- Unique identifier for each faculty member
FacultyName varchar(100) not null,
-- Name of the faculty member , cannot be null
DepartmentID int null,
-- Department the faculty belongs to (optional)
HireDate date not null,
-- Date the faculty member was hired, cannot be null
Email varchar(100) unique not null,
-- Email address of the faculty member, must be unique
PhoneNumber varchar(15),
-- Contact phone number for the faculty member (optional)

-- Here Enum is the String Object
Position enum ('Professor','Associate Professor','Assistant Professor','Lecturer') not null,
-- Position of the faculty member
Foreign key (DepartmentID) references Departments (DepartmentID)
on delete set null
-- If a department is deleted, set the faculty's DepartmentID to null
on update cascade
-- If a DepartmentID is updated, update it in faculty 
);

-- insert 10 records
INSERT INTO Faculty (FacultyID, FacultyName, DepartmentID, HireDate, Email, PhoneNumber, Position) VALUES
(1, 'Dr. Aditi Sharma', 1, '2015-08-01', 'aditi.sharma@mumbaiuniversity.edu.in', '9876543210', 'Professor'),
(2, 'Prof. Rajesh Mehta', 2, '2016-09-15', 'rajesh.mehta@mumbaiuniversity.edu.in', '8765432109', 'Associate Professor'),
(3, 'Dr. Neha Patil', 3, '2018-01-10', 'neha.patil@mumbaiuniversity.edu.in', '7654321098', 'Assistant Professor'),
(4, 'Mr. Amit Desai', 1, '2020-07-20', 'amit.desai@mumbaiuniversity.edu.in', '6543210987', 'Lecturer'),
(5, 'Dr. Kavita Joshi', 2, '2017-05-25', 'kavita.joshi@mumbaiuniversity.edu.in', '5432109876', 'Professor'),
(6, 'Prof. Sanjay Kulkarni', 3, '2019-11-11', 'sanjay.kulkarni@mumbaiuniversity.edu.in', '4321098765', 'Associate Professor'),
(7, 'Ms. Pooja Nair', 4, '2021-06-30', 'pooja.nair@mumbaiuniversity.edu.in', '3210987654', 'Assistant Professor'),
(8, 'Dr. Ramesh Bhat', 5, '2014-03-15', 'ramesh.bhat@mumbaiuniversity.edu.in', '2109876543', 'Professor'),
(9, 'Mr. Vikram Singh', 4, '2022-02-01', 'vikram.singh@mumbaiuniversity.edu.in', '1098765432', 'Lecturer'),
(10, 'Dr. Sneha Iyer', 5, '2020-12-12', 'sneha.iyer@mumbaiuniversity.edu.in', '0987654321', 'Associate Professor');

select * from faculty;

-- Table - 3
create table students(
StudentID int primary key,
-- unique identifier for each student (Primary Key)

StudentName varchar(100) not null,
-- Name of the student cannot be NULL
-- This field stores the full name of the student

DepartmentID int null,
-- Department the student belongs to (optional)
-- This field links to the Departments table to indicate the student's department.

EnrollmentDate date not null,
-- Date the student was enrolled, cannot be null
-- This field records the date the student enrolled in the university

Email varchar(100) unique not null,
-- Email address of the student , must be unique
-- This field stores the student's email address and must be unique across all students.

PhoneNumber varchar(15),
-- Contact phone number of the student (Optional)
-- This field is optional and stores the student's contact number.

DateOfBirth date,
-- Date of birth of the student (optional)
-- This field stored the data pf the student for age verification and record-keeping.

Address varchar(255),
-- Redidential address of the student (optional)
-- This field stores the student's residential address.

-- Check constraint for validating email format (basic validation)
constraint chk_EmailFormat check (Email like '%_@__%.__%'),
-- This ensures that the email address contains at least one character before the '@',
-- at least two characters after '@', and at least one '.' after the '@'.

foreign key(DepartmentID) references Departments(DepartmentID)
on delete set null
-- if a department is deleted, set the students DepartmentID to NULL
on update cascade
-- if a DepartmentID is updated, update it in students
);

-- insert 10 records
INSERT INTO Students (StudentID, StudentName, DepartmentID, EnrollmentDate, Email, PhoneNumber, DateOfBirth, Address) VALUES
(1, 'Aditi Sharma', 1, '2023-08-01', 'aditi.sharma@example.com', '9876543210', '2005-06-15', '123, Marine Drive, Mumbai'),
(2, 'Rahul Desai', 2, '2023-08-01', 'rahul.desai@example.com', '9876543211', '2004-05-20', '456, Juhu Beach, Mumbai'),
(3, 'Sneha Patil', 1, '2023-08-01', 'sneha.patil@example.com', '9876543212', '2005-07-30', '789, Bandra, Mumbai'),
(4, 'Vikram Joshi', 3, '2023-08-01', 'vikram.joshi@example.com', '9876543213', '2004-02-10', '321, Andheri, Mumbai'),
(5, 'Priya Iyer', 2, '2023-08-01', 'priya.iyer@example.com', '9876543214', '2005-04-25', '654, Powai, Mumbai'),
(6, 'Rohit Mehta', 3, '2023-08-01', 'rohit.mehta@example.com', '9876543215', '2004-11-11', '987, Thane, Mumbai'),
(7, 'Neha Gupta', 1, '2023-08-01', 'neha.gupta@example.com', '9876543216', '2005-12-01', '159, Dadar, Mumbai'),
(8, 'Karan Singh', 2, '2023-08-01', 'karan.singh@example.com', '9876543217', '2004-09-15', '753, Malad, Mumbai'),
(9, 'Anjali Verma', 3, '2023-08-01', 'anjali.verma@example.com', '9876543218', '2005-03-05', '852, Borivali, Mumbai'),
(10, 'Siddharth Rao', 1, '2023-08-01', 'siddharth.rao@example.com', '9876543219', '2004-01-20', '963, Ghatkopar, Mumbai');

select * from students;

-- Table - 4
create table marks(
MarkID int primary key,
-- unique identifier for each mark record (Primary Key)

StudentID int,
-- Student who received the marks
-- This field links to the students table to indicate which student received the marks.

FacultyID int null,
-- Faculty who graded the marks
-- This field links to the faculty table to indicate which faculty member graded the marks.

Subject varchar(100) not null,
-- Subject for which the marks are awarded 
-- This field stores the name of the subject for which the marks are awarded; cannot be NULL.

MarksObtained int check (MarksObtained >= 0 and MarksObtained <= 100),
-- Ensuring marks are within 0-100
-- This field records the marks obtained by the student; must be between 0 and 100.

ExamDate date not null,
-- Date of the exam
-- This field record the date on which the exam was conducted; cannot be NULL.

foreign key (StudentID) references Students(StudentID)
on delete cascade
-- if a student is deleted, their marks will also be deleted
on update cascade,
-- if a StudentID is updated, update it in marks

Foreign key(FacultyID) references Faculty(FacultyID)
on delete set null
-- If a faculty member is deleted, set the FacultyID in marks to NULL
on update cascade
-- If a FacultyID is updated, update it in Marks
);

-- insert 10 records
INSERT INTO Marks (MarkID, StudentID, FacultyID, Subject, MarksObtained, ExamDate) VALUES
 (1, 1, 1, 'Mathematics', 85, '2023-05-15'),   -- Student 1
 (2, 2, 2, 'Physics', 78, '2023-05-16'),        -- Student 2
 (3, 3, 3, 'Chemistry', 92, '2023-05-17'),      -- Student 3
 (4, 4, 4, 'Biology', 88, '2023-05-18'),        -- Student 4
 (5, 5, 5, 'Computer Science', 95, '2023-05-19'), -- Student 5
 (6, 6, 6, 'English', 76, '2023-05-20'),        -- Student 6
 (7, 7, 7, 'History', 84, '2023-05-21'),        -- Student 7
 (8, 8, 8, 'Geography', 90, '2023-05-22'),      -- Student 8
 (9, 9, 9, 'Economics', 70, '2023-05-23'),      -- Student 9
 (10, 10, 10, 'Political Science', 82, '2023-05-24'); -- Student 10

select * from marks;

-- Table - 5
create table salary(
SalaryID int primary key,
-- Unique identifier for each salary record (Primary Key)

FacultyID int,
-- Faculty member whose salary is recorded
-- This field links to the Faculty table to indicate which faculty member the salary belongs to.

SalaryAmount decimal (10, 2) check (SalaryAmount >= 0),
-- Ensuring salary is non-negative
-- This field records the amount of salary paid to the faculty member; must be non-negative.

PaymentDate date not null,
-- Date of salary payment
-- This field records the date on which the salary was paid; cannot be NULL.

PaymentMethod varchar(50) not null,
-- method of payment (e.g., bank transfer, cash)
-- This field indicates the method used for salary payment; cannot be NULL.

foreign key(FacultyID) references Faculty(FacultyID)
on delete cascade
-- If a faculty member is deleted, their salary record will also be deleted
on update cascade
-- If a FacultyID is updated, update it in salary
);

-- insert 10 records
-- Inserting records into the Salary table
INSERT INTO Salary (SalaryID, FacultyID, SalaryAmount, PaymentDate, PaymentMethod) VALUES
(1, 1, 50000.00, '2023-06-30', 'Bank Transfer'),    
-- Faculty 201
(2, 2, 55000.00, '2023-06-30', 'Cash'),              
-- Faculty 202
(3, 3, 60000.00, '2023-06-30', 'Bank Transfer'),    
-- Faculty 203
(4, 4, 52000.00, '2023-06-30', 'Cheque'),            
-- Faculty 204
(5, 5, 51000.00, '2023-07-30', 'Bank Transfer'),    
-- Faculty 201
(6, 2, 53000.00, '2023-07-30', 'Cash'),              
-- Faculty 202
(7, 3, 59000.00, '2023-07-30', 'Bank Transfer'),    
-- Faculty 203
(8, 4, 54000.00, '2023-07-30', 'Cheque'),            
-- Faculty 204
(9, 1, 52000.00, '2023-08-30', 'Bank Transfer'),    
-- Faculty 201
(10, 2, 55000.00, '2023-08-30', 'Cash');              
-- Faculty 202

select * from salary;

-- Perform Delete and Update Operations
-- Delete a department(e.g., DepartmentID = 1)
DELETE FROM Departments WHERE DepartmentID = 1;

-- Check the Faculty and Student tables to see the effects
SELECT * FROM Faculty; -- DepartmentID for faculty in department 1 should be NULL
SELECT * FROM Students; -- DepartmentID for Students in department 1 should be NULL
 
-- Delete a faculty member (e.g., FacultyID = 1)
DELETE FROM Faculty WHERE FacultyID = 1;

-- Check the Salary table to see if the salary record for FacultyID = 1 is deleted
SELECT * FROM Salary; -- Salary record for FacultyID 1 should be gone

-- Update the Marks table to see the effects
SELECT * FROM Marks; -- FacultyID for marks graded by FacultyID should be NULL

-- Update a department ID (e.g., change DepartmentID from 2 to 20)
UPDATE Departments SET DepartmentID = 20 WHERE DepartmentID = 2;

-- Check the Faculty and Students tables to see the effects 
SELECT * FROM Faculty; -- DepartmentID for facultywho were in department 2 should now be 20
SELECT * FROM Students; -- DepartmentID for students who were in department 2 should now be 20

-- Update a faculty ID (e.g., change FacultyID from 3 to 30)
UPDATE Faculty SET FacultyID = 30 WHERE FacultyID = 3;

-- Check the Marks and Salary tables to see the effects
SELECT * FROM Marks; -- FacultyID for marks graded bt FacultyID 3 should now be 30
SELECT * FROM Salary; -- FacultyID in Salary table for FacultyID 3 should now be 30

UPDATE Faculty SET FacultyID = 60 WHERE FacultyID = 6;

SELECT * FROM Marks;
SELECT * FROM Salary;

/*
-- Adding Constraints

1. Adding a Foreign Key Constraint:
You can add a foreign key constraint to an existing table to enforce referential integrity.

2. Adding a Unique Constraints:
You can add a unique constraint to ensure that all values in a column are different.

3. Adding a Check Constraints:
You can add a check constraints to enforce a condition on the values in a column.


Dropping Constraints

1. Dropping a Foreign Key Constraint:
You can drop a foreign key constraint if you no longer need it.

2. Dropping a Unique Constraint:
You can drop a unique constraint if you want to allow duplicate values in a column.

3. Dropping a Check Constraint:
You can dro a check constraints if you want to remove the condition on a column.
*/

-- 1. Adding a Foreign Key Constraint to the Marks table
ALTER TABLE Marks
ADD CONSTRAINT fk_student
FOREIGN KEY (StudentID) REFERENCES Students(StudentID)
ON DELETE CASCADE
ON UPDATE CASCADE;

-- 2. Adding a Unique Constraint to the Faculty table on Email
ALTER TABLE Faculty
ADD CONSTRAINT uq_faculty_email UNIQUE (Email);

-- 3. Adding a Check Constraints to the Salary table to ensure SalaryAmount is positive
ALTER TABLE Salary
ADD CONSTRAINT chk_salary_amount CHECK (SalaryAmount > 0);

-- 4. Dropping a Foreign Key Constraint from the Marks table
ALTER TABLE Marks
DROP FOREIGN KEY fk_student;

-- 5. Dropping a Unique Constraint from the Faculty table
ALTER TABLE Faculty
DROP INDEX uq_faculty_email;

-- 6. Dropping a Check Constraints from the Salary table
ALTER TABLE Salary
DROP CHECK chk_salary_amount;

-- 7. Adding a new Check Constraint to the Students table to eansure age is valid
ALTER TABLE Students
ADD CONSTRAINT chk_age CHECK (YEAR(CURDATE()) - YEAR(DateOfBirth) >= 0);

-- 8. Dropping the Check Constraint from the Students table
ALTER TABLE Students
DROP CHECK chk_age;

/*
What Are Operators in MySQL?
--> Operators in MySQL are special symbols or keywords used to perform operations on one or more operands
(values, expressions, or fields) in a MySQL query. They are essential for forming conditions, manipulating data, and retrieving desired results from the database.
Operators hep in computations, comparisons, logical evaluations
string concatenations and much more.

1. Arithmetic Operators

+: Addition
-: Subtraction
*: Multiplication
/: Division
%: Modulus (remainder after division)
DIV: Integer division (returns integer part of division)
MOD: Modulus (same as % in MySQL)

2. Comparison Operators

=: Equal to
<> or !=: Not equal to
>: Greater than
<: Less than
>=: Greater than or Equal to
<=: Less than or Equal to
LIKE: Pattern matching using wildcards (% and _)
NOT LIKE: Pattern not matching
REGXP: Regular expression matching
NOT REGXP: Regular expression not matching

3. Logical Operators

AND: Logical AND (true if both conditions are true)
OR: Logical OR (true if at least one condition is true)
NOT: Logical NOT (negates the condition)
XOR: Logical exclusive OR (true if only one condition is true)


4. Assignment Operators

=: Assign a value to a variable or column
:=: Assign a value to a user-defined variable
+=: Addition assignment (not standard in MySQL but used in some cases)
-=: Subtraction assignment
*=: Multiplication assignment
/=: Division assignment
%=: Modulus assignment
DIV=: Integer division assignment
MOD=: Modulus assignment


5. Bitwise Operators

&: Bitwise AND
|: Bitwise OR
^: Bitwise XOR
~: Bitwise NOT (inverts the bits)
<<: Left shift
>>: Right shift




6. String Operators

CONCAT(): Concatenate strings (e.g., CONCAT('Hello', ' World'))
||: String concatenation (alternative to CONCAT in some MySQL versions)


7. Other Operators

IN: Membership test (checks if a value exists in a list or subquery)
NOT IN: Membership test (checks if a value does not exist in a list or subquery)
BETWEEN: Range test (checks if a value is within a range)
NOT BETWEEN: Range test (checks if a value is outside a range)
IS NULL: Null test (checks if a value is NULL)
IS NOT NULL: Null test (checks if a value is not NULL)
EXISTS: Subquery test (true if subquery returns any rows)
NOT EXISTS: Subquery test (true if subquery returns no rows)


Why Are Operators Important in MySQL?
Simplify Query Logic: Operators make it easy to specify conditions and manipulate data directly in SQL statements.
Dynamic Data Retrieval: Help fetch specific records based on comparisons and logical conditions.
Data Manipulation: Arithmetic and string operators allow dynamic computation and formatting of data.
Efficient Filtering: Operators like LIKE and BETWEEN enable precise filtering for large datasets.


These operators cover a wide range of functionality, from basic arithmetic to advanced logical and 
string manipulations, enabling efficient data handling and querying in MySQL.

*/
/*

-- Bitwise Operator

Get Binary Number -

----------512, 256, 128, 64, 32, 16, 8, 4, 2,1

Binary of 5 is 0101
Binary of 3 is 0011

Common Bitwise Operators in MySQL
AND (&): Compares each bit of two numbers and returns a new number with bits set to 1 only where both bits are 1.
OR (1): Compares each bit of two numbers and returns a new number with bits set to 1 where at least one of the bits is 1.
XOR (^): Compares each bit of two numbers and returns a new number with bits set to 1 where the bits are different.
NOT (~): Inverts the bits of a number.
Left Shift (<<): Shifts the bits of a number to the left by a specified number of positions.
Right Shift (>>): Shifts the bits of a number to the right by a specified number of positions.

Bitwise operators can be useful in various scenarios, such as:

1. Flags and Permissions: Using bitwise operations to manage user permissions or feature flags.
2. Data Compression: Storing multiple boolean values in a single integer.
3. Efficient Calculations: Performing low-level data manipulation or optimizations.

Let's say we have a table called users that stores user permissions as a bitmask.
Each permission corresponds to a specific bit in an integer:

1 (0001) - Read permission
2 (0010) Write permission
4 (0100) Execute permission
8 (1000) Delete permission.
*/

USE zoom;

CREATE TABLE users (
	id INT AUTO_INCREMENT PRIMARY KEY,
	username VARCHAR(50) NOT NULL,
	email VARCHAR(100) NOT NULL UNIQUE,
	password_hash VARCHAR(255) NOT NULL,
	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	permissions INT NOT NULL
);

TRUNCATE users;
-- Let's insert some users with different permissions:
INSERT INTO users (username, email, password_hash, permissions) VALUES
('Alice', 'alice@example.com', 'hashed_password_1', 3), -- Read (1) + Write (2) = 3 (0011)
('Bob', 'bob@example.com', 'hashed_password_2', 5), -- Read (1) + Execute (4) = 5 (0101)
('Charlie', 'charlie@example.com', 'hashed_password_3', 8), -- Delete (8)= 8 (1000)
('David', 'david@example.com', 'hashed_password_4', 15), -- All permissions (1111)
('Eve', 'eve@example.com', 'hashed_password_5', 1), -- Read (1)
('Frank', 'frank@example.com', 'hashed_password_6', 6), -- Write (2) Execute (4) = 6 (0110)
('Grace', 'grace@example.com', 'hashed_password_7', 10), -- Write (2) + Delete (8) 10 (1010)
('Hannah', 'hannah@example.com', 'hashed_password_8', 12), -- Execute (4) + Delete (8) = 12 (1100)
('Isaac', 'isaac@example.com', 'hashed_password_9', 0), -- No permissions
('Jack', 'jack@example.com', 'hashed_password_10', 7); -- Read (1) + Write (2) + Execute (4) = 7 (0111)

SELECT * FROM users;

SELECT * FROM users WHERE (permissions & 1) = 1;  
-- Users with Read permission

SELECT * FROM users WHERE (permissions & 3) = 3;  
-- Users with Read and Write permissions

SELECT * FROM users WHERE (permissions & 2) = 2;  
-- Users with Write permission

SELECT * FROM users WHERE (permissions & 4) = 4;  
-- Users with Execute permission

SELECT * FROM users WHERE (permissions & 8) = 8;  
-- Users with Delete permission

-- Add Permission
UPDATE users SET permissions = permissions & 4 WHERE username = 'Alice';
UPDATE users SET permissions = permissions | 4 WHERE username = 'Alice';
/*
The error message you're encountering indicates that MySQL's "safe update mode" is enabled.
This mode prevents you from executing UPDATE or DELETE statements that do not include
a WHERE clause that uses a key column (like a primary key). This is a safety feature
to prevent accidental updates or deletions of all rows in a table.
*/

--  Disable Safe Update Mode Temporarily
SET SQL_SAFE_UPDATES = 0;

SET SQL_SAFE_UPDATES = 1;  -- Re-enable safe updates


-- Remove Permission
UPDATE users SET permissions = permissions & ~1 WHERE username = 'Bob';

-- Toggle Permission
UPDATE users SET permissions = permissions ^ 8 WHERE username = 'Charlie';

-- Count Users with a Specific Permission
SELECT COUNT(*) AS user_count FROM users WHERE (permissions & 1) = 1;

-- List Users with No Permissions
SELECT * FROM users WHERE permissions = 0;

-- List Users with All Permissions
SELECT * FROM users WHERE permissions = 15;  -- 15 = 1111 in binary

-- Get Permissions as Binary String
SELECT username, BIN(permissions) AS permissions_binary FROM users;

-- Find Users with At Least One Permission
SELECT * FROM users WHERE permissions > 0;

