use zoom;

-- Triggers
/*
Definition of Triggers:
A trigger is a special type of stored procedure in a database that automatically executes (or "fires") 
in response to certain events on a particular table or view. Triggers are used to enforce business rules, 
maintain data integrity, and automate system tasks without requiring explicit calls from applications. 
Triggers are powerful tools in database management, allowing for automated responses to data changes. 
while ensuring data integrity and enforcing business rules.

Key Characteristics of Triggers:

1. Automatic Execution: Triggers are executed automatically when a specified event occurs.
2. Event-Driven: They are associated with specific events such as INSERT, UPDATE, or DELETE.
3. Row-Level or Statement-Level: Triggers can operate on each row affected by the event (row-level)
or once for the entire statement (statement-level).
4. Performance: Triggers can impact performance, especially if they contain complex logic or are
executed frequently.
5. Debugging: Debugging triggers can be challenging, as they execute automatically and may not be visible in 
the application flow.

Types of Triggers :

1. BEFORE Triggers: Executed before the triggering event (e.g., before an INSERT, UPDATE, or DELETE operation).
2. AFTER Triggers: Executed after the triggering event has occurred.
3. INSTEAD OF Triggers(Not Supported in MySQL): Used primarily with views, these triggers execute in place of
the triggering event.

Structure of SQLSTATE

Definition:
the SIGNAL SQLSTATE statement is used to raise custom errors or exceptions within stored procedures, 
triggers, or events. It allows you to define your own error messages and control the flow of execution 
when an unexpected situation occurs.

Format: The SQLSTATE value is a five-character string, where the first two characters represent
the class of the error, and the last three characters provide more specific information about the error.

Classes: The first two characters indicate the general category of the error.

For example:
- 00 indicates successful completion.
- 01 indicates a warning.
- 02 indicates no data found.
- 22 indicates a data exception (e.g., invalid data).
- 45 indicates a user-defined exception.
*/

-- Step 1: Create the Table
CREATE TABLE Accounts (
    AccountID INT AUTO_INCREMENT PRIMARY KEY,
    AccountHolder VARCHAR(100) NOT NULL,
    Balance DECIMAL(10, 2) NOT NULL
);

INSERT INTO Accounts (AccountHolder, Balance) VALUES
('Rahul Sharma', 15000.00),  -- 15,000 INR
('Priya Gupta', 25000.50),   -- 25,000.50 INR
('Amit Verma', 1000.75),     -- 1,000.75 INR
('Sneha Reddy', 50000.00),   -- 50,000 INR
('Vikram Singh', 7500.00);    -- 7,500 INR

SELECT * FROM Accounts;

-- Example 1: BEFORE Trigger
-- Scenario: Preventing negative balances in a bank account.

DELIMITER //
CREATE TRIGGER prevent_negative_balance
BEFORE UPDATE ON Accounts
FOR EACH ROW
BEGIN
    IF NEW.balance < 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Balance cannot be negative';
    END IF;
END;
//DELIMITER ;

UPDATE Accounts SET Balance = -5000.00 WHERE AccountID = 2;  -- This will trigger an error

UPDATE Accounts SET Balance = 20000.00 WHERE AccountID = 3;  -- This will succeed

SELECT * FROM Accounts;

-- Example 2: AFTER Trigger
-- Scenario: Logging changes to an audit table after an account balance is updated.
-- Step 1: Create a table
CREATE TABLE AuditLog (
    log_id INT AUTO_INCREMENT PRIMARY KEY,
    account_id INT,
    old_balance DECIMAL(10, 2),
    new_balance DECIMAL(10, 2),
    change_time DATETIME DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO AuditLog (account_id, old_balance, new_balance) VALUES
(1, 15000.00, 30000.00),  -- Example: Account ID 1 changed from 15000.00 to 30000.00
(2, 25000.50, 20000.00),  -- Example: Account ID 2 changed from 25000.50 to 20000.00
(3, 1000.75, 500.00);      -- Example: Account ID 3 changed from 1000.75 to 500.00

select * from AuditLog;

-- Step 2: Create the Trigger
DELIMITER //
CREATE TRIGGER log_balance_change
AFTER UPDATE ON Accounts
FOR EACH ROW
BEGIN
    INSERT INTO AuditLog (account_id, old_balance, new_balance)
    VALUES (OLD.AccountID, OLD.Balance, NEW.Balance);
END;
//
DELIMITER ;

-- Step 3: Test the Trigger
UPDATE Accounts SET Balance = 200.00 WHERE AccountID = 1;  -- Update the balance of AccountID 1
select * from Accounts;
select * from AuditLog;

UPDATE Accounts SET Balance = 15000000.00 WHERE AccountID = 4;  -- Update the balance of AccountID 1
select * from Accounts;
select * from AuditLog;

-- Example 3: INSTEAD OF Trigger (Not Supported in Mysql)
-- Scenario: Updating a view instead of the underlying table.

DELIMITER //
CREATE VIEW AccountView AS
SELECT account_id, account_holder, balance
FROM Accounts;

CREATE TRIGGER update_account_view
INSTEAD OF UPDATE ON AccountView
FOR EACH ROW
BEGIN
    UPDATE Accounts
    SET balance = NEW.balance
    WHERE account_id = OLD.account_id;
END;
//DELIMITER ;

-- Example 4: BEFORE INSERT Trigger
-- Scenario: Automatically set the creation date for new accounts.

-- Step 1: Ensure the Accounts Table Has a creation_date Column
ALTER TABLE Accounts
ADD COLUMN creation_date DATETIME;

select * from Accounts;

-- Step 2: Create the BEFORE INSERT Trigger
DELIMITER //
CREATE TRIGGER set_creation_date
BEFORE INSERT ON Accounts
FOR EACH ROW
BEGIN
    SET NEW.creation_date = NOW();
END;
//DELIMITER ;

-- Step 3: Test the Trigger
INSERT INTO Accounts (accountid, accountholder, balance)
VALUES (20, 'John Doe', 1000.00);

INSERT INTO Accounts (accountid, accountholder, balance)
VALUES (21, 'Shivam Singh', 1000),
 (22, 'Yash Garud', 12000);
 
select * from Accounts;

-- Example 5: AFTER DELETE Trigger
-- Scenario: Log deletions of accounts to an audit table.
-- Step 1: Create the DeletedAccountsLog Table
CREATE TABLE DeletedAccountsLog (
    log_id INT AUTO_INCREMENT PRIMARY KEY,
    accountid INT,
    accountholder VARCHAR(100),
    deleted_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- Step 2: Create the AFTER DELETE Trigger
DELIMITER //
CREATE TRIGGER log_account_deletion
AFTER DELETE ON Accounts
FOR EACH ROW
BEGIN
    INSERT INTO DeletedAccountsLog (accountid, accountholder)
    VALUES (OLD.accountid, OLD.accountholder);
END;
//
DELIMITER ;

-- Step 3: Test the Trigger
DELETE FROM Accounts WHERE accountid = 20;  -- Replace with an existing account ID
SELECT * FROM DeletedAccountsLog WHERE accountid = 20;  -- Replace with the deleted account ID