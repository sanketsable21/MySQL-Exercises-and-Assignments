USE zoom;

-- DCL
/*
Data Control Language (DCL)
Definition:
DCL is used to control access to data in a database. It includes commands that grant or revoke permissions
to users or roles.

Key Commands
GRANT: Gives a user or role permission to perform specific actions on 
database objects (like tables, views, etc.).
REVOKE: Removes previously granted permissions from a user or role.
*/

-- Step 1: Create a sample Emp table
CREATE TABLE Emp (
	id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    position VARCHAR(100) NOT NULL,
    salary DECIMAL (10, 2) NOT NULL
);

-- Step 2: Insert Sample Data into the Emp Table
INSERT INTO Emp (name, position, salary) VALUES
('John Doe', 'Manager', 75000.00),
('Jane Smith', 'Developer', 60000.00),
('Bob Johnson', 'Designer', 50000.00);

-- Step 3: Create a New User
-- Create a new user (this command may require admin privileges)
CREATE USER 'employee_user'@'localhost' IDENTIFIED BY 'password123';

-- Step 4: Grant Permissions to the User
-- Grant SELECT and INSERT permissions on the Emp table to the user
GRANT SELECT, INSERT ON Emp TO 'employee_user'@'localhost';

-- Step 5: Verify Granted Permissions
SELECT *
FROM information_schema.USER_PRIVILEGES
WHERE GRANTEE = "'employee_user'@'localhost'";

-- Step 6: Revoke Permissions from the User
-- Revoke INSERT permission from the user
REVOKE INSERT ON Emp FROM 'employee_user'@'localhost';

-- Step 7: Verify Revoked Permissions
SELECT *
FROM information_schema.USER_PRIVILEGES
WHERE GRANTEE = "'employee_user'@'localhost'";

-- Step 8: Drop the User (Optional)
-- Drop the user
DROP USER 'employee_user'@'localhost';


-- Example 2: Granting Permissions to a Role