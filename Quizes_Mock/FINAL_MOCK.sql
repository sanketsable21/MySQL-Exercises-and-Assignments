/*
1) CREATE A DATABASE COMPANY AND DO PROPER DOCUMENTATION
2) CREATE 5 TABLES & INSERT 10 RECORDS IN EACH TABLE
3) WRITE QUERIES FOR THE GIVEN SITUATION-
	I) WRITE A QUERY TO DISPLAY EMPLOYEES GROUPED BY THEIR SALARY RANGE(0-20K, 20K-25K)
    II) HOW TO CALCULATE THE PERCENTAGE OF EMPLOYEES IN EACH DEPARTMENT
    III) HOW TO FIND THE AVERAGE SALARY OF TOP 5 HIGHEST PAID EMPLOYEES IN EACH DEPARTMENT
    IV) HOW TO FIND EMPLOYEES WHOSE SALARY IS IN TOP 10%
    V) HOW TO FIND EMPLOYEES WHO WORKS IN BOTH DEPARTMENTS 101 AND 102?
*/
-- CREATE DATABASE
CREATE DATABASE COMPANY1;

-- USE DATABASE
USE COMPANY1;

-- TABLE 1: EMPLOYEES------------------------------------------------------------------------------------------------------------------------------------
-- CREATE EMPLOYEES TABLE
CREATE TABLE EMPLOYEES (
    EMP_ID INT PRIMARY KEY,
    NAME VARCHAR(50),
    AGE INT,
    DEPARTMENT VARCHAR(50),
    SALARY DECIMAL(10,2)
);

-- INSERT RECORDS INTO EMPLOYEES TABLE
INSERT INTO EMPLOYEES VALUES
(1, 'SANKET SABLE', 30, 'IT', 60000.00),
(2, 'YASH GARUD', 28, 'HR', 55000.00),
(3, 'SHIVAM SINGH', 35, 'SALES', 70000.00),
(4, 'ANJALI MALI', 32, 'MARKETING', 65000.00),
(5, 'MUKASHSHAF MOMIN', 40, 'FINANCE', 80000.00),
(6, 'PALAK CHAVAN', 29, 'IT', 62000.00),
(7, 'TEJAS PICHAD', 38, 'HR', 58000.00),
(8, 'RAJ MALI', 33, 'SALES', 72000.00),
(9, 'SUMIT PAGARE', 27, 'MARKETING', 63000.00),
(10, 'PRADEEP YADAV', 31, 'FINANCE', 75000.00);

-- TABLE 2: DEPARTMENTS------------------------------------------------------------------------------------------------------------------------------------
-- CREATE DEPARTMENTS TABLE
CREATE TABLE DEPARTMENTS (
    DEPT_ID INT PRIMARY KEY,
    DEPT_NAME VARCHAR(50),
    LOCATION VARCHAR(50)
);

-- INSERT RECORDS INTO DEPARTMENTS TABLE
INSERT INTO DEPARTMENTS VALUES
(1, 'IT', 'DOMBIVALI'),
(2, 'HR', 'KALYAN'),
(3, 'SALES', 'THANE'),
(4, 'MARKETING', 'AIROLI'),
(5, 'FINANCE', 'MUMBRA'),
(6, 'R&D', 'KOPARKHAIRANI'),
(7, 'SUPPORT', 'KASARA'),
(8, 'LOGISTICS', 'BADLAPUR'),
(9, 'ADMINISTRATION', 'KALYAN'),
(10, 'SECURITY', 'MUMBAI');

-- TABLE 3: PROJECTS------------------------------------------------------------------------------------------------------------------------------------
-- CREATE PROJECTS TABLE
CREATE TABLE PROJECTS (
    PROJ_ID INT PRIMARY KEY,
    PROJ_NAME VARCHAR(50),
    DEPT_ID INT,
    START_DATE DATE,
    END_DATE DATE,
    FOREIGN KEY (DEPT_ID) REFERENCES DEPARTMENTS(DEPT_ID)
);

-- INSERT RECORDS INTO PROJECTS TABLE
INSERT INTO PROJECTS VALUES
(1, 'PROJECT A', 1, '2024-01-01', '2024-06-30'),
(2, 'PROJECT B', 2, '2024-02-15', '2024-08-15'),
(3, 'PROJECT C', 3, '2024-03-01', '2024-09-01'),
(4, 'PROJECT D', 4, '2024-04-10', '2024-10-10'),
(5, 'PROJECT E', 5, '2024-05-05', '2024-11-05'),
(6, 'PROJECT F', 6, '2024-06-01', '2024-12-01'),
(7, 'PROJECT G', 7, '2024-07-07', '2025-01-07'),
(8, 'PROJECT H', 8, '2024-08-08', '2025-02-08'),
(9, 'PROJECT I', 9, '2024-09-09', '2025-03-09'),
(10, 'PROJECT J', 10, '2024-10-10', '2025-04-10');

