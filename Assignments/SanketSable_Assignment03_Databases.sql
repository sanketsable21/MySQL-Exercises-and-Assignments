CREATE DATABASE IF NOT EXISTS LIBRARY_MANAGEMENT_SYSTEM;

USE LIBRARY_MANAGEMENT_SYSTEM;

-- -------------------------------------------------------------TABLE 01-------------------------------------------------------------------

-- BOOKS TABLE
CREATE TABLE BOOKS(
	BOOK_ID INT PRIMARY KEY AUTO_INCREMENT,
    TITLE VARCHAR(255) NOT NULL,
    PUBLISHED_YEAR INT,
    AVAILABLE_COPIES INT DEFAULT 4
);

-- INTSERT INTO BOOKS
INSERT INTO BOOKS ( TITLE, PUBLISHED_YEAR )
VALUES
	('THE PSYCHOLOGY OF MONEY', 2020),
	('RICH DAD POOR DAD', 1997),
	('ATOMIC HABITS', 2018),
	('THE 4-HOUR WORKWEEK', 2007),
	('THINK AND GROW RICH', 1937),
	('DEEP WORK', 2016),
	('THE LEAN STARTUP', 2011),
	('THE MILLIONAIRE FASTLANE', 2011),
	('ZERO TO ONE', 2014),
	('HOW TO WIN FRIENDS AND INFLUENCE PEOPLE', 1936);

DROP TABLE BOOKS;

SET FOREIGN_KEY_CHECKS = 0;

TRUNCATE BOOKS;

SELECT * FROM BOOKS;

SELECT TITLE, AVAILABLE_COPIES FROM BOOKS;

SELECT * FROM BOOKS WHERE PUBLISHED_YEAR = 2011 OR PUBLISHED_YEAR = 2024;

ALTER TABLE BOOKS
ADD COLUMN BOOK_PRICE INT DEFAULT 399;

UPDATE BOOKS 
SET TITLE = 'THE MILLIONAIRE NEXT DOOR'
WHERE BOOK_ID = 8;

DELETE FROM BOOKS 
WHERE BOOK_ID = 9;


-- --------------------------------------------------------------------TABLE 02----------------------------------------------------------------------

