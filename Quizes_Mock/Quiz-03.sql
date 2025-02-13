create database VESP;
use VESP;

CREATE TABLE Students (
    StudentID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    DateOfBirth DATE NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    Phone VARCHAR(15),
    Address VARCHAR(255),
    EnrollmentDate DATE NOT NULL,
    Major VARCHAR(100),
    GPA DECIMAL(3, 2),
    Status ENUM('Active', 'Inactive') DEFAULT 'Active'
);

CREATE TABLE Courses (
	StudentID INT,
    CourseID INT AUTO_INCREMENT PRIMARY KEY,
    CourseName VARCHAR(100) NOT NULL,
    CourseCode VARCHAR(10) UNIQUE NOT NULL,
    Credits INT NOT NULL,
    Department VARCHAR(100),
    InstructorID INT,
    Semester ENUM('Fall', 'Spring', 'Summer') NOT NULL,
    Year INT NOT NULL,
    MaxEnrollment INT,
    Description TEXT,
    FOREIGN KEY (InstructorID) REFERENCES Instructors(InstructorID)
);

CREATE TABLE Instructors (
    InstructorID INT AUTO_INCREMENT PRIMARY KEY,
    StudentID INT,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    Phone VARCHAR(15),
    Department VARCHAR(100),
    HireDate DATE NOT NULL,
    OfficeLocation VARCHAR(100),
    Salary DECIMAL(10, 2),
    CoursesTaught TEXT,
    Status ENUM('Active', 'Inactive') DEFAULT 'Active'
);


-- Inserting Records into the Students Table
INSERT INTO Students (FirstName, LastName, DateOfBirth, Email, Phone, Address, EnrollmentDate, Major, GPA, Status) VALUES
('John', 'Doe', '2000-01-15', 'john.doe@example.com', '123-456-7890', '123 Main St, Cityville', '2020-08-20', 'Computer Science', 3.5, 'Active'),
('Jane', 'Smith', '1999-02-20', 'jane.smith@example.com', '234-567-8901', '456 Elm St, Townsville', '2020-08-20', 'Mathematics', 3.8, 'Active'),
('Alice', 'Johnson', '2001-03-25', 'alice.johnson@example.com', '345-678-9012', '789 Oak St, Villagetown', '2021-08-20', 'Biology', 3.2, 'Active'),
('Bob', 'Brown', '2000-04-30', 'bob.brown@example.com', '456-789-0123', '321 Pine St, Cityville', '2020-08-20', 'Physics', 3.6, 'Active'),
('Charlie', 'Davis', '1998-05-05', 'charlie.davis@example.com', '567-890-1234', '654 Maple St, Townsville', '2019-08-20', 'Chemistry', 3.4, 'Active'),
('David', 'Wilson', '2000-06-10', 'david.wilson@example.com', '678-901-2345', '987 Cedar St, Villagetown', '2020-08-20', 'Engineering', 3.7, 'Active'),
('Eva', 'Martinez', '1999-07-15', 'eva.martinez@example.com', '789-012-3456', '159 Birch St, Cityville', '2020-08-20', 'Psychology', 3.9, 'Active'),
('Frank', 'Garcia', '2001-08-20', 'frank.garcia@example.com', '890-123-4567', '753 Spruce St, Townsville', '2021-08-20', 'History', 3.1, 'Active'),
('Grace', 'Hernandez', '2000-09-25', 'grace.hernandez@example.com', '901-234-5678', '852 Fir St, Villagetown', '2020-08-20', 'Literature', 3.3, 'Active'),
('Henry', 'Lopez', '1998-10-30', 'henry.lopez@example.com', '012-345-6789', '963 Willow St, Cityville', '2019-08-20', 'Art', 3.0, 'Active'),
('Isabella', 'Gonzalez', '2001-11-05', 'isabella.gonzalez@example.com', '123-456-7891', '147 Chestnut St, Townsville', '2021-08-20', 'Sociology', 3.5, 'Active'),
('Jack', 'Martinez', '2000-12-10', 'jack.martinez@example.com', '234-567-8902', '258 Ash St, Villagetown', '2020-08-20', 'Economics', 3.8, 'Active'),
('Liam', 'Anderson', '1999-01-15', 'liam.anderson@example.com', '345-678-9013', '369 Poplar St, Cityville', '2020-08-20', 'Political Science', 3.6, 'Active'),
('Mia', 'Thomas', '2001-02-20', 'mia.thomas@example.com', '456-789-0124', '147 Elm St, Townsville', '2021-08-20', 'Environmental Science', 3.4, 'Active'),
('Noah', 'Taylor', '2000-03-25', 'noah.taylor@example.com', '567-890-1235', '258 Oak St, Villagetown', '2020-08-20', 'Information Technology', 3.7, 'Active'),
('Olivia', 'Moore', '1998-04-30', 'olivia.moore@example.com', '678-901-2346', '369 Pine St, Cityville', '2019-08-20', 'Nursing', 3.5, 'Active'),
('Paul', 'Jackson', '2001-05-05', 'paul.jackson@example.com', '789-012-3457', '147 Maple St, Townsville', '2021-08-20', 'Philosophy', 3.2, 'Active'),
('Quinn', 'White', '2000-06-10', 'quinn.white@example.com', '890-123-4568', '258 Cedar St, Villagetown', '2020-08-20', 'Theater', 3.9, 'Active'),
('Riley', 'Harris', '1999-07-15', 'riley.harris@example.com', '901-234-5679', '369 Birch St, Cityville', '2020-08-20', 'Music', 3.1, 'Active');

