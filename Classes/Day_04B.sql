-- Create the MNC(Multi National Company) database
create database MNC;

-- Switch to the MNC database
use MNC;

-- Table-1 
-- Create the companies table
-- Create the companies table with additional attributes and constraints
create table companies(
Company_id int auto_increment primary key,
company_name varchar(100) not null,
headquarters_location varchar(100),
established_date date,
industry varchar(50),
revenue decimal(15, 2) check (revenue >= 0), -- Revenue must be non-negative
employee_count int default 0 check (employee_count >= 0), -- Employee count must be non-negative,
website varchar(255) unique, -- Unique website URL for the company,
created_at timestamp default current_timestamp, -- Timestamp for record creation,
updated_at timestamp default current_timestamp on update current_timestamp, -- Timestamp for record updates
unique (company_name)
);

drop table Companies;

-- Insert 10 records 
INSERT INTO Companies (company_name, headquarters_location, established_date, industry, revenue, 
employee_count, website)
VALUES 
('Tata Consultancy Services', 'Mumbai, Maharashtra', '1968-04-01', 'Information Technology', 
20000000000.00, 500000, 'https://www.tcs.com'),
('Reliance Industries Limited', 'Mumbai, Maharashtra', '1960-05-08', 'Conglomerate', 80000000000.00, 200000, 'https://www.ril.com'),
('Infosys', 'Bengaluru, Karnataka', '1981-07-02', 'Information Technology', 13000000000.00, 250000, 'https://www.infosys.com'),
('Wipro', 'Bengaluru, Karnataka', '1945-12-29', 'Information Technology', 8000000000.00, 200000, 'https://www.wipro.com'),
('HDFC Bank', 'Mumbai, Maharashtra', '1994-08-01', 'Banking', 15000000000.00, 120000, 'https://www.hdfcbank.com'),
('ICICI Bank', 'Mumbai, Maharashtra', '1994-01-05', 'Banking', 12000000000.00, 100000, 'https://www.icicibank.com'),
('Bharti Airtel', 'New Delhi', '1995-07-07', 'Telecommunications', 15000000000.00, 30000, 'https://www.airtel.in'),
('State Bank of India', 'Mumbai, Maharashtra', '1955-01-01', 'Banking', 20000000000.00, 250000, 'https://www.sbi.co.in'),
('Hindustan Unilever Limited', 'Mumbai, Maharashtra', '1933-10-17', 'Consumer Goods', 6000000000.00, 40000, 'https://www.hul.co.in'),
('Larsen & Toubro', 'Mumbai, Maharashtra', '1938-02-07', 'Engineering & Construction', 15000000000.00, 50000, 'https://www.larsentoubro.com');

select * from Companies;

-- 1. Select Specific Columns
SELECT company_name, headquarters_location, revenue FROM Companies;

-- 2. Select Companies in a Specific Industry
SELECT * FROM Companies WHERE industry = 'Information Technology';

-- 3. Select Companies with Revenue Greater Than a Certain Amount
SELECT * FROM Companies WHERE revenue > 10000000000.00;

-- 4. Select Companies Established in a Specific Year
SELECT * FROM Companies WHERE YEAR(established_date) = 1994;

--  5. Select Companies Ordered by Revenue in Descending Order
SELECT * FROM Companies ORDER BY revenue DESC;

-- 6. Select Companies with a Specific Headquarters Location
SELECT * FROM Companies WHERE headquarters_location = 'Mumbai, Maharashtra';

-- 7. Select Companies with Employee Count Greater Than a Certain Number
SELECT * FROM Companies WHERE employee_count > 100000;

-- 8. Select Companies Established After a Certain Date
SELECT * FROM Companies WHERE established_date > '2000-01-01';

-- 9. Select Companies with a Revenue Between Two Values
SELECT * FROM Companies WHERE revenue BETWEEN 5000000000.00 AND 20000000000.00;

-- 10. Count the Number of Companies in Each Industry
SELECT industry, COUNT(*) AS company_count FROM Companies GROUP BY industry;
 
 
 /*
 The error message you're encountering indicates the MySQL's "Safe update mode" is enabled.
 This mode prevents you from executing UPDATE or DELETE statements that do not include a WHERE clause that uses a key column (like a primary key). This is a safety feature
 to prevent accidental updates or deletions of all rows in a table.
 */
 
 -- Disable safe updates mode temporarily
 set sql_safe_updates = 0;
 
 set sql_safe_updates = 1; -- Re-name safe updates
 
 -- 2. ALTER QUERIES
  
 -- 1. Add a new column
 alter table companies
 add column stock_symbol varchar(10);
 
