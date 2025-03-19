CREATE DATABASE StudentDB;

USE StudentDB;

CREATE TABLE Students (
	StudentID INT IDENTITY (1,1) PRIMARY KEY,
	FirstName VARCHAR(50) NOT NULL,
	LastName VARCHAR (50) NOT NULL,
	DateOfBirth DATE,
	Email VARCHAR (100) UNIQUE,
	EnrollmentDate DATETIME DEFAULT GETDATE()
);

TRUNCATE TABLE Students;

INSERT INTO Students (FirstName, LastName, DateOfBirth, Email) VALUES
('John', 'Doe', '2000-01-15', 'john.doe@example.com'),
('Jane', 'Smith', '1999-05-22', 'jane.smith@example.com'),
('Emily', 'Johnson', '2001-03-30', 'emily.johnson@example.com'),
('Michael', 'Brown', '1998-12-10', 'michael.brown@example.com'),
('Sarah', 'Davis', '2002-07-25', 'sarah.davis@example.com');


-- QUERIES FOR DML(DATA MANIPULATION LANGUAGE)


-- 1.retrieve all records
SELECT * FROM Students;

-- 2.update data
UPDATE Students 
SET Email = 'updated.jane.smith@example.com' 
WHERE FirstName = 'Jane' AND LastName = 'Smith';

-- 3.delete a record
DELETE FROM Students 
WHERE FirstName = 'John' AND LastName = 'Doe';

-- 4.find students born after 2000
SELECT * FROM Students 
WHERE DateOfBirth > '2000-01-01';

-- 5.count the number of students
SELECT COUNT(*) AS TotalStudents FROM Students;

-- 6.find students enrolled in the last year
SELECT * FROM Students 
WHERE EnrollmentDate >= DATEADD(YEAR, -1, GETDATE());

-- 7.retrieve students sorted by last name
SELECT * FROM Students 
ORDER BY LastName ASC;

-- 8.retrieve unique email addresses
SELECT DISTINCT Email FROM Students;

/*
To enhance the performance of queries on the Students table you created, you can add indexes.
Indexes improve the performance of queries by allowing the database engine to find rows more quickly.

What is Indexing?
Indexing in SQL is like the index of a book. Instead of searching every page, you can quickly find what you need using the index. 

Why Use Indexing?
Faster Searching: Speeds up data retrieval.
Better Performance: Improves query execution.
Efficient Sorting: Helps in sorting data faster

How Does It Work?
Without an index, SQL scans the whole table (slow).
With an index, SQL directly jumps to the relevant data (fast).

Types of Indexes:
1. Primary Index - Automatically created for primary keys.
2. Unique Index - Ensures unique values in a column.
3. Composite Index - Index on multiple columns.
4. Full-Text Index - Helps in searching large text data.
5. Clustered Index - Sorts the table based on the index.
6. Non-Clustered Index - Stores index separately from data.

Basic Example:

Creating an index on a column:

CREATE INDEX idx_customer ON Customers (name);

This makes searching for customer names faster!

Key Points to Remember:

Indexing boosts read operations but slows down write operations (INSERT, UPDATE, DELETE).

Use indexing only on frequently searched columns.

Too many indexes increase storage space and slow down updates.
*/

-- Create indexes
CREATE NONCLUSTERED INDEX IX_Students_LastName ON Students (LastName);
CREATE NONCLUSTERED INDEX IX_Students_FirstName ON Students (FirstName);
CREATE NONCLUSTERED INDEX IX_Students_Email ON Students (Email);
CREATE NONCLUSTERED INDEX IX_Students_Name ON Students (LastName, FirstName);

SELECT * FROM Students;

-- Example 1: Use the IX_Students_Last Name index:
SELECT *
FROM Students
WHERE LastName = 'Smith';

-- Example 2: Use the IX Students_FirstName index:
SELECT *
FROM Students
WHERE FirstName = 'John';

-- If you need to remove an index:
DROP INDEX IX_Students_LastName ON Students;

SELECT TOP 3 *
FROM Students
ORDER BY StudentID;

SELECT *
FROM Students
ORDER BY StudentID
OFFSET 0 ROWS
FETCH NEXT 3 ROWS ONLY;

SELECT *
FROM Students 
ORDER BY StudentID
OFFSET 3 ROWS FETCH NEXT 2 ROWS ONLY;

SELECT * 
FROM Students 
ORDER BY StudentID DESC
OFFSET 0 ROWS 
FETCH NEXT 2 ROWS ONLY;

SELECT * 
FROM Students 
ORDER BY StudentID 
OFFSET 1 ROWS 
FETCH NEXT 4 ROWS ONLY;

SELECT * 
FROM Students 
ORDER BY StudentID 
OFFSET 0 ROWS 
FETCH NEXT 10 ROWS ONLY;