-- Drop Table-----------------------------------------------------------------------------------------
Drop Table Students;

-- Select all from student table-----------------------------------------------------------------------------------------
select * from students;

-- Select a column from table-----------------------------------------------------------------------------------------
select FirstName, LastName, Address from students;

-- Alter Table Add Column-----------------------------------------------------------------------------------------
Alter table students
add column standard varchar(100) default '4th Standard';

-- Alter Table Drop column-----------------------------------------------------------------------------------------
Alter table students
drop column standard;

-- Update name-----------------------------------------------------------------------------------------
update students
set FirstName = 'Shivam'
Where studentID = 4;

-- Update Lastname-----------------------------------------------------------------------------------------
update students
set LastName = 'Singh'
where FirstName = 'Shivam';

-- Delete Query-----------------------------------------------------------------------------------------
Delete From Students
Where StudentID between 3 and 7;

-- Delete any row-----------------------------------------------------------------------------------------
Delete From Students
Where DateOfBirth = '1999-02-20';

-- Rename Query-----------------------------------------------------------------------------------------
Alter table Students
Rename to Student;

-- Rename Table-----------------------------------------------------------------------------------------
Alter table Student
Rename to Students;

-- Addition Operator-----------------------------------------------------------------------------------------
Update Students
set gpa = gpa + 2;

-- Subtraction Operator-----------------------------------------------------------------------------------------
Update Students
set GPA = GPA - 2;

-- Multiplication Operator-----------------------------------------------------------------------------------------
Update Students
Set GPA = GPA * 2;

-- Divide Operator-----------------------------------------------------------------------------------------
Update Students
Set GPA = GPA / 2;

-- Comaprison Operator-----------------------------------------------------------------------------------------
Select * From students where gpa > 3.10;

Select * from Students where gpa < 3.10;

-- Logical Operator-----------------------------------------------------------------------------------------
Select * From Students where FirstName = 'John' and LastName = 'singh';

Select * from students where FirstName = 'John' or LastName = 'Mali';

-- Functions-----------------------------------------------------------------------------------------
SELECT length(Email) as Full_length_Email from students; 

SELECT Upper(FirstName) as upper_FirstName from students;

-- Joins-----------------------------------------------------------------------------------------
Select students.StudentID , FirstName, CourseName
from students
left join courses on Students.StudentID = Courses.CourseID;