-- MEMBERS TABLE
CREATE TABLE MEMBERS(
	MEMBER_ID INT PRIMARY KEY AUTO_INCREMENT,
    FULL_NAME VARCHAR(255),
    EMAIL VARCHAR(255) UNIQUE,
    MOBILE VARCHAR(15),
    ADDRESS VARCHAR(20) DEFAULT 'MUMBAI',
    MEMBERSHIP_DATE TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- INSERT INTO MEMBERS
INSERT INTO MEMBERS( FULL_NAME, EMAIL, MOBILE )
VALUES
	('SANKET SABLE', 'sanketsable123@gmail.com', '8291621013'),
	('YASH GARUD', 'yashgarud123@gmail.com', '8764518965'),
	('ANJALI PATIL', 'anjalipatil123@gmail.com', '7894561230'),
	('MUKASHSHAF MOMIN', 'mukashshafmomin123@gmail.com', '7898521239'),
	('SHIVAM SINGH', 'shivamsingh123@gmail.com', '8524567535'),
	('NUPUR LOTEKAR', 'nupurlotekar123@gmail.com', '7715821977'),
	('ROHIT THORAT', 'rohitthorat123@gmail.com', '8524567531'),
	('KARAN KHEGDE', 'karankhegade123@gmail.com', '9004178250'),
	('TANAY KADAM', 'tanaykadam123@gmail.com', '8541263789'),
	('SOHAM CHUDHARY', 'sohamchaudhary123@gmail.com', '9514562870');

DROP TABLE MEMBERS;

TRUNCATE MEMBERS;

SELECT * FROM MEMBERS;

SELECT FULL_NAME, MEMBERSHIP_DURATION FROM MEMBERS;

SELECT * FROM MEMBERS WHERE MOBILE = 8541263789 AND MOBILE = 8451263879;

ALTER TABLE MEMBERS
ADD COLUMN MEMBERSHIP_DURATION VARCHAR(20) DEFAULT '4 MONTHS';

SET SQL_SAFE_UPDATES = 0; 

UPDATE MEMBERS 
SET FULL_NAME = 'YASH PAWAR' 
WHERE MEMBER_ID = 3 + 4;

DELETE FROM MEMBERS
WHERE EMAIL LIKE '%OTEK%';


-- -------------------------------------------------------------TABLE 03-----------------------------------------------------------------------

-- AUTHORS TABLE
CREATE TABLE AUTHORS(
	AUTHOR_ID INT PRIMARY KEY AUTO_INCREMENT,
    BOOK_ID INT,
    AUTHOR_NAME VARCHAR(255),
    FOREIGN KEY(BOOK_ID) REFERENCES BOOKS(BOOK_ID)
);

-- INSERT INTO AUTHORS
INSERT INTO AUTHORS( BOOK_ID, AUTHOR_NAME )
VALUES 
	(1, 'MORGAN HOUSEL'),
	(2, 'ROBERT KIYOSAKI'),
	(3, 'JAMES CLEAR'),
	(4, 'TIMOTHY FERRISS'),
	(5, 'NEPOLEON HILL'),
	(6, 'CAL NEWPORT'),
	(7, 'ERIC RIES'),
	(8, 'MJ DEMARCO'),
	(9, 'PETER THIEL'),
	(10, 'DALE CARNEGIE');

DROP TABLE AUTHORS;

TRUNCATE AUTHORS;

SELECT * FROM AUTHORS;

SELECT AUTHOR_NAME, EXPERIENCE FROM AUTHORS;

ALTER TABLE AUTHORS
ADD COLUMN EXPERIENCE VARCHAR(30) DEFAULT '11 YEARS';

UPDATE AUTHORS
SET AUTHOR_NAME = 'YASH'
WHERE BOOK_ID = 3-2;

DELETE FROM AUTHORS 
WHERE BOOK_ID = 3;


-- --------------------------------------------------------TABLE 04-------------------------------------------------------------

-- BORROW_RECORDS TABLE	
CREATE TABLE BORROW_RECORDS(
	RECORD_ID INT PRIMARY KEY AUTO_INCREMENT,
    MEMBER_ID INT,
    BOOK_ID INT,
    BORROW_DATE TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    DUE_DATE VARCHAR(20) DEFAULT '21 MARCH 2025',
    FOREIGN KEY (MEMBER_ID) REFERENCES MEMBERS(MEMBER_ID),
    FOREIGN KEY (BOOK_ID) REFERENCES BOOKS(BOOK_ID)
);

-- INSERT INTO BORROW_RECORDS
INSERT INTO BORROW_RECORDS( MEMBER_ID, BOOK_ID)
VALUES
	(1,1),
	(2,2),
	(3,3),
	(4,4),
	(5,5),
	(6,6),
	(7,7),
	(8,8),
	(9,9),
	(10,10);

DROP TABLE BORROW_RECORDS;

TRUNCATE BORROW_RECORDS;

SELECT * FROM BORROW_RECORDS;

SELECT * FROM BORROW_RECORDS ORDER BY BOOK_ID DESC;

ALTER TABLE BORROW_RECORDS
ADD COLUMN RETURN_DATE DATE NULL;

UPDATE BORROW_RECORDS
SET DUE_DATE = '03 APRIL 2025'
WHERE RECORD_ID = 7 / 2 + 0.5;

DELETE FROM BORROW_RECORDS
WHERE DUE_DATE LIKE '%PRI%';


-- ---------------------------------------------------------------TABLE 05-------------------------------------------------------

-- STAFF TABLE
CREATE TABLE STAFF(
	STAFF_ID INT PRIMARY KEY AUTO_INCREMENT,
    FULL_NAME VARCHAR(255),
    STAFF_POSITION VARCHAR(100),
    EMAIL VARCHAR(255) UNIQUE,
    MOBILE VARCHAR(12)
);

-- INSERT INTO STAFF
INSERT INTO STAFF( FULL_NAME, STAFF_POSITION, EMAIL, MOBILE )
VALUES
	('SUMIT PAGARE','LIBRARIAN','sumitpagare123@gmail.com','7894536518'),
	('SNEHA DESAI','ASSISTANT LIBRARIAN','snehadesai123@gmail.com','7539514568'),
	('AMIT SHARMA','CLERK','amitsharma123@gmail.com','8426879317'),
	('PRIYA NAIR','DATA ENTRY OPERATOR','priyanair123@gmail.com','7519531538'),
	('RAJESH GUPTA','LIBRARY ATTENDANT','rajeshgupta123@gmail.com','7715821977'),
	('NEHA JOSHI','BOOK ORGANIZER','nehajoshi123@gmail.com','7447313953'),
	('VIKRAM MALHOTRA','ASSISTANT LIBRARIAN','vikrammalhotra123@gmail.com','9539574568'),
	('ANJALI VERMA','LIBRARY ATTENDANT','anjaliverma123@gmail.com','9892820887'),
	('SURESH KULKARNI','JANITOR','sureshkulkarni123@gmail.com','9356832018'),
	('MEERA IYER','LIBRARIAN','meeraiyer123@gmail.com','9890891719');

DROP TABLE STAFF;

TRUNCATE STAFF;

SELECT * FROM STAFF;

SELECT * FROM STAFF ORDER BY EMAIL ASC;

ALTER TABLE STAFF
ADD COLUMN SALARY VARCHAR(20) DEFAULT '15000';

UPDATE STAFF
SET FULL_NAME = 'RAJAT GOKHALE', EMAIL = 'rajatgokhale123@gmail.com'
WHERE STAFF_ID = 4 ;

DELETE FROM STAFF
WHERE STAFF_ID = 3 * 2;


-- -----------------------------------------------------------TABLE 06---------------------------------------------------------------

-- CATEGORIES TABLE
CREATE TABLE CATEGORIES(
	CATEGORY_ID INT PRIMARY KEY AUTO_INCREMENT,
    CATEGORY_NAME VARCHAR(100)
);

-- INSERT INTO CATEGORIES
INSERT INTO CATEGORIES( CATEGORY_NAME )
VALUES
	('FICTION'),
	('SCIENCE'),
	('HISTORY'),
	('BIOGRAPHY'),
	('SELF-HELP'),
	('TECHNOLOGY'),
	('PHILOSOPHY'),
	('MYSTERY'),
	('FANTASY'),
	('BUSINESS');

DROP TABLE CATEGORIES;

TRUNCATE CATEGORIES;

SELECT * FROM CATEGORIES;

SELECT COUNT(*) AS TOTAL_CATEGORIES FROM CATEGORIES;

ALTER TABLE CATEGORIES
ADD COLUMN TOTAL_EDITION INT DEFAULT 14;

UPDATE CATEGORIES
SET CATEGORY_NAME = 'THRILLER'
WHERE CATEGORY_ID = 6;

DELETE FROM CATEGORIES
WHERE CATEGORY_NAME LIKE '%LL%';


-- -----------------------------------------------------TABLE 07-----------------------------------------------------

-- PUBLISHERS TABLE
CREATE TABLE PUBLISHERS(
	PUBLISHER_ID INT PRIMARY KEY AUTO_INCREMENT,
    PUBLISHER_NAME VARCHAR(255),
    CONTACT_INFO VARCHAR(255)
);

-- INSERT INTO PUBLISHERS
INSERT INTO PUBLISHERS( PUBLISHER_NAME, CONTACT_INFO )
VALUES
	('PENGUIN BOOKS','contact@penguin.com'),
	('HARPERCOLLINS','info@harpercollimns.com'),
	('SIMON & SCHUSTER','support@simonandschuster'),
	('HACHETTE BOOK GROUP','info@hachettebookgroup.com'),
	('MACMILLAN PUBLISHERS','contact@macmillan.com'),
	('OXFORD UNIVARSITY PRESS','support@oup.com'),
	('SCHOLASTIC CORPORATION','info@scholastic.com'),
	('BLOOMSBURY PUBLISHING','support@bloomsbury.com'),
	('RANDOM HOUSE','contact@randomhouse.com'),
	('CENGAGE LEARNING','info@cengage.com');

DROP TABLE PUBLISHERS;

TRUNCATE PUBLISHERS;

SELECT * FROM PUBLISHERS;

SELECT COUNT(*) AS TOTAL_PUBLISHERS FROM PUBLISHERS 
WHERE PUBLISHER_NAME LIKE '%OO%';

ALTER TABLE PUBLISHERS
ADD COLUMN PUBLISHER_ADDRESS VARCHAR(10) DEFAULT 'MUMBAI';

UPDATE PUBLISHERS
SET CONTACT_INFO = 'cengage@info.com'
WHERE PUBLISHER_NAME = 'CENGAGE LEARNING';

DELETE FROM PUBLISHERS
WHERE PUBLISHER_ID = 4;


-- --------------------------------------------------------------TABLE 08------------------------------------------------------

-- FINES TABLE 
CREATE TABLE FINES(
	FINE_ID INT PRIMARY KEY AUTO_INCREMENT,
    MEMBER_ID INT,
    RECORD_ID INT,
    AMOUNT DECIMAL(10,2) NOT NULL,
    PAID BOOLEAN DEFAULT FALSE,
    FOREIGN KEY(MEMBER_ID) REFERENCES MEMBERS(MEMBER_ID),
    FOREIGN KEY(RECORD_ID) REFERENCES BORROW_RECORDS(RECORD_ID)
);

-- INSERT INTO FINES
INSERT INTO FINES (MEMBER_ID, RECORD_ID, AMOUNT, PAID) VALUES
	(1, 1, 50.00, FALSE),
	(2, 2, 30.00, TRUE),
	(3, 3, 75.50, FALSE),
	(4, 4, 20.00, TRUE),
	(5, 5, 100.00, FALSE),
	(6, 6, 45.00, TRUE),
	(7, 7, 60.75, FALSE),
	(8, 8, 80.25, TRUE),
	(9, 9, 90.00, FALSE),
	(10, 10, 25.50, TRUE);
    

DROP TABLE FINES;

TRUNCATE FINES;

SELECT * FROM FINES;

SELECT PAID, COUNT(*) AS TOTAL_FINES FROM FINES GROUP BY PAID;

ALTER TABLE FINES
ADD COLUMN STATUS VARCHAR(20) DEFAULT 'PAID';

ALTER TABLE FINES 
DROP COLUMN PAID;

UPDATE FINES
SET AMOUNT = 90.00
WHERE FINE_ID = 5;

DELETE FROM FINES
WHERE RECORD_ID = 6;


-- -----------------------------------------------------------------TABLE 09---------------------------------------------------

-- LOCATIONS TABLE
CREATE TABLE LOCATIONS(
	LOCATION_ID INT PRIMARY KEY AUTO_INCREMENT,
    SHELF_NUMBER VARCHAR(50),
    FLOOR_NUMBER INT
);


-- INSERT INTO LOCATIONS
INSERT INTO LOCATIONS (SHELF_NUMBER, FLOOR_NUMBER) VALUES
	('A1', 1),
	('B2', 1),
	('C3', 2),
	('D4', 2),
	('E5', 3),
	('F6', 3),
	('G7', 4),
	('H8', 4),
	('I9', 5),
	('J10', 5);
    
DROP TABLE LOCATIONS;

TRUNCATE LOCATIONS;

SELECT * FROM LOCATIONS;

SELECT * FROM LOCATIONS ORDER BY SHELF_NUMBER DESC;

SELECT FLOOR_NUMBER, COUNT(*) AS TOTAL_LOCATIONS FROM LOCATIONS GROUP BY FLOOR_NUMBER HAVING COUNT(*) < 5;

ALTER TABLE LOCATIONS
ADD COLUMN CITY VARCHAR(30) DEFAULT 'MUMBAI';

UPDATE LOCATIONS
SET SHELF_NUMBER = 'R5'
WHERE LOCATION_ID = 3;

DELETE FROM LOCATIONS
WHERE FLOOR_NUMBER = 4;


-- ---------------------------------------------------------------TABLE 10-----------------------------------------------

-- TRANSACTION TABLE
CREATE TABLE TRANSACTIONS (
    TRANSACTION_ID INT PRIMARY KEY AUTO_INCREMENT,
    MEMBER_ID INT,
    AMOUNT_PAID DECIMAL(10,2),
    PAYMENT_DATE TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PAYMENT_METHOD VARCHAR(50),
    FOREIGN KEY (MEMBER_ID) REFERENCES MEMBERS(MEMBER_ID)
);

-- INSERT INTO TRANSACTIONS
INSERT INTO TRANSACTIONS (MEMBER_ID, AMOUNT_PAID, PAYMENT_METHOD) VALUES
	(1, 500.00, 'CASH'),
	(2, 250.50, 'CREDIT CARD'),
	(3, 1200.75, 'DEBIT CARD'),
	(4, 850.25, 'UPI'),
	(5, 999.99, 'NET BANKING'),
	(6, 450.60, 'CASH'),
	(7, 300.30, 'UPI'),
	(8, 780.80, 'DEBIT CARD'),
	(9, 600.40, 'CREDIT CARD'),
	(10, 1100.90, 'CASH');
    
DROP TABLE TRANSACTIONS;

TRUNCATE TRANSACTIONS;

SELECT * FROM TRANSACTIONS;

SELECT COUNT(*) AS TOTAL_TRANSACTIONS FROM TRANSACTIONS;

ALTER TABLE TRANSACTIONS
ADD COLUMN BALANCE VARCHAR(30) DEFAULT 'NONE';

UPDATE TRANSACTIONS
SET AMOUNT_PAID = 1500
WHERE PAYMENT_METHOD LIKE '%AS%';

DELETE FROM TRANSACTIONS
WHERE PAYMENT_METHOD LIKE '%AS%';

