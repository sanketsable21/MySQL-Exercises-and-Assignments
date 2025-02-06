-- CREATE A NEW DATABASE NAME 'DEMOJOINS'
CREATE DATABASE DEMOJOINS;

-- USE THE NEWLY CREATE DATABASE FOR SUBSEQUENT OPERATIONS
USE DEMOJOINS;

-- CREATE A TABLE NAMED 'STUDENTS' WITH AN ID AND NAME
CREATE TABLE STUDENT(
	ID INT PRIMARY KEY, -- 'ID' IS THE PRIMARY KEY AND MUST BE UNIQUE
    STUDENT_NAME VARCHAR(50) -- 'STUDENT NAME' CAN HOLD UP 50 CHARACTERS
);

-- INSERT RECORDS INTO THE 'STUDENT' TABLE
INSERT INTO STUDENT VALUES
(101, 'KIRTI'), -- ID 101 IS FOR STUDENT KIRTI
(102, 'RAVI'), -- ID 102 IS FOR STUDENT RAVI
(103, 'LAVISH'),-- ID 103 IS FOR STUDENT LAVISH
(104, 'TRISHA'); -- ID 104 IS FOR STUDENT TRISHA

-- RETRIEVE ALL RECORDS FROM THE 'STUDENT' TABLE 
SELECT * FROM STUDENT;

-- CREATE A TABLE NAMED 'COURSE' WITH AN ID AND COURSE NAME
CREATE TABLE COURSE(
	ID INT PRIMARY KEY, -- 'ID' IS THE PRIMARY KEY AND MUST BE UNIQUE
    COURSE_NAME VARCHAR(50) -- 'STUDENT NAME' CAN HOLD UP 80 CHARACTERS
);

-- INSERT RECORD INTO THE COURSE TABLE
INSERT INTO COURSE VALUES
(107, 'ENGLISH'), -- ID 107 FOR COURSE ENGLISH
(102, 'PYTHON'), -- ID 102 FOR COURSE PYTHON
(104, 'HINDI'), -- ID 104 FOR COURSE HINDI
(108, 'MATHS'); -- ID 108 FOR COURSE MATHS

-- RETRIEVE ALL RECORDS FROM THE 'COURSE' TABLE 
SELECT * FROM COURSE;	

-- INNER JOIN (ALSO KNOWN AS SIMPLE JOIN / EQUI JOIN):
-- RETRIEVES RECORDS THAT HAVE MATCHING VALUES IN BOTH TABLES INVOLVED IN THE JOIN.
-- RETRIEVE RECORDS WITH MATCHING IDS FROM BOTH TABLES
SELECT STUDENT.ID, STUDENT_NAME, COURSE_NAME
FROM STUDENT
INNER JOIN COURSE ON STUDENT.ID = COURSE.ID;

SELECT * FROM STUDENT;

-- LEFT JOIN (ALSO KNOWN AS LEFT OUTER JOIN)
-- RETRIEVES ALL RECORDS FROM THE LEFT TABLE AND THE MATCHED RECORDS FROM THE RIGHT TABLE.
-- RETRIEVE ALL RECORDS FROM 'STUDENT' AND MATCHING RECORD FROM 'COURSE'
SELECT STUDENT.ID, STUDENT_NAME, COURSE_NAME
FROM STUDENT
LEFT JOIN COURSE ON STUDENT.ID = COURSE.ID;

-- RIGHT JOIN (ALSO KNOWN AS RIGHT OUTER JOIN):
-- RETRIEVES ALL DATA FROM RIGHT TABLE AND THE MATCHED RECORD FROM THE LEFT TABLE
-- RETRIEVE ALL RECORDS FROM 'COURSE' AND MATCHING RECORDS FROM 'STUDENT'
SELECT COURSE.ID, STUDENT_NAME, COURSE_NAME
FROM STUDENT
RIGHT JOIN COURSE ON STUDENT.ID = COURSE.ID;

-- FULL JOIN (ALSO KNOWN AS FULL OUTER JOIN):
-- IT RETRIEVES ALL RECORDS FROM BOTH TABLES, MATCHING ROWS WHERE POSSIBLE, AND FILLING IN NULL VALUES WHERE
-- THERE ARE NO MATCHES.
-- RETRIEVE ALL RECORDS FROM BOTH TABLES, WITH NULLS WHERE THERE ARE NO MATCHES
SELECT STUDENT.ID, STUDENT_NAME, COURSE_NAME
FROM STUDENT
LEFT JOIN COURSE ON STUDENT.ID = COURSE.ID
UNION
SELECT STUDENT.ID, STUDENT_NAME, COURSE_NAME 
FROM STUDENT
RIGHT JOIN COURSE ON STUDENT.ID = COURSE.ID;

