USE zoom;

-- Multiple types of Keys in Mysql

/*
1. Super Key:
A super key is any combination of columns (one or more) that can uniquely identify a row in a table.
It may contain additional columns that are not necessary for unique identification.

Example: In a Student table, both StudentID and (StudentID, StudentName) are super keys.
The first uniquely identifies each student, while the second does as well,
but it includes an unnecessary column.

*/

CREATE TABLE Student (
	StudentID INT,
	StudentName VARCHAR(100),
    PRIMARY KEY (StudentID, StudentName) -- Student ID is a super key
);

/*
2. Candidate Key:
A candidate key is a minimal super key. This means it is a super key that cannot have
any columns removed without losing its uniqueness property.
There can be multiple candidate keys in a table.

Example: In the Student table, StudentID is a candidate key.
If Email is also unique, then both Student ID and Email can be candidate keys.
*/

CREATE TABLE Student (
	StudentID INT PRIMARY KEY,
    Email VARCHAR(100) UNIQUE,  -- Email is also a candidate key
    StudentName VARCHAR(100)
);


/* 
3. Primary Key: 
 A primary key is a special case of a candidate key that is chosen to uniquely identify records 
 in a table. A table can have only one primary key, which may consist of one or more columns.
 
 Example: In the Student table, StudentID is designated as the primary key.
*/

CREATE TABLE Student (
    StudentID INT PRIMARY KEY,
    StudentName VARCHAR(100)
);

/* 
 4. Foreign Key: 
 A foreign key is a field (or collection of fields) in one table that refers to the primary key 
 in another table. It establishes a relationship between the two tables and enforces referential integrity.
 
 Example: If you have a Courses table that references the Student table, 
 the StudentID in the Courses table can be a foreign key.
*/

CREATE TABLE Courses (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(100),
    StudentID INT,
    FOREIGN KEY (StudentID) REFERENCES Student(StudentID)
);
 
/*  
5. Alternate Key: 
An alternate key is any candidate key that is not chosen as the primary key. 
It is an alternative way to uniquely identify a record.

Example: In the Student table, if Email is unique and not the primary key, 
it is considered an alternate key.
*/

CREATE TABLE Student (
    StudentID INT PRIMARY KEY,
    Email VARCHAR(100) UNIQUE,  -- Alternate key
    StudentName VARCHAR(100)
);                         

/*
  6. Composite Key: 
A composite key is a primary key that consists of two or more columns. 
It is used when a single column is not sufficient to uniquely identify a record.

Example: In a Enrollments table that records which students are enrolled in which courses, 
a composite key could be made from StudentID and CourseID.
*/

