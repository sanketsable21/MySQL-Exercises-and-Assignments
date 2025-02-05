-- USE THE NEWLY CREATED DATABASE FOR SUBSEQUENT OPERATIONS
USE DEMOJOINS;

/*
IN MYSQL JOINS ARE USED TO COMBINE ROWS FROM TWO OR MORE TABLES BASED ON A RELATED COLUMN BETWEEN THEM. JOINS ALLOW YOU TO RETRIEVE DATA FROM MULTIPLE TABLES 
IN A SINGLE QUERY, MAKING IT EASIER TO WORK WITH RELATIONAL DATABASES.

1. INNER JOIN:
	- DEFINITION: THE INNER JOIN KEYWORD SELECTS RECORDS THAT HAVE MATCHING VALUES IN BOTH TABLES. 
    - PURPOSE: TO RETRIEVE ONLY THE ROWS WHERE THERE IS A MATCH IN BOTH TABLES, EFFECTIVELY FILTERING OUT NON MATCHING ROWS
    
    - EXAMPLE: 
    SELECT A.EMPLOYEEID, A.NAME, B.DEPARTMENTNAME
    FROM EMPLOYEES A 
    INNER JOIN DEPARTMENTS B ON A.DEPARTMENTID = B.DEPARTMENTID;
    
2. LEFT JOIN ( OR LEFT OUTER JOIN ):
	- DEFINITION: THE LEFT JOIN KEYWORD RETURNS ALL RECORDS FROM THE LEFT TABLE AND THE MATCHED RECORDS FROM THE RIGHT TABLE.
    - PURPOSE: TO RETRIEVE ALL RECORDS FROM THE LEFT TABLE REGARDLESS OF WHETHER THERE IS A MATCH IN THE RIGHT TABLE, ALLOWING FOR NULL 
    VALUES IN THE RESULT SET FOR NON-MATCHING ROWS.
    
    - EXAMPLE:
    SELECT A.EMPLOYEEID, A.NAME, B.DEPARTMENTNAME
    FROM EMPLOYEES A 
    LEFT JOIN DEPARTMENTS B ON A.DEPARTMENTID = B.DEPARTMENTID;
    
3. RIGHT JOIN ( OR RIGHT OUTER JOIN ):
	- DEFINITION: THE RIGHT JOIN KEYWORD RETURNS ALL RECORDS FROM THE RIGHT TABLE AND THE MATCHED RECORDS FROM THE LEFT TABLE.
    - PURPOSE: TO RETRIEVE ALL RECORDS FROM THE RIGHT TABLE REGARDLESS OF WHETHER THERE IS A MATCH IN THE LEFT TABLE, ALLOWING FOR NULL 
    VALUES IN THE RESULT SET FOR NON-MATCHING ROWS.
    
    - EXAMPLE:
    SELECT A.EMPLOYEEID, A.NAME, B.DEPARTMENTNAME
    FROM EMPLOYEES A 
    RIGHT JOIN DEPARTMENTS B ON A.DEPARTMENTID = B.DEPARTMENTID;
    
4. FULL JOIN ( OR OUTER FULL JOIN ):
	- DEFINITION: THE NULL JOIN KEYWORD RETURNS ALL RECORDS WHEN THERE IS A MATCH IN EITHER LEFT OR RIGHT TABLE RECORDS.
    - PURPOSE: TO RETRIEVE ALL RECORDS FROM BOTH TABLES, INCLUDING THOSE THAT DO NOT HAVE MATCHES IN EITHER TABLE. MYSQL DOES NOT SUPPORT FULL 
    JOIN DIRECTLY, BUT IT CAN BE STIMULATED USING A COMBINATION OF LEFT JOIN AND RIGHT JOIN WITH A UNION.
    
    - EXAMPLE:
	SELECT A.EMPLOYEEID, A.NAME, B.DEPARTMENTNAME
    FROM EMPLOYEES A
    LEFT JOIN DEPARTMENTS B ON A.DEPARTMENTID = B.DEPARTMENTID 
    UNION
	SELECT A.EMPLOYEEID, A.NAME, B.DEPARTMENTNAME
    FROM EMPLOYEES A 
    RIGHT JOIN DEPARTMENTS B ON A.DEPARTMENTID = B.DEPARTMENTID;
    
5. LEFT EXCLUSIVE JOIN: 
	- DEFINITION: THIS IS NOT A STANDARD SQL JOIN TYPE, BUT IT CAN BE STIMULATED BY USING A LEFT JOIN AND FILTERING OUT THE MATCHED RECORDS 
    FROM THE RIGHT TABLE
    - PURPOSE: TO RETRIEVE RECORDS FROM THE LEFT TABLE THAT DO NOT HAVE CORRESPONDING RECORDS IN THE RIGHT TABLE.
    
    - EXAMPLE:
    SELECT A.EMPLOYEEID, A.NAME
    FROM EMPLOYEES A
    LEFT JOIN DEPARTMENTS B ON A.DEPARTMENTID = B.DEPARTMENTID
    WHERE B.DEPARTMENTID IS NULL;
    
6. RIGHT EXCLUSIVE JOIN:
	- DEFINITION: SIMILAR TO THE LEFT EXCLUSIVE JOIN, THIS IS NOT A STANDARD SQL JOIN TYPE BUT CAN BE STIMULATED USING A RIGHT JOIN AND FILTERING 
    OUT THE MATCHED RECORDS FROM THE TABLE.
    - PURPOSE: TO RETRIEVE RECORDS FROM THE RIGHT TABLE THAT DO NOT HAVE CORRESPONDING RECORDS IN THE LEFT TABLE.
    
    - EXAMPLE:
    SELECT B.DEPARTMENTID, B.DEPARTMENTNAME
    FROM EMPLOYEES A 
    RIGHT JOIN DEPARTMENTS B ON A.DEPARTMENTID = B.DEPARTMENTID
    WHERE A.EMPLOYEEID IS NULL;
    
7. CROSS JOIN:
	- DEFINITION: THE CROSS JOIN KEYWORD RETURNS THE CARTESIAN PRODUCT OF BOTH TABLES, MEANING IT COMBINES EVERY ROW OF THE FIRST TABLE WITH EVERY ROW OF THE SECOND TABLE
    - PURPOSE: TO GENERATE A COMBINATION of all records from both tables, which can be useful in certain
	scenarios but may result in a large number of rows in the result set.
    
    - Example:
    SELECT a. EmployeeID, b. Department Name
    FROM Employees a
    CROSS JOIN Departments b;
    
8. SELF JOIN:
	- Definition: A SELF JOIN is a regular join but the table is joined with itself.
    - Purpose: To compare rows within the same table, such as finding hierarchical relationships or related
    data within the same dataset.
    
    - Example:
    SELECT a. EmployeeID, a. Name, b. Name AS ManagerName
    FROM Employees a
*/

