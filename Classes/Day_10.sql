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