-- LEFT EXCLUSIVE JOIN (ALSO KNOWN AS LEFT ANTI JOIN):
-- RETRIEVES ROWS FROM THE LEFT TABLE THAT DO NOT HAVE MATCHING ROWS IN THE RIGHT TABLE.
-- RETRIEVE RECORDS FROM 'STUDENTS' THAT DO NOT HAVE MATHCES IN 'COURSE'
SELECT STUDENT.ID, STUDENT_NAME, COURSE_NAME
FROM STUDENT
LEFT JOIN COURSE ON STUDENT.ID = COURSE.ID
WHERE COURSE.ID IS NULL;

-- RIGHT EXCLUSIVE JOIN (ALSO KNOWN AS RIGHT ANTI JOIN):
-- RETRIEVES ROWS FROM THE RIGHT TABLE THAT DO NOT HAVE MATHING ROWS IN THE LEFT TABLE.
--  RETRIEVE RECORDS FROM 'COURSE' THAT DO NOT HAVE MATCHES IN 'STUDENT'
SELECT STUDENT.ID, STUDENT_NAME, COURSE_NAME
FROM STUDENT
RIGHT JOIN COURSE ON STUDENT.ID = COURSE.ID
WHERE STUDENT.ID IS NULL;

-- Self Join: (Inner Self Join/Outer Self Join/Self-Reference Join/Self-Relating Join/Table Self Join)
-- Self Join is a special case of a join that allows a table to be joined with itself.
-- Join the 'student' table with itself based on matching IDs
SELECT STUDENT.ID, STUDENT_NAME, COURSE_NAME
FROM STUDENT, COURSE
WHERE STUDENT.ID = COURSE.ID;

-- Cross Join: (also known as a Cartesian Join or Cartesian Product Join)                           
-- A Cross Join retrieves the Cartesian product of two tables, meaning every row from the first table is
-- combined with every row from the second table.
-- Retrieve the Cartesian product of 'student' and 'course' tables
SELECT STUDENT.ID, STUDENT_NAME, COURSE_NAME
FROM STUDENT
CROSS JOIN COURSE;

-- Table-1
-- Create the faculty table to store information about faculty members
CREATE TABLE faculty (
  faculty_id INT PRIMARY KEY, -- Unique identifier for each faculty
  faculty_name VARCHAR(255), -- Name of the faculty
  faculty_description TEXT, -- Description of the faculty
  dean VARCHAR(255), -- Dean of the faculty
  faculty_location VARCHAR(255), -- Location of the faculty
  faculty_contact_info VARCHAR(255) -- Contact information for the faculty
);

-- Insert sample data into the faculty table
INSERT INTO faculty (faculty_id, faculty_name, faculty_description, dean, faculty_location, faculty_contact_info) VALUES
(1, 'Faculty of Science', 'Covers various scientific disciplines', 'Dr. Alice Smith', 'Building A', 'alice.smith@example.com'),
(2, 'Faculty of Engineering', 'Focuses on engineering and technology', 'Dr. Bob Johnson', 'Building B', 'bob.johnson@example.com'),
(3, 'Faculty of Arts', 'Includes humanities and social sciences', 'Dr. Carol Williams', 'Building C', 'carol.williams@example.com'),
(4, 'Faculty of Business', 'Offers business and management courses', 'Dr. David Brown', 'Building D', 'david.brown@example.com'),
(5, 'Faculty of Education', 'Dedicated to teacher training and education studies', 'Dr. Eva Davis', 'Building E', 'eva.davis@example.com');


SELECT faculty.faculty_id, faculty_name, department_name
FROM faculty
INNER JOIN department ON faculty.faculty_id = department.department_id;

-- Table-2
-- Create the department table to store information about departments within faculties
CREATE TABLE department (
  department_id INT PRIMARY KEY, -- Unique identifier for each department
  department_name VARCHAR(255), -- Name of the department
  department_description TEXT, -- Description of the department
  faculty_id INT, -- Foreign key referencing the faculty
  department_head VARCHAR(255), -- Head of the department
  department_location VARCHAR(255), -- Location of the department
  FOREIGN KEY (faculty_id) REFERENCES faculty(faculty_id) -- Establishing relationship with faculty
);

-- Insert sample data into the department table
INSERT INTO department (department_id, department_name, department_description, faculty_id, department_head, department_location) VALUES
(1, 'Department of Physics', 'Study of matter and energy', 1, 'Dr. Emily White', 'Room 101'),
(2, 'Department of Computer Science', 'Focus on computing and programming', 1, 'Dr. Frank Green', 'Room 102'),
(3, 'Department of Civil Engineering', 'Deals with infrastructure and construction', 2, 'Dr. Grace Black', 'Room 201'),
(4, 'Department of Mechanical Engineering', 'Focus on machinery and mechanics', 2, 'Dr. Henry Blue', 'Room 202'),
(5, 'Department of History', 'Study of past events and societies', 3, 'Dr. Irene Red', 'Room 301');