Select students.StudentID , FirstName, CourseName
from students
inner join courses on Students.StudentID = Courses.CourseID;

-- SubQueries-----------------------------------------------------------------------------------------
SELECT FirstName
FROM Students
WHERE StudentID = 
(
	Select StudentID
    From Students
    where StudentID = 10
);

SELECT FirstName
FROM Students
WHERE StudentID = 
(
	Select StudentID
    From Students
    where StudentID = 8
);

-- Clauses-----------------------------------------------------------------------------------------
SELECT * FROM Students WHERE FirstName = 'Frank';

SELECT Address, COUNT(*) AS NumberOfStudents FROM Students GROUP BY Address;

set sql_safe_updates = 0;


-- Inserting Records into the Courses Table
INSERT INTO Courses (StudentID, CourseName, CourseCode, Credits, Department, InstructorID, Semester, Year, MaxEnrollment, Description) VALUES
(1,'Introduction to Computer Science', 'CS101', 3, 'Computer Science', 1, 'Fall', 2023, 30, 'An introduction to the fundamentals of computer science.'),
(2,'Calculus I', 'MATH101', 4, 'Mathematics', 2, 'Fall', 2023, 25, 'An introduction to differential calculus.'),
(3,'Biology 101', 'BIO101', 3, 'Biology', 3, 'Spring', 2023, 30, 'An overview of biological principles.'),
(4,'Physics I', 'PHYS101', 4, 'Physics', 4, 'Spring', 2023, 25, 'An introduction to classical mechanics.'),
(5,'Chemistry 101', 'CHEM101', 4, 'Chemistry', 5, 'Fall', 2023, 30, 'Basic concepts of chemistry.'),
(6,'Engineering Fundamentals', 'ENGR101', 3, 'Engineering', 6, 'Fall', 2023, 30, 'Introduction to engineering principles.'),
(7,'Introduction to Psychology', 'PSY101', 3, 'Psychology', 7, 'Spring', 2023, 30, 'Basic concepts in psychology.'),
(8,'World History', 'HIST101', 3, 'History', 8, 'Fall', 2023, 30, 'Overview of world history.'),
(9,'Literature Analysis', 'LIT101', 3, 'Literature', 9, 'Spring', 2023, 30, 'Study of literary texts and analysis.'),
(10,'Art Appreciation', 'ART101', 3, 'Art', 10, 'Fall', 2023, 30, 'Introduction to the appreciation of art.'),
(11,'Sociology 101', 'SOC101', 3, 'Sociology', 11, 'Spring', 2023, 30, 'Introduction to sociology concepts.'),
(12,'Economics Principles', 'ECO101', 3, 'Economics', 12, 'Fall', 2023, 30, 'Basic principles of economics.'),
(13,'Political Science 101', 'POL101', 3, 'Political Science', 13, 'Spring', 2023, 30, 'Introduction to political science.'),
(14,'Environmental Science', 'ENV101', 3, 'Environmental Science', 14, 'Fall', 2023, 30, 'Study of environmental issues.'),
(15,'Philosophy 101', 'PHIL101', 3, 'Philosophy', 15, 'Spring', 2023, 30, 'Introduction to philosophical concepts.'),
(16,'Theater Arts', 'THEA101', 3, 'Theater', 16, 'Fall', 2023, 30, 'Introduction to theater arts.'),
(17,'Music Theory', 'MUS101', 3, 'Music', 17, 'Spring', 2023, 30, 'Basic concepts of music theory.'),
(18,'Statistics', 'STAT101', 3, 'Mathematics', 18, 'Fall', 2023, 30, 'Introduction to statistics.'),
(19,'Data Structures', 'CS201', 3, 'Computer Science', 1, 'Spring', 2023, 30, 'Study of data structures and algorithms.'),
(20,'Organic Chemistry', 'CHEM201', 4, 'Chemistry', 5, 'Fall', 2023, 30, 'Advanced concepts in organic chemistry.');

