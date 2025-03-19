-- Step 1: Create the Database
Create database develearn;

-- Step 2: Use the Database
USE develearn;

-- Step 3: Create the Student Table
CREATE TABLE Students(
	StudentID INT PRIMARY KEY IDENTITY(1,1),-- Auto-incrementing primary key 
	FirstName NVARCHAR(50) NOT NULL, 
	LastName NVARCHAR(50) NOT NULL, 
	DateOfBirth DATE NOT NULL, 
	Email NVARCHAR(100) UNIQUE NOT NULL,
	EnrollmentDate DATE NOT NULL
);

INSERT INTO Students(FirstName, LastName, DateOfBirth, Email, EnrollmentDate) VALUES
('John', 'Doe', '2000-01-15', 'john.doe@example.com', '2023-08-01'),
('Jane', 'Smith', '1999-05-22', 'jane.smith@example.com', '2023-08-01'),
('Alice', 'Johnson', '2001-03-10', 'alice.johnson@example.com', '2023-08-01'),
('Bob', 'Brown', '2000-07-30', 'bob.brown@example.com', '2023-08-01'),
('Charlie', 'Davis', '1998-11-05', 'charlie.davis@example.com', '2023-08-01');

SELECT * FROM Students;

TRUNCATE TABLE Students;

-- Step 4:
-- Create the Faculty Table
CREATE TABLE Faculty (
	FacultyID INT PRIMARY KEY IDENTITY(1,1), -- Auto-incrementing primary key
	FirstName NVARCHAR(50) NOT NULL,
	LastName NVARCHAR (50) NOT NULL,
	Email NVARCHAR(100) UNIQUE NOT NULL,
	HireDate DATE NOT NULL,
	Department NVARCHAR(50) NOT NULL
);

INSERT INTO Faculty (FirstName, LastName, Email, HireDate, Department) VALUES
	('Dr. Emily', 'Clark', 'emily.clark@example.com', '2020-01-10', 'Computer Science'), 
	('Prof. Michael', 'Wilson', 'michael.wilson@example.com', '2019-08-15', 'Mathematics'), 
	('Dr. Sarah', 'Taylor', 'sarah.taylor@example.com', '2021-03-20', 'Physics'), 
	('Prof. David', 'Anderson', 'david.anderson@example.com', '2018-09-25', 'Chemistry'), 
	('Dr. Laura', 'Martinez', 'laura.martinez@example.com', '2022-05-30', 'Biology');

SELECT * FROM Faculty;