-- 2. Modify an Existing column
alter table companies 
modify column revenue decimal(20, 2) check (revenue >= 0);

-- 3. drop a column 
ALTER TABLE Companies 
DROP COLUMN stock_symbol;

-- 4. Rename a Column
ALTER TABLE Companies 
CHANGE COLUMN headquarters_location location VARCHAR(100);

-- 5. Add a Default Value to an Existing Column
ALTER TABLE Companies 
ALTER COLUMN employee_count SET DEFAULT 1;

-- 6. Add a New Column with a Default Value
ALTER TABLE Companies 
ADD COLUMN country VARCHAR(50) DEFAULT 'India';

-- 7. Drop a Column if it Exists
ALTER TABLE Companies 
DROP COLUMN IF EXISTS country;

-- 8. Add a Unique Constraints
alter table companies
add constraint unique_website unique(website);

-- 9. Change the Datatype of a Column
alter table companies
modify column established_date datetime;

-- 10. Add a Foreign Key Constraint
ALTER TABLE Companies 
ADD CONSTRAINT fk_industry FOREIGN KEY (industry) REFERENCES Industries(industry_name);

-- 3. DELETE Queries

-- 1. Delete a specific record
delete from companies
where company_name = 'Wipro';

-- 2. Delete records based on condition
delete from companies
where industry = 'Banking';

-- 3. delete records with Revenue Below a Certain Amount
delete from companies
where revenue < 50000000000.00;

-- 4. Delete Records Established Before a Certain Date
delete from companies
where established_date < '2000-01-01';

-- 5. Delete records with a specific headquarters location
delete from companies
where headquarters_location = 'New Delhi';

-- 6. Delete record with a specific employee count
delete from companies
where employee_count = 0;

-- 7. Delete Records with a Specific Website
delete from companies
where website = 'https://www.hdfcbank.com';

-- 8. Delete Records Based on Multiple Conditions
delete from companies
where industry = 'Telecommunications' and revenue < 10000000000.00;

-- 9. Delete all records (use with caution)
delete from companies;

-- 10. Delete records with a specific name pattern
delete from companies
where company_name like'H%';

-- 4. RENAME Query

-- 1. RENAME the database
alter table companies rename to mnc_companies;

-- 2. RENAME the database 
alter database mnc rename to Multi_National_Comapany; -- We can't rename a database directly it cannot do but the another way to rename a database is drop databse and then rename it.

-- 3. Rename the company_id Column
ALTER TABLE Companies RENAME COLUMN company_id TO id;

-- 4. Rename the company_name Column
ALTER TABLE Companies RENAME COLUMN company_name TO name;

-- 5. Rename the headquarters_location Column
ALTER TABLE Companies RENAME COLUMN headquarters_location TO headquarters;

-- 6. Rename Multiple Columns
ALTER TABLE MultinationalCompanies
RENAME COLUMN industry TO business_sector,
RENAME COLUMN website TO company_website;

-- 5. UPDATE Query

-- 1.Update a Specific Record
UPDATE Companies 
SET revenue = 22000000000.00, employee_count = 520000 
WHERE company_name = 'Tata Consultancy Services';

-- 2.Update Multiple Records
UPDATE Companies 
SET industry = 'Telecom' 
WHERE company_name IN ('Bharti Airtel', 'Reliance Industries Limited');

-- 3. Update Revenue for All Companies in a Specific Industry
UPDATE Companies 
SET revenue = revenue * 1.10 
WHERE industry = 'Banking';

-- 4. Update Employee Count for a Specific Company
UPDATE Companies 
SET employee_count = 210000 
WHERE company_name = 'Wipro';

-- 5. Update Headquarters Location
UPDATE Companies 
SET headquarters_location = 'Gurugram, Haryana' 
WHERE company_name = 'HDFC Bank';

-- 6. Update Established Date
UPDATE Companies 
SET established_date = '1994-01-01' 
WHERE company_name = 'ICICI Bank';

-- 7. Update Website URL
UPDATE Companies 
SET website = 'https://www.infosys.co.in' 
WHERE company_name = 'Infosys';

-- 8. Update Revenue for Companies with Low Employee Count
UPDATE Companies 
SET revenue = 0 
WHERE employee_count < 50000;

-- 9. Update Industry for a Specific Company
UPDATE Companies 
SET industry = 'Consumer Products' 
WHERE company_name = 'Hindustan Unilever Limited';

-- 10. Update Multiple Fields for a Specific Company
UPDATE Companies 
SET revenue = 16000000000.00, industry = 'Construction & Engineering' 
WHERE company_name = 'Larsen & Toubro';