-- Drop Table-----------------------------------------------------------------------------------------
Drop Table courses;

-- Select all from courses-----------------------------------------------------------------------------------------
select * from courses;

-- Select table in desc order-----------------------------------------------------------------------------------------
Select * from Courses order by department desc;

-- Modify Column Name-----------------------------------------------------------------------------------------
Alter table courses
change column description course_description varchar(255);

-- Again modify column name-----------------------------------------------------------------------------------------
Alter table courses
change column course_description description varchar(255);

-- Update MaxEnrollment-----------------------------------------------------------------------------------------
Update courses
set MaxEnrollment = 45
where CourseName = 'Chemistry 101';

-- Update CourseName-----------------------------------------------------------------------------------------
Update courses
set CourseName = 'Web Development'
where InstructorId = 8;

-- Delete Query-----------------------------------------------------------------------------------------
Delete From courses
Where CourseID between 3 and 7;

-- Delete any row-----------------------------------------------------------------------------------------
Delete From courses
Where MaxEnrollment = '31';

-- Rename Query-----------------------------------------------------------------------------------------
Alter table courses
Rename to course;

-- Rename Table-----------------------------------------------------------------------------------------
Alter table course
Rename to courses;

-- Addition Operator-----------------------------------------------------------------------------------------
Update courses
set credits = credits + 2;

-- Subtraction Operator-----------------------------------------------------------------------------------------
Update courses
set credits = credits - 2;

-- Multiplication Operator-----------------------------------------------------------------------------------------
Update courses
Set credits = credits * 2;

-- Divide Operator-----------------------------------------------------------------------------------------
Update courses
Set credits = credits / 2;

-- Comaprison Operator-----------------------------------------------------------------------------------------
Select * From courses where credits > 3;

Select * from courses where credits < 3;

-- Logical Operator-----------------------------------------------------------------------------------------
Select * From courses where CourseCode = 'CS101' and Department = 'Mathematics';

Select * from courses where CourseCode = 'CS101' or Department = 'Computer Science';

-- Functions-----------------------------------------------------------------------------------------
SELECT length(Description) as Full_length_Description from courses; 

SELECT Upper(CourseName) as upper_CourseName from courses;

-- Joins-----------------------------------------------------------------------------------------
Select courses.StudentID , FirstName, CourseName
from courses
left join students on courses.StudentID = students.studentID;

Select courses.StudentID , FirstName, CourseName
from courses
inner join students on courses.StudentID = students.StudentID;

-- SubQueries-----------------------------------------------------------------------------------------
SELECT CourseName
FROM courses
WHERE CourseID = 
(
	Select CourseID
    From Courses
    where CourseID = 10
);

SELECT CourseName
FROM courses
WHERE courseID = 
(
	Select CourseID
    From Courses
    where courseID = 8
);

-- Clauses-----------------------------------------------------------------------------------------
SELECT * FROM Courses WHERE CourseName = 'Calculus I';

SELECT Department, COUNT(*) AS NumberOfDepartment FROM courses GROUP BY Department;