/*
Subqueries:

Definition:
A subquery, also known as a nested query or inner query, is a query embedded within another SQL query.
It is enclosed in parentheses and can be used in various clauses such as SELECT, INSERT, UPDATE, or DELETE.
Subqueries can return a single value, a single row, or a set of rows.

Purpose:
Subqueries are used to perform operations that require multiple steps or to filter results based on the
results of another query. They can simplify complex queries by breaking them down into smaller,
more manageable parts. Subqueries can also be used to retrieve data that will be used in the main query,
allowing for more dynamic and flexible SQL statements.

Types of Subqueries:
1. Single-row subquery: Returns a single row and can be used with comparison operators.
2. Multiple-row subquery: Returns multiple rows and can be used with operators like IN, ANY, or ALL.
3. Scalar subquery: Returns a single value (one column, one row) and can be used in expressions.

Examples:

1. Single-row subquery:

	- Purpose: To find employees whose salary is greater than the average salary.
    
    SELECT EmployeeID, Name
    FROM Employees
    WHERE Salary > (SELECT AVG(Salary) FROM Employees);
    
2. Multiple-row subquery:

Purpose: To find employees who work in departments with a budget greater than $100,000.

SELECT EmployeeID, Name
FROM Employees
WHERE DepartmentID IN (SELECT DepartmentID FROM Departments WHERE Budget > 100000);

3. Scalar subquery:

Purpose: To find the name of the employee with the highest salary.

SELECT Name
FROM Employees
WHERE Salary = (SELECT MAX(Salary) FROM Employees);

4. Correlated subquery:

Purpose: To find employees whose salary is above the average salary of their respective departments.

SELECT e.EmployeeID, e.Name
FROM Employees e
WHERE e.Salary > (SELECT AVG(Salary) FROM Employees WHERE DepartmentID = e.DepartmentID);

subqueries are a powerful feature in SQL that allow for more complex and dynamic queries by enabling the use 
of the results of one query within another. They can help simplify SQL statements and make them more readable 
and maintainable. 
*/