CREATE TABLE Enrollments (
    StudentID INT,
    CourseID INT,
    PRIMARY KEY (StudentID, CourseID),  -- Composite key
    FOREIGN KEY (StudentID) REFERENCES Student(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);


-- Normalization

/*
Normalization is a systematic approach to organizing data in a database to 
reduce redundancy and improve data integrity. The process involves dividing 
a database into tables and establishing relationships between them while 
ensuring that the data is stored logically. The main goals of normalization 
are to eliminate data redundancy and ensure data dependencies make sense.

Why Normalize?

Reduce Redundancy: Avoid storing the same data multiple times.

Improve Data Integrity: Keep data consistent and accurate.

Prevent Anomalies: Avoid problems when adding, updating, or deleting data.

Normal Forms
Normalization is done in steps called "normal forms."

Normalization typically involves several stages, known as normal forms (NF). 
The most commonly used normal forms are:

1. First Normal Form (1NF):
A table is in 1NF if all the attributes contain only atomic (indivisible) values, 
and each entry in a column is of the same data type. There should be no repeating 
groups or arrays.
Example: A table with student information should not have multiple phone numbers 
in a single field. Instead, each phone number should be in its own row or managed 
through a separate table.

2. Second Normal Form (2NF):
A table is in 2NF if it is in 1NF and all non-key attributes are fully functionally 
dependent on the primary key. This means that there should be no partial dependency 
of any column on the primary key.
Example: If a table contains student ID, course ID, and courseName, and Composite key is 
(studentID, CourseID) then the courseName should not depend on just the student ID. 
it should depend on both.

3. Third Normal Form (3NF):
A table is in 3NF if it is in 2NF and there are no transitive dependencies, meaning 
that non-key attributes do not depend on other non-key attributes.
Example: If a table has student ID, department ID, and department name, the department 
name should depend only on the department ID, not on the student ID.

4. Boyce-Codd Normal Form (BCNF):
A table is in BCNF if it is in 3NF and for every functional dependency (X → Y), 
X is a super key. This means that every determinant must be a candidate key.
Example: If a table has a functional dependency where a student's advisor can only be 
from one department, it may violate BCNF if the advisor's department is not a candidate key.

*/


-- pattern & Regular Expressions
/*
Regular expressions (regex) in MySQL are used to search for patterns in strings.
MySQL provides the REGEXP operator, which allows you to perform pattern matching using regular 
expressions. This can be particularly useful for validating input, searching for specific formats, 
or filtering data based on patterns.
*/

drop table employees;

CREATE TABLE IF NOT EXISTS employees (
	employee_id DECIMAL (6,0) NOT NULL PRIMARY KEY,
    -- Unique identifier for each employee
    first_name VARCHAR(20) NOT NULL,
    -- Employee's first name
    last_name VARCHAR(25) NOT NULL,
    -- Employee's last name
	email VARCHAR(50) NOT NULL,
    -- Employee's email address
    phone_number VARCHAR(20) DEFAULT NULL,
    -- Employee's phone number (optional)
    password varchar(20) default null,
	hire_date DATE NOT NULL,
	-- Date when the employee was hired
	job_id VARCHAR(10) NOT NULL,
	-- Identifier for the employee's job
	salary DECIMAL (8,2) DEFAULT NULL,
	-- Employee's salary (optional)
	commission_pct DECIMAL(2,2) DEFAULT NULL, 
    -- Commission percentage (optional)
	manager_id DECIMAL (6,0) DEFAULT NULL,
	-- ID of the employee's manager (optional)
	department_id DECIMAL (4,0) DEFAULT NULL,
	-- ID of the department (optional)
    
    -- Constraints for various fields
   -- Constraints for various fields
    CONSTRAINT chk_email CHECK (email REGEXP '^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}$'),  
    -- Valid email format: 
    -- ^                : Start of the string
    -- [a-zA-Z0-9._%+-]+: One or more alphanumeric characters, dots, underscores, percent signs, pluses, or hyphens
    -- @                : Must contain an "@" symbol
    -- [a-zA-Z0-9.-]+   : One or more alphanumeric characters, dots, or hyphens (domain name)
    -- \\.[a-zA-Z]{2,}  : A dot followed by at least two alphabetic characters (top-level domain)
    -- $                : End of the string

    CONSTRAINT chk_phone_number CHECK (phone_number REGEXP '^(\\+\\d{1,3}\\s?)?\\(?\\d{1,4}\\)?[-\\s]?\\d{1,4}[-\\s]?\\d{1,4}$'),  
    -- Valid phone number format:
    -- ^                     : Start of the string
    -- (\\+\\d{1,3}\\s?)?    : Optional country code starting with "+" followed by 1 to 3 digits and an optional space
    -- \\(?\\d{1,4}\\)?      : Optional area code in parentheses, consisting of 1 to 4 digits
    -- [-\\s]?               : Optional separator (dash or space)
    -- \\d{1,4}             : 1 to 4 digits (first part of the phone number)
    -- [-\\s]?               : Optional separator (dash or space)
    -- \\d{1,4}             : 1 to 4 digits (second part of the phone number)
    -- $                     : End of the string

    CONSTRAINT chk_password CHECK (password 
    REGEXP '^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#$%^&*])[A-Za-z0-9!@#$%^&*]{8,}$'),  
    -- Valid password format (if a password field is added):
    -- ^                     : Start of the string
    -- (?=.*[a-z])          : At least one lowercase letter
    -- (?=.*[A-Z])          : At least one uppercase letter
    -- (?=.*[0-9])          : At least one digit
    -- (?=.*[!@#$%^&*])     : At least one special character from the set !@#$%^&*
    -- [A-Za-z0-9!@#$%^&*]{8,} : At least 8 characters that can be letters, digits, or special characters
    -- $                     : End of the string

    CONSTRAINT chk_first_name CHECK (first_name REGEXP '^[A-Z][a-zA-Z]{1,19}$'),  
    -- First name must start with uppercase and be 2-20 characters long:
    -- ^                     : Start of the string
    -- [A-Z]                : First character must be an uppercase letter
    -- [a-zA-Z]{1,19}       : Followed by 1 to 19 letters (uppercase or lowercase)
    -- $                     : End of the string

    CONSTRAINT chk_last_name CHECK (last_name REGEXP '^[A-Z][a-z ]{1,24}$'),    
    -- Last name must start with uppercase and be 2-25 characters long:
    -- ^                     : Start of the string
    -- [A-Z]                : First character must be an uppercase letter
    -- [a-z]{1,24}          : Followed by 1 to 24 lowercase letters
    -- $                     : End of the string

    CONSTRAINT chk_job_id CHECK (job_id REGEXP '^[A-Z]{2,5}-\\d{1,4}$'),          
    -- Job ID format: 2-5 uppercase letters followed by a hyphen and 1-4 digits:
    -- ^                     : Start of the string
    -- [A-Z]{2,5}           : 2 to 5 uppercase letters
    -- -                    : A hyphen
    -- \\d{1,4}             : 1 to 4 digits
    -- $                     : End of the string

    CONSTRAINT chk_salary CHECK (salary REGEXP '^(\\d{1,8}(\\.\\d{2})?)$'),      
    -- Salary must be a number with up to 8 digits and optional 2 decimal places:
    -- ^                     : Start of the string
    -- \\d{1,8}             : 1 to 8 digits
    -- (\\.\\d{2})?         : Optional decimal part with 2 digits
    -- $                     : End of the string

    CONSTRAINT chk_commission CHECK (commission_pct REGEXP '^(0|0\\.\\d{1,2}|[1-9]\\d*(\\.\\d{1,2})?)$'),  
    -- Commission must be between 0 and 100 with up to 2 decimal places:
    -- ^                     : Start of the string
    -- (0|0\\.\\d{1,2}|[1-9]\\d*(\\.\\d{1,2})?) : 0, 
    -- or 0 followed by 1 to 2 decimal places, or 1 to 9 followed by any number of digits and optional 1 to 2 decimal places
    -- $                     : End of the string

    CONSTRAINT chk_department_id CHECK (department_id REGEXP '^[1-9][0-9]{0,3}$') 
    -- Department ID must be a number between 1 and 9999:
    -- ^                     : Start of the string
    -- [1-9]                : First digit must be between 1 and 9
    -- [0-9]{0,3}           : Followed by 0 to 3 digits
    -- $                     : End of the string
);

-- Insert 5 records into the employees table
INSERT INTO employees (employee_id, first_name, last_name, email, phone_number, password, hire_date, job_id, salary, commission_pct, manager_id, department_id)
VALUES
    (1, 'John', 'Doe', 'john.doe@example.com', '123-456-7890', 'P@ssw0rd', '2020-01-01', 'SALE-1234', 50000.00, 0.10, 2, 10),
    (2, 'Jane', 'Smith', 'jane.smith@example.com', '987-654-3210', 'P@ssw0rd', '2020-02-01', 'DEV-5678', 60000.00, 0.15, 1, 20),
    (3, 'Bob', 'Johnson', 'bob.johnson@example.com', '555-123-4567', 'P@ssw0rd', '2020-03-01', 'MARK-9012', 70000.00, 0.20, 3, 30),
    (4, 'Alice', 'Williams', 'alice.williams@example.com', '789-012-3456', 'P@ssw0rd', '2020-04-01', 'FIN-3456', 80000.00, 0.25, 4, 40),
    (5, 'Mike', 'Davis', 'mike.davis@example.com', '321-987-6543', 'P@ssw0rd', '2020-05-01', 'HR-5678', 90000.00, 0.30, 5, 50);
    
select * from employees;