-- TABLE 4: SALARIES------------------------------------------------------------------------------------------------------------------------------------
-- CREATE SALARIES TABLE
CREATE TABLE SALARIES (
    EMP_ID INT,
    SALARY DECIMAL(10,2),
    BONUS DECIMAL(10,2),
    PAY_DATE DATE,
    PRIMARY KEY (EMP_ID, PAY_DATE),
    FOREIGN KEY (EMP_ID) REFERENCES EMPLOYEES(EMP_ID)
);

-- INSERT RECORDS INTO SALARIES TABLE
INSERT INTO SALARIES VALUES
(1, 60000.00, 5000.00, '2024-03-01'),
(2, 55000.00, 4500.00, '2024-03-01'),
(3, 70000.00, 6000.00, '2024-03-01'),
(4, 65000.00, 5500.00, '2024-03-01'),
(5, 80000.00, 7000.00, '2024-03-01'),
(6, 62000.00, 5200.00, '2024-03-01'),
(7, 58000.00, 4800.00, '2024-03-01'),
(8, 72000.00, 6200.00, '2024-03-01'),
(9, 63000.00, 5300.00, '2024-03-01'),
(10, 75000.00, 6500.00, '2024-03-01');

-- TABLE 5: ATTENDANCE------------------------------------------------------------------------------------------------------------------------------------
-- CREATE ATTENDANCE TABLE
CREATE TABLE ATTENDANCE (
    ATTENDANCE_ID INT PRIMARY KEY,
    EMP_ID INT,
    ATTENDANCE_DATE DATE,
    STATUS VARCHAR(10),
    FOREIGN KEY (EMP_ID) REFERENCES EMPLOYEES(EMP_ID)
);

-- INSERT RECORDS INTO ATTENDANCE TABLE
INSERT INTO ATTENDANCE VALUES
(1, 1, '2024-03-01', 'PRESENT'),
(2, 2, '2024-03-01', 'PRESENT'),
(3, 3, '2024-03-01', 'ABSENT'),
(4, 4, '2024-03-01', 'PRESENT'),
(5, 5, '2024-03-01', 'PRESENT'),
(6, 6, '2024-03-01', 'PRESENT'),
(7, 7, '2024-03-01', 'PRESENT'),
(8, 8, '2024-03-01', 'ABSENT'),
(9, 9, '2024-03-01', 'PRESENT'),
(10, 10, '2024-03-01', 'PRESENT');

-- QUERIES----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- 1) WRITE A QUERY TO DISPLAY EMPLOYEES GROUPED BY THEIR SALARY RANGE(0-20K, 20K-25K)
SELECT 
    CASE 
        WHEN SALARY BETWEEN 0 AND 20000 THEN '0-20K'
        WHEN SALARY BETWEEN 20001 AND 25000 THEN '20K-25K'
        ELSE 'Above 25K'
    END AS SALARY_RANGE,
    COUNT(*) AS EMPLOYEE_COUNT
FROM EMPLOYEES
GROUP BY SALARY_RANGE;

-- 2) HOW TO CALCULATE THE PERCENTAGE OF EMPLOYEES IN EACH DEPARTMENT
SELECT 
    DEPARTMENT,
    COUNT(*) AS EMP_COUNT,
    ROUND((COUNT(*) * 100.0 / (SELECT COUNT(*) FROM EMPLOYEES)), 2) AS PERCENTAGE
FROM EMPLOYEES
GROUP BY DEPARTMENT
ORDER BY PERCENTAGE DESC;

-- 3) HOW TO FIND THE AVERAGE SALARY OF TOP 5 HIGHEST PAID EMPLOYEES IN EACH DEPARTMENT
WITH RankedSalaries AS (
    SELECT 
        DEPARTMENT,
        SALARY,
        DENSE_RANK() OVER (PARTITION BY DEPARTMENT ORDER BY SALARY DESC) AS SalaryRank
    FROM EMPLOYEES
)
SELECT 
    DEPARTMENT,
    ROUND(AVG(SALARY), 2) AS AVERAGE_TOP_5_SALARY
FROM RankedSalaries
WHERE SalaryRank <= 5
GROUP BY DEPARTMENT
ORDER BY AVERAGE_TOP_5_SALARY DESC;

-- 4) HOW TO FIND EMPLOYEES WHOSE SALARY IS IN TOP 10%
WITH RankedEmployees AS (
    SELECT 
        EMP_ID, NAME, SALARY, DEPARTMENT,
        RANK() OVER (ORDER BY SALARY DESC) AS SalaryRank,
        COUNT(*) OVER () AS TotalEmployees
    FROM EMPLOYEES
)
SELECT EMP_ID, NAME, SALARY, DEPARTMENT
FROM RankedEmployees
WHERE SalaryRank <= (TotalEmployees * 0.10)
ORDER BY SALARY DESC;

-- 5) HOW TO FIND EMPLOYEES WHO WORKS IN BOTH DEPARTMENTS 101 AND 102
SELECT EMP_ID, NAME
FROM EMPLOYEES
WHERE DEPARTMENT IN (101, 102)
GROUP BY EMP_ID, NAME
HAVING COUNT(DISTINCT DEPARTMENT) = 2;