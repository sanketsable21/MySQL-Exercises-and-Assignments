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
-- RETRIEVES RECORDS THAT HAVE MATCHING VALUES IN BOTH TABLES INVOLVED IN THW JOIN.
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