-- Inserting Records into the Instructors Table
INSERT INTO Instructors (StudentID ,FirstName, LastName, Email, Phone, Department, HireDate, OfficeLocation, Salary, CoursesTaught, Status) VALUES
(1,'Dr. Alice', 'Johnson', 'alice.j ohnson@university.edu', '123-456-7890', 'Computer Science', '2015-08-15', 'Building A, Room 101', 80000.00, 'CS101, CS201', 'Active'),
(2,'Prof. Bob', 'Smith', 'bob.smith@university.edu', '234-567-8901', 'Mathematics', '2016-09-01', 'Building B, Room 202', 75000.00, 'MATH101, STAT101', 'Active'),
(3,'Dr. Carol', 'Davis', 'carol.davis@university.edu', '345-678-9012', 'Biology', '2017-10-10', 'Building C, Room 303', 72000.00, 'BIO101', 'Active'),
(4,'Prof. David', 'Brown', 'david.brown@university.edu', '456-789-0123', 'Physics', '2018-11-11', 'Building D, Room 404', 78000.00, 'PHYS101', 'Active'),
(5,'Dr. Eva', 'Martinez', 'eva.martinez@university.edu', '567-890-1234', 'Chemistry', '2019-12-12', 'Building E, Room 505', 80000.00, 'CHEM101, CHEM201', 'Active'),
(6,'Prof. Frank', 'Garcia', 'frank.garcia@university.edu', '678-901-2345', 'Engineering', '2020-01-01', 'Building F, Room 606', 85000.00, 'ENGR101', 'Active'),
(7,'Dr. Grace', 'Hernandez', 'grace.hernandez@university.edu', '789-012-3456', 'Psychology', '2020-02-02', 'Building G, Room 707', 70000.00, 'PSY101', 'Active'),
(8,'Prof. Henry', 'Lopez', 'henry.lopez@university.edu', '890-123-4567', 'History', '2020-03-03', 'Building H, Room 808', 72000.00, 'HIST101', 'Active'),
(9,'Dr. Isabella', 'Gonzalez', 'isabella.gonzalez@university.edu', '901-234-5678', 'Literature', '2020-04-04', 'Building I, Room 909', 74000.00, 'LIT101', 'Active'),
(10,'Prof. Jack', 'Martinez', 'jack.martinez@university.edu', '012-345-6789', 'Art', '2020-05-05', 'Building J, Room 1010', 76000.00, 'ART101', 'Active'),
(11,'Dr. Liam', 'Anderson', 'liam.anderson@university.edu', '123-456-7891', 'Sociology', '2020-06-06', 'Building K, Room 1111', 68000.00, 'SOC101', 'Active'),
(12,'Prof. Mia', 'Thomas', 'mia.thomas@university.edu', '234-567-8902', 'Economics', '2020-07-07', 'Building L, Room 1212', 70000.00, 'ECO101', 'Active'),
(13,'Dr. Noah', 'Taylor', 'noah.taylor@university.edu', '345-678-9013', 'Political Science', '2020-08-08', 'Building M, Room 1313', 72000.00, 'POL101', 'Active'),
(14,'Prof. Olivia', 'Moore', 'olivia.moore@university.edu', '456-789-0124', 'Environmental Science', '2020-09-09', 'Building N, Room 1414', 74000.00, 'ENV101', 'Active'),
(15,'Dr. Paul', 'Jackson', 'paul.jackson@university.edu', '567-890-1235', 'Philosophy', '2020-10-10', 'Building O, Room 1515', 68000.00, 'PHIL101', 'Active'),
(16,'Prof. Quinn', 'White', 'quinn.white@university.edu', '678-901-2346', 'Theater', '2020-11-11', 'Building P, Room 1616', 70000.00, 'THEA101', 'Active'),
(17,'Dr. Riley', 'Harris', 'riley.harris@university.edu', '789-012-3457', 'Music', '2020-12-12', 'Building Q, Room 1717', 72000.00, 'M US101', 'Active'),
(18,'Dr. Sarah', 'King', 'sarah.king@university.edu', '890-123-4568', 'Mathematics', '2021-01-01', 'Building R, Room 1818', 74000.00, 'MATH101', 'Active'),
(19,'Prof. Tom', 'Lee', 'tom.lee@university.edu', '901-234-5679', 'Computer Science', '2021-02-02', 'Building S, Room 1919', 76000.00, 'CS101', 'Active'),
(20,'Dr. Uma', 'Patel', 'uma.patel@university.edu', '012-345-6780', 'Biology', '2021-03-03', 'Building T, Room 2020', 78000.00, 'BIO101', 'Active'),
(21,'Prof. Victor', 'Nguyen', 'victor.nguyen@university.edu', '123-456-7892', 'Physics', '2021-04-04', 'Building U, Room 2121', 80000.00, 'PHYS101', 'Active'),
(22,'Dr. Wendy', 'Carter', 'wendy.carter@university.edu', '234-567-8903', 'Chemistry', '2021-05-05', 'Building V, Room 2222', 82000.00, 'CHEM101', 'Active');

