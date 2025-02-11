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

-- Table-1 Faculty
select * from faculty;

-- 1. Find the dean of the faculty with the longest name
SELECT dean
FROM faculty
WHERE faculty_id = 
(
	SELECT faculty_id
    FROM faculty
    ORDER BY LENGTH(faculty_name) DESC
    LIMIT 1
);

SELECT faculty_name
FROM faculty
WHERE faculty_id = 
(	
	SELECT faculty_id
    FROM faculty
    ORDER BY faculty_name ASC
    LIMIT 1 OFFSET 3
);

-- 2. List Faculty Names with Descriptions Containing the word 'science'
SELECT faculty_name
FROM faculty
WHERE faculty_id IN (
	SELECT faculty_id 
    FROM faculty
    WHERE faculty_description LIKE '%science%'
);

SELECT faculty_id 
    FROM faculty
    WHERE faculty_description LIKE '%science%';
    
-- 3. Count the Number of Faculties Located in Buildings Starting with 'Building B'
SELECT COUNT(*)
FROM faculty
WHERE faculty_location IN (
	SELECT faculty_location
    FROM faculty
    WHERE faculty_location LIKE 'Building B%'
);

-- 4. Get the Faculty Name of the Faculty with the Same location as 'Faculty of Arts'
SELECT faculty_name
FROM faculty
WHERE faculty_location = 
(
	SELECT faculty_location
	FROM faculty
	WHERE faculty_name = 'Faculty of Arts'
);

-- 5. Find the Faculty Names with Deans Whose Names Contain the letter 'a'
SELECT faculty_name
FROM faculty
WHERE dean IN (
	SELECT dean
    FROM faculty
    WHERE dean LIKE '%a%'
);


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

select * from department;

-- Table-2 Department

-- 1. Find the Department Head of the Department with the Longest Name
SELECT department_head
FROM department
WHERE department_id = (
	SELECT department_id
    FROM department
    ORDER BY LENGTH(department_name) DESC 
    LIMIT 1
);

-- 2. List Departments Located in the Same Location as 'Department of Physics'
SELECT department_name
FROM department
WHERE department_location = (
	SELECT department_location
    FROM department
    WHERE department_name = 'Department of Physics'
);

-- 3. Count the Number of Departments Headed by 'Dr. Grace Black'
SELECT COUNT(*)
FROM department
WHERE department_head = (
	SELECT department_head
    FROM department
    WHERE department_name = 'Department of Civil Engineering'
);

-- 4. Get the Department Name of the Department with the Same Faculty as 'Department of Computer Science'
SELECT department_name
FROM department
WHERE faculty_id = (
	SELECT faculty_id
    FROM department
    WHERE department_name = 'Department of Computer Science'
);

SELECT faculty_id
    FROM department
    WHERE department_name = 'Department of Computer Science';

-- 5. Find Departments with Descriptions Containing the Word 'engineering'
SELECT department_name
FROM department
WHERE department_id IN (
	SELECT department_id
    FROM department
    WHERE department_description LIKE '%engineering%'
);


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

SELECT * FROM students;

-- table-3 students

-- 1. Find the Names of Students Enrolled in the Same Department as 'Jane Smith'
SELECT student_name
FROM students 
WHERE department_id = (
	SELECT department_id from students where student_name = 'jane smith');
    
-- 2. Count the Number of Students Enrolled in Each Faculty
SELECT faculty_id, COUNT(*) AS student_count
FROM students
GROUP BY faculty_id
HAVING faculty_id IN (
	SELECT faculty_id
    FROM faculty
    WHERE faculty_name LIKE 'Faculty of%'
);

-- 3. Get the Email of the Student with the Latest Enrollment Year in the Same Department as 'Alice Johnson'
SELECT student_email
FROM students
WHERE enrollment_year = (
	SELECT MAX(enrollment_year)
	FROM students
	WHERE department_id = (
		SELECT department_id
		FROM students
		WHERE student_name = 'Alice Johnson'
	)
);

select * from students;


-- 4. List Students Who Are in Departments with More Than 2 Students
SELECT student_name
FROM students
WHERE department_id IN (
	SELECT department_id
    FROM students
    GROUP BY department_id
    HAVING COUNT(*) > 2
);

-- 5. Find Students Who Are in the Same Faculty as 'Bob Brown' but Enrolled in a Different Year
SELECT student_name
FROM students
WHERE faculty_id = (
	SELECT faculty_id
    FROM students
    WHERE student_name = 'Bob Brown'
) AND enrollment_year <> (
	SELECT enrollment_year
    FROM students
    WHERE student_name = 'Bob Brown'
);

-- write 5-5 subqueries for remaining 2 tables


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

SELECT * FROM salary;

-- 1st Query
SELECT payment_date
FROM salary
WHERE amount IN(
	SELECT amount 
    FROM salary
    WHERE amount = 72000
);

-- 2nd Query
SELECT department_id
FROM salary
WHERE salary_id IN(
	SELECT faculty_id
    FROM salary
    WHERE faculty_id > 2 and faculty_id < 4
);

-- 3rd Query
SELECT salary_id
FROM salary
WHERE amount IN(
	SELECT amount
    FROM salary
    WHERE amount LIKE '%72000%'
);

-- 4th Query
SELECT faculty_id
FROM salary
WHERE department_id IN(
	SELECT salary_id
    FROM salary
    WHERE salary_id > 4 and salary_id <= 5
);

-- 5th Query
SELECT amount 
FROM salary
WHERE payment_date IN(
	SELECT payment_date
    FROM salary
    WHERE payment_date = '2023-01-15'
);    

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

SELECT * FROM marks;

-- 1st Query
SELECT subject_name 
FROM marks
WHERE marks_obtained IN(
	SELECT marks_obtained
    FROM marks
    WHERE marks_id = 5
);

-- 2nd Query
SELECT marks_obtained
FROM marks
WHERE semester = (
	SELECT semester
    FROM marks 
    WHERE marks_id = 1 
);

-- 3rd Query
SELECT student_id
FROM marks
WHERE semester = (
	SELECT semester 
    FROM marks
    WHERE marks_id = 1
);