-- Create the Salaries table
CREATE TABLE Salaries (
    salary_id INT AUTO_INCREMENT PRIMARY KEY,
    employee_id INT,
    salary_amount DECIMAL(15, 2) NOT NULL,
    effective_date DATE NOT NULL,
    -- FOREIGN KEY (employee_id) REFERENCES Employees(employee_id),
    UNIQUE (employee_id, effective_date)
);

drop table salaries;

INSERT INTO Salaries (employee_id, salary_amount, effective_date) VALUES
(1, 50000.00, '2024-05-01'),
(2, 60000.00, '2024-01-01'),
(3, 55000.00, '2024-04-01'),
(4, 70000.00, '2024-02-01'),
(5, 65000.00, '2024-08-01'),
(6, 72000.00, '2024-12-01'),
(7, 48000.00, '2024-08-01'),
(8, 58000.00, '2024-01-01'),
(9, 53000.00, '2024-09-01'),
(10, 75000.00, '2024-07-01');

select * from salaries;

-- SELECT Queries

-- 1. Select specific columns
select employee_id, salary_amount, effective_date from salaries;

-- 2. Select employee with a salary_id
select * from salaries where salary_id = 3;

-- 3. Select salary is greater than a certain amount
select * from salaries where salary_amount > 50000.00;

-- 4. select salary with salary amount is between Two values
select * from salaries where salary_amount between 40000.00 and 70000.00;

-- 5. Select salaries ordered by amount in Descending order
select * from salaries order by salary_amount desc;

-- ALTER Queries

-- 1. Add a new column
alter table salaries 
add column employee_gender varchar(20);

-- 2. Drop a column 
alter table salaries 
drop column employee_gender;

-- 3. Rename a column
alter table salaries
change column salary_amount emp_salary decimal(15,2) not null;

-- 4. Add a new column with default values
alter table salaries
add column living_in varchar(30) default 'INDIA'; 

-- 5. change datatype of a column
alter table salaries
modify column effective_date datetime;

-- 3. DELETE Queries

-- 1. Delete a specific record
delete from salaries
where emp_salary = 75000;

-- 2. Delete records based on a condition 
delete from salaries
where effective_date = '2024-01-01';

-- 3. Delete records with emp_salary below a certain amount
delete from salaries
where emp_salary <60000.00;

-- 4. Delete a records before a certain date
delete from salaries
where effective_date < '2024-08-01';

-- 5. Delete record with a specific employee_id
delete from salaries
where employee_id = 6;

-- RENAME Query

-- 1. Rename the salaries table
alter table salaries rename to com_salaries;

-- 2. Rename the effective_date column
alter table salaries rename column effective_date to date;

-- 3. Rename the salary_id column
alter table salaries rename column salary_id to id;

-- 4. Rename the salary_amount column
alter table salaries rename column salary_amount to emp_salary;

-- 5. Rename the employee_id column
alter table salaries rename column employee_id to emp_id;

-- 5. UPDATE Query

-- Disable safe update mode temporarily
set SQL_SAFE_UPDATES = 0;
set SQL_SAFE_UPDATES = 1; -- Re-enable safe mod

use mnc;

select * from companies;

-- 1. Update a specific record 
update companies 
set revenue = 20000000000.00, employee_count = 520000
where company_name = 'Tata Consultancy Services';

-- 2. Update multiple records
update companies
set industry = 'Telecom'
where company_name in ('Bharti Airtel','Reliance Industries Limited');

-- 3. Update revenue for all companies in a specific industry
update companies
set revenue = revenue * 1.10
where industry = 'Banking';

-- 4. Update employee count for specific company
update companies
set employee_count = 210000
where company_name = 'Wipro';

-- 5. Update headquarters location 
update companies
set headquarters_location = 'Gurugram, Haryana'
where company_name = 'HDFC Bank';

-- 6. Update established date 
update companies
set established_date = '1994-01-01'
where company_name = 'ICICI Bank';

-- 7. Update website URL
update companies 
set website = 'https ;//www.infosys.co.in'
where company_name = 'Infosys';

-- 8. Update revenue for companies with low employee count
update companies
set revenue = 0
where employee_count < 50000;

-- 9. Update industry for a specific company
update companies
set industry = 'Consumer Products'
where company_name = 'Hindustan Unilever Limited';

-- 10. Update multiple foelds for a specific company
update companies
set revenue = 16000000000.00, industry = 'Construction & Engineering'
where comapny_name = 'Larsen & Toubro';