-- Drop Table-----------------------------------------------------------------------------------------
Drop table Instructors;

-- Select all from Table-----------------------------------------------------------------------------------------
select * from Instructors;

-- Select all from instructor where salary is 80000-----------------------------------------------------------------------------------------
Select * from Instructors where salary = 80000;

-- add column in table-----------------------------------------------------------------------------------------
alter table Instructors
add column Salary_Status varchar(100) default 'Paid';

-- Drop column-----------------------------------------------------------------------------------------
alter table Instructors
drop column Salary_Status;

-- Update Department-----------------------------------------------------------------------------------------
Update Instructors
Set Department = 'Computer Networks'
where InstructorID = 8;

-- Again Update Department-----------------------------------------------------------------------------------------
Update Instructors
Set Department = 'History'
Where InstructorID = 8;

-- Delete Query-----------------------------------------------------------------------------------------
Delete From Instructors
Where InstructorID between 3 and 7;

-- Delete any row-----------------------------------------------------------------------------------------
Delete From Instructors
Where Department = 'Biology';

-- Rename Query-----------------------------------------------------------------------------------------
Alter table Instructors
Rename to Instructor;

-- Rename Table-----------------------------------------------------------------------------------------
Alter table Instructor
Rename to Instructors;

-- Addition Operator-----------------------------------------------------------------------------------------
Update Instructors
set Salary = salary + 2000;

-- Subtraction Operator-----------------------------------------------------------------------------------------
Update Instructors
set Salary = Salary - 2000;

-- Multiplication Operator-----------------------------------------------------------------------------------------
Update Instructors
Set Salary = Salary * 2;

-- Divide Operator-----------------------------------------------------------------------------------------
Update Instructors
Set Salary = Salary / 2;

-- Comaprison Operator-----------------------------------------------------------------------------------------
Select * From Instructors where Salary > 80000;

Select * from Instructors where Salary < 80000;

-- Logical Operator-----------------------------------------------------------------------------------------
Select * From Instructors where LastName = 'Smith' and Department = 'Biology';

Select * from Instructors where LastName = 'Smith' or Department = 'Mathematics';

-- Functions-----------------------------------------------------------------------------------------
SELECT length(Email) as Full_length_Email from Instructors; 

SELECT Upper(Email) as upper_Email from Instructors;

-- Joins-----------------------------------------------------------------------------------------
Select Instructors.StudentID , FirstName, OfficeLocation
from Instructors
left join students on Instructors.StudentID = students.studentID;

Select Instructors.StudentID , FirstName, OfficeLocation
from Instructors
inner join students on Instructors.StudentID = students.StudentID;

-- SubQueries-----------------------------------------------------------------------------------------
SELECT FirstName
FROM Instructors
WHERE InstructorID = 
(
	Select InstructorID
    From Instructors
    where InstructorID = 10
);

SELECT FirstName
FROM Instructors
WHERE InstructorID = 
(
	Select InstructorID
    From Instructors
    where InstructorID = 8
);

-- Clauses-----------------------------------------------------------------------------------------
SELECT * FROM Instructors WHERE FirstName = 'Prof.Bob';

SELECT OfficeLocation, COUNT(*) AS NumberOfOfficeLocation FROM Instructors GROUP BY OfficeLocation;

-- Add and drop Constraints-----------------------------------------------------------------------------------------
ALTER TABLE Instructors
ADD CONSTRAINT uq_InstructorID UNIQUE (InstructorID);

ALTER TABLE Instructors
ADD CONSTRAINT chk_HireDate CHECK (HireDate > 0);

set foreign_key_checks = 0;