-- Table-3
-- Create the students table to store information about students
CREATE TABLE students (
  student_id INT PRIMARY KEY, -- Unique identifier for each student
  student_name VARCHAR(255), -- Name of the student
  student_email VARCHAR(255), -- Email of the student
  department_id INT, -- Foreign key referencing the department
  enrollment_year INT, -- Year of enrollment
  faculty_id INT, -- Foreign key referencing the faculty
  FOREIGN KEY (department_id) REFERENCES department(department_id), -- Establishing relationship with department
  FOREIGN KEY (faculty_id) REFERENCES faculty(faculty_id) -- Establishing relationship with faculty
);

-- Insert sample data into the students table
INSERT INTO students (student_id, student_name, student_email, department_id, enrollment_year, faculty_id) VALUES
(1, 'John Doe', 'john.doe@example.com', 1, 2021, 1),
(2, 'Jane Smith', 'jane.smith@example.com', 2, 2020, 1),
(3, 'Alice Johnson', 'alice.johnson@example.com', 1, 2022, 1),
(4, 'Bob Brown', 'bob.brown@example.com', 3, 2021, 2),
(5, 'Charlie Davis', 'charlie.davis@example.com', 4, 2023, 2);


-- Table-4
-- Create the salary table to store salary information for faculty members
CREATE TABLE salary (
  salary_id INT PRIMARY KEY, -- Unique identifier for each salary record
  faculty_id INT, -- Foreign key referencing the faculty
  amount DECIMAL(10, 2), -- Salary amount
  payment_date DATE, -- Date of salary payment
  FOREIGN KEY (faculty_id) REFERENCES faculty(faculty_id) -- Establishing relationship with faculty
);

-- Insert sample data into the salary table
INSERT INTO salary (salary_id, faculty_id, amount, payment_date) VALUES
(1, 1, 75000.00, '2023-01-15'),
(2, 2, 80000.00, '2023-01-15'),
(3, 3, 70000.00, '2023-01-15'),
(4, 4, 72000.00, '2023-01-15'),
(5, 5, 68000.00, '2023-01-15');

SELECT students.student_id, student_name, student_email, marks_obtained, semester
FROM students
INNER JOIN marks on students.student_id = marks.student_id;

-- Table-5
-- Create the marks table to store marks obtained by students
CREATE TABLE marks (
  marks_id INT PRIMARY KEY, -- Unique identifier for each marks record
  student_id INT, -- Foreign key referencing the student
  subject_name VARCHAR(255), -- Name of the subject
  marks_obtained INT, -- Marks obtained by the student
  semester INT, -- Semester in which the marks were obtained
  FOREIGN KEY (student_id) REFERENCES students(student_id) -- Establishing relationship with students
);

-- Insert sample data into the marks table
INSERT INTO marks (marks_id, student_id, subject_name, marks_obtained, semester) VALUES
(1, 1, 'Physics', 85, 1),
(2, 1, 'Mathematics', 90, 1),
(3, 2, 'Computer Science', 88, 2),
(4, 3, 'Physics', 92, 1),
(5, 4, 'Civil Engineering', 75, 2),
(6, 5, 'Business Management', 80, 1);

-- INNER JOIN (ALSO KNOWN AS SIMPLE JOIN / EQUI JOIN):
-- RETRIEVES RECORDS THAT HAVE MATCHING VALUES IN BOTH TABLES INVOLVED IN THE JSON.

-- JOIN 2 TABLES 
SELECT FACULTY.FACULTY_ID, FACULTY_NAME, STUDENT_NAME
FROM STUDENTS
INNER JOIN FACULTY ON STUDENTS.FACULTY_ID = FACULTY.FACULTY_ID;

-- JOIN 2 TABLES
SELECT FACULTY.*, STUDENT_NAME
FROM STUDENTS
INNER JOIN FACULTY ON STUDENTS.FACULTY_ID = FACULTY.FACULTY_ID;

-- JOIN 3 TABLES
SELECT T1.FACULTY_ID, FACULTY_NAME, DEPARTMENT_NAME, STUDENT_NAME
FROM STUDENTS AS T1
INNER JOIN FACULTY AS T2 ON T1.FACULTY_ID = T2.FACULTY_ID
INNER JOIN DEPARTMENT AS T3 ON T2.FACULTY_ID = T3.FACULTY_ID;

-- join 4 tables
SELECT s.STUDENT_NAME, m.SUBJECT_NAME, m.MARKS_OBTAINED, d.DEPARTMENT_NAME, f.FACULTY_NAME
FROM MARKS m
INNER JOIN STUDENTS s ON m.STUDENT_ID = s.STUDENT_ID
INNER JOIN DEPARTMENT d ON s.DEPARTMENT_ID = d.DEPARTMENT_ID
INNER JOIN FACULTY f ON d.FACULTY_ID = f.FACULTY_ID;

SELECT F.FACULTY_NAME, S.AMONT, D.DEPARTMENT_NAME, ST.STUDENT_NAME
FROM SALARY S
INNER JOIN FACULTY F ON S.FACULTY_ID = F.FACULTY_ID
INNER JOIN DEPARTMENT D ON F.FACULTY_ID = D.FACULTY_ID
INNER JOIN STUDENTS S1 ON D.DEPARTMENT_ID = ST.DEPARTMENT_ID;