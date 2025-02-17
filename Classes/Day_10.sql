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