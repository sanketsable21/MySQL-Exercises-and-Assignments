-- Create the Hospital Database
CREATE DATABASE HospitalDB;
USE HospitalDB;

-- Create a Patients Table
CREATE TABLE Patients (
    PatientID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Age INT,
    Gender ENUM('Male', 'Female', 'Other'),
    ContactNumber VARCHAR(15),
    Address TEXT
);

-- Insert records into Patients table
INSERT INTO Patients (FirstName, LastName, Age, Gender, ContactNumber, Address) VALUES
('Rahul', 'Sharma', 30, 'Male', '9876543210', 'Mumbai'),
('Priya', 'Singh', 25, 'Female', '9876543211', 'Delhi'),
('Amit', 'Kumar', 40, 'Male', '9876543212', 'Chennai'),
('Neha', 'Verma', 35, 'Female', '9876543213', 'Pune'),
('Raj', 'Patel', 50, 'Male', '9876543214', 'Ahmedabad');

-- SELECT QUERY 
SELECT * FROM Patients;

-- Create a Doctors Table
CREATE TABLE Doctors (
    DoctorID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Specialization VARCHAR(50),
    ContactNumber VARCHAR(15),
    ExperienceYears INT
);

-- Insert records into Doctors table
INSERT INTO Doctors (FirstName, LastName, Specialization, ContactNumber, ExperienceYears) VALUES
('Dr. Anil', 'Mehta', 'Cardiologist', '9999999991', 15),
('Dr. Ramesh', 'Sharma', 'Neurologist', '9999999992', 10),
('Dr. Sunita', 'Joshi', 'Dermatologist', '9999999993', 8),
('Dr. Alok', 'Verma', 'Orthopedic', '9999999994', 12),
('Dr. Preeti', 'Rao', 'Pediatrician', '9999999995', 7);

-- SELECT QUERY
SELECT * FROM Doctors;


-- Queries
-- 1. Alter table to add a new column
ALTER TABLE Patients ADD COLUMN Email VARCHAR(100);

-- 2. Modify column type
ALTER TABLE Patients MODIFY COLUMN ContactNumber VARCHAR(20);

-- 3. Drop a column
ALTER TABLE Doctors DROP COLUMN ExperienceYears;

-- 4. Rename table
ALTER TABLE Doctors RENAME TO MedicalStaff;

-- 5. Drop a table
DROP TABLE IF EXISTS MedicalStaff;

-- 6. Create an index it is used to return the result fast
CREATE INDEX idx_lastname ON Patients (LastName);

-- 7. Drop an index
DROP INDEX idx_lastname ON Patients;

-- 8. Create a unique constraint
ALTER TABLE Patients ADD CONSTRAINT unique_contact UNIQUE (ContactNumber);

-- 9. Create a check constraint
ALTER TABLE Patients ADD CONSTRAINT check_age CHECK (Age >= 0);

-- 10. Drop the database
DROP DATABASE IF EXISTS HospitalDB;

-- 11. Select all records
SELECT * FROM Patients;

-- 12. Select specific columns
SELECT FirstName, LastName FROM Doctors;

-- 13. Select patients above age 30
SELECT * FROM Patients WHERE Age > 30;

-- 14. Select unique gender values
SELECT DISTINCT Gender FROM Patients;

-- 15. Update patient age
UPDATE Patients 
SET Age = 32 
WHERE PatientID = 3;

-- 16. Update doctor specialization
UPDATE Doctors 
SET Specialization = 'General Physician' 
WHERE DoctorID = 2;

-- 17. Delete a patient record
DELETE FROM Patients 
WHERE PatientID = 5;

-- 18. Delete a doctor record
DELETE FROM Doctors 
WHERE DoctorID = 4;


-- Clause & Operators
-- 1. WHERE clause
SELECT * FROM Patients WHERE Age > 30;

-- 2. LIKE operator
SELECT * FROM Doctors WHERE FirstName LIKE 'D%';

-- 3. IN operator
SELECT * FROM Patients WHERE Age IN (25, 30, 50);

-- 4. NOT IN operator
SELECT * FROM Patients WHERE Age NOT IN (25, 30, 50);

-- 5. BETWEEN operator
SELECT * FROM Patients WHERE Age BETWEEN 30 AND 40;

-- 6. ORDER BY
SELECT * FROM Patients ORDER BY LastName DESC;

-- 7. GROUP BY
SELECT Gender, COUNT(*) FROM Patients GROUP BY Gender;

-- 8. HAVING clause
SELECT Gender, COUNT(*) FROM Patients GROUP BY Gender HAVING COUNT(*) > 1;

-- 9. LIMIT clause
SELECT * FROM Doctors LIMIT 2;

-- 10. UNION
SELECT FirstName FROM Patients UNION SELECT FirstName FROM Doctors;


-- Functions
-- 1. Get total number of patients
SELECT COUNT(*) FROM Patients;

-- 2. Get average age of patients
SELECT AVG(Age) FROM Patients;

-- 3. Get maximum age
SELECT MAX(Age) FROM Patients;

-- 4. Get minimum age
SELECT MIN(Age) FROM Patients;

-- 5. Get sum of all patient ages
SELECT SUM(Age) FROM Patients;


-- User define function
-- 1. To get full name of patient
DELIMITER //
CREATE FUNCTION GetFullName(PID INT) RETURNS VARCHAR(100)
DETERMINISTIC
BEGIN
    DECLARE FullName VARCHAR(100);
    SELECT CONCAT(FirstName, ' ', LastName) INTO FullName 
    FROM Patients WHERE PatientID = PID;
    RETURN FullName;
END //
DELIMITER ;

-- Calling the function
SELECT GetFullName(2);

-- 2. To calculate average age of patient
DELIMITER //
CREATE FUNCTION GetAveragePatientAge() RETURNS DECIMAL(5,2)
DETERMINISTIC
BEGIN
    DECLARE avgAge DECIMAL(5,2);
    SELECT AVG(Age) INTO avgAge FROM Patients;
    RETURN avgAge;
END //
DELIMITER ;

-- Calling the function
SELECT GetAveragePatientAge();

-- 3. To count number of patients based on gender
DELIMITER //
CREATE FUNCTION GetPatientCountByGender(pGender VARCHAR(10)) RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE totalCount INT;
    SELECT COUNT(*) INTO totalCount FROM Patients WHERE Gender = pGender;
    RETURN totalCount;
END //
DELIMITER ;

-- Calling the function
SELECT GetPatientCountByGender('Male');

-- 4. Check if doctor exists
DELIMITER //
CREATE FUNCTION DoctorExists(DID INT) RETURNS VARCHAR(3)
DETERMINISTIC
BEGIN
    DECLARE existsCount INT;
    SELECT COUNT(*) INTO existsCount FROM Doctors WHERE DoctorID = DID;
    
    IF existsCount > 0 THEN
        RETURN 'Yes';
    ELSE
        RETURN 'No';
    END IF;
END //
DELIMITER ;

-- Calling the function
SELECT DoctorExists(5);

-- 5. Get specialization of doctor -- this gives an error------------------------------------------------------------------------------------------------
DELIMITER //
CREATE FUNCTION GetDoctorSpecialization(DID INT) RETURNS VARCHAR(50)
DETERMINISTIC
BEGIN
    DECLARE specialization VARCHAR(50);
    SELECT Specialization INTO specialization FROM Doctors WHERE DoctorID = DID;
    RETURN specialization;
END //
DELIMITER ;

-- Calling the function
SELECT GetDoctorSpecialization(2);


-- Joins & Alias
-- 1. INNER JOIN
SELECT Patients.FirstName, Doctors.FirstName AS Doctor FROM Patients 
JOIN Doctors ON Patients.PatientID = Doctors.DoctorID;

-- 2. LEFT JOIN
SELECT Patients.FirstName, Doctors.FirstName AS Doctor FROM Patients 
LEFT JOIN Doctors ON Patients.PatientID = Doctors.DoctorID;

-- 3. RIGHT JOIN
SELECT Patients.FirstName, Doctors.FirstName AS Doctor FROM Patients 
RIGHT JOIN Doctors ON Patients.PatientID = Doctors.DoctorID;

-- 4. Using ALIAS
SELECT FirstName AS Patient_Name FROM Patients;

-- 5. Using SELF JOIN
SELECT A.FirstName AS Patient1, B.FirstName AS Patient2 FROM Patients A, Patients B WHERE A.PatientID <> B.PatientID;


-- Create table appointments
CREATE TABLE Appointments (
    AppointmentID INT PRIMARY KEY AUTO_INCREMENT,
    PatientID INT,
    DoctorID INT,
    AppointmentDate DATE,
    Status VARCHAR(20) CHECK (Status IN ('Scheduled', 'Completed', 'Cancelled')),
    BillAmount DECIMAL(10,2),
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID),
    FOREIGN KEY (DoctorID) REFERENCES Doctors(DoctorID)
);

SET FOREIGN_KEY_CHECKS = 0;

INSERT INTO Appointments (PatientID, DoctorID, AppointmentDate, Status, BillAmount)
VALUES 
(1, 101, '2024-02-01', 'Completed', 5000.00),
(2, 102, '2024-02-10', 'Scheduled', 3000.00),
(3, 103, '2024-02-15', 'Cancelled', 0.00),
(4, 104, '2024-02-20', 'Completed', 7500.00),
(5, 105, '2024-02-25', 'Completed', 12000.00),
(6, 101, '2024-03-01', 'Scheduled', 4500.00),
(7, 103, '2024-03-05', 'Completed', 6800.00),
(8, 102, '2024-03-10', 'Completed', 5500.00),
(9, 104, '2024-03-15', 'Scheduled', 4000.00),
(10, 105, '2024-03-20', 'Cancelled', 0.00);

-- Retrive data from Appointments
SELECT * FROM Appointments;

-- Create table billing
CREATE TABLE Billing (
    BillID INT PRIMARY KEY AUTO_INCREMENT,
    PatientID INT,
    AppointmentID INT,
    BillDate DATE,
    BillAmount DECIMAL(10,2),
    PaymentStatus VARCHAR(20) CHECK (PaymentStatus IN ('Paid', 'Unpaid', 'Pending')),
    PaymentMethod VARCHAR(20),
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID),
    FOREIGN KEY (AppointmentID) REFERENCES Appointments(AppointmentID)
);

-- Insert value in billing
INSERT INTO Billing (PatientID, AppointmentID, BillDate, BillAmount, PaymentStatus, PaymentMethod)
VALUES 
(1, 1, '2024-02-01', 5000.00, 'Paid', 'Credit Card'),
(2, 2, '2024-02-10', 3000.00, 'Paid', 'Cash'),
(3, 3, '2024-02-15', 0.00, 'Unpaid', 'N/A'),
(4, 4, '2024-02-20', 7500.00, 'Paid', 'Debit Card'),
(5, 5, '2024-02-25', 12000.00, 'Pending', 'Bank Transfer'),
(6, 6, '2024-03-01', 4500.00, 'Paid', 'UPI'),
(7, 7, '2024-03-05', 6800.00, 'Paid', 'Credit Card'),
(8, 8, '2024-03-10', 5500.00, 'Pending', 'UPI'),
(9, 9, '2024-03-15', 4000.00, 'Unpaid', 'N/A'),
(10, 10, '2024-03-20', 0.00, 'Unpaid', 'N/A');

-- Retrieve Table
SELECT * FROM Billing;


-- View & CTE
-- 1. View to show doctor details
CREATE VIEW DoctorDetails AS
SELECT DoctorID, FirstName, LastName, Specialization
FROM Doctors;

-- 2. Retrieve Data
SELECT * FROM DoctorDetails;

-- 3. View to show patients above 60 years
CREATE VIEW ElderlyPatients AS
SELECT PatientID, FirstName, LastName, Age 
FROM Patients 
WHERE Age > 60;

-- Retrieve Data
SELECT * FROM ElderlyPatients;

-- 4. View to Modify Doctor Specialization
CREATE VIEW DoctorSpecialization AS
SELECT DoctorID, Specialization 
FROM Doctors 
WHERE Specialization IS NOT NULL
WITH CHECK OPTION; 

-- Retrieve Data
SELECT * FROM DoctorSpecialization;

-- 5. CTE to Show Doctors with More than 5 Appointments
WITH BusyDoctors AS (
    SELECT DoctorID, COUNT(*) AS TotalAppointments
    FROM Appointments
    GROUP BY DoctorID
    HAVING COUNT(*) > 5
)
SELECT D.FirstName, D.LastName, BD.TotalAppointments
FROM BusyDoctors BD
JOIN Doctors D ON BD.DoctorID = D.DoctorID;

-- 6. View for Appointments with Doctor and Patient Names
CREATE VIEW AppointmentDetails AS
SELECT A.AppointmentID, P.FirstName AS PatientName, D.FirstName AS DoctorName, A.AppointmentDate
FROM Appointments A
JOIN Patients P ON A.PatientID = P.PatientID
JOIN Doctors D ON A.DoctorID = D.DoctorID;

-- Retrieve data 
SELECT * FROM AppointmentDetails;

-- 7. CTE to Get the Latest 5 Appointments
WITH LatestAppointments AS (
    SELECT * FROM Appointments
    ORDER BY AppointmentDate DESC
    LIMIT 5
)
SELECT * FROM LatestAppointments;

-- 8. CTE for Patients with High Bills (Above 10,000)
WITH HighBillPatients AS (
    SELECT PatientID, SUM(BillAmount) AS TotalBill
    FROM Billing
    GROUP BY PatientID
    HAVING SUM(BillAmount) > 10000
)
SELECT P.FirstName, P.LastName, HBP.TotalBill
FROM HighBillPatients HBP
JOIN Patients P ON HBP.PatientID = P.PatientID;

-- 9. CTE for Doctors Who Have Never Had an Appointment
WITH DoctorsWithoutAppointments AS (
    SELECT DoctorID FROM Doctors
    WHERE DoctorID NOT IN (SELECT DISTINCT DoctorID FROM Appointments)
)
SELECT D.FirstName, D.LastName
FROM Doctors D
JOIN DoctorsWithoutAppointments DA ON D.DoctorID = DA.DoctorID;

-- 10. Get Billing Details with Patient Name
CREATE VIEW BillingDetails AS
SELECT B.BillID, P.FirstName AS PatientName, B.BillDate, B.BillAmount, B.PaymentStatus, B.PaymentMethod
FROM Billing B
JOIN Patients P ON B.PatientID = P.PatientID;

-- Retrieve data
SELECT * FROM BillingDetails;


-- Stored Procedure
-- 1. Get All Bills for a Patient
DELIMITER //
CREATE PROCEDURE GetPatientBills(IN p_PatientID INT)
BEGIN
    SELECT * FROM Billing WHERE PatientID = p_PatientID;
END //
DELIMITER ;

-- Call the Procedure
CALL GetPatientBills(3);

-- 2. Update Payment Status
DELIMITER //
CREATE PROCEDURE UpdatePaymentStatus(
    IN p_BillID INT,
    IN p_NewStatus VARCHAR(20)
)
BEGIN
    UPDATE Billing 
    SET PaymentStatus = p_NewStatus
    WHERE BillID = p_BillID;
END //
DELIMITER ;

-- Call the Procedure
CALL UpdatePaymentStatus(5, 'Paid');

-- 3. Get Total Revenue
DELIMITER //
CREATE PROCEDURE GetTotalRevenue()
BEGIN
    SELECT SUM(BillAmount) AS TotalRevenue FROM Billing WHERE PaymentStatus = 'Paid';
END //
DELIMITER ;

-- Call the Procedure
CALL GetTotalRevenue();

-- 4. Delete an Unpaid Bill
DELIMITER //
CREATE PROCEDURE DeleteUnpaidBill(IN p_BillID INT)
BEGIN
    DELETE FROM Billing WHERE BillID = p_BillID AND PaymentStatus = 'Unpaid';
END //
DELIMITER ;

-- Call the Procedure
CALL DeleteUnpaidBill(9);

-- 5. Highest Bill Amount Paid
DELIMITER //
CREATE PROCEDURE GetHighestBill()
BEGIN
    SELECT * FROM Billing WHERE BillAmount = (SELECT MAX(BillAmount) FROM Billing);
END //
DELIMITER ;

-- Call the Procedure
CALL GetHighestBill();


-- Subqueries
-- 1. patient who has paid the highest bill.
SELECT FirstName, LastName 
FROM Patients 
WHERE PatientID = (
    SELECT PatientID 
    FROM Billing 
    ORDER BY BillAmount DESC 
    LIMIT 1
);

-- 2. total revenue generated from completed appointments.
SELECT SUM(BillAmount) AS TotalRevenue
FROM Billing 
WHERE AppointmentID IN (
    SELECT AppointmentID 
    FROM Appointments 
    WHERE Status = 'Completed'
);

-- 3. This query finds doctors who have more than 5 appointments.
SELECT FirstName, LastName 
FROM Doctors 
WHERE DoctorID IN (
    SELECT DoctorID 
    FROM Appointments 
    GROUP BY DoctorID 
    HAVING COUNT(*) > 5
);

-- 4. names of patients who have unpaid bills.
SELECT FirstName, LastName 
FROM Patients 
WHERE PatientID IN (
    SELECT PatientID 
    FROM Billing 
    WHERE PaymentStatus = 'Unpaid'
);

-- 5. This query retrieves the latest appointment for each patient.
SELECT PatientID, AppointmentID, AppointmentDate 
FROM Appointments A1
WHERE AppointmentDate = (
    SELECT MAX(AppointmentDate) 
    FROM Appointments A2 
    WHERE A1.PatientID = A2.PatientID
);

-- 6. This query retrieves patients whose total bill amount exceeds ₹10,000.
SELECT FirstName, LastName 
FROM Patients 
WHERE PatientID IN (
    SELECT PatientID 
    FROM Billing 
    GROUP BY PatientID 
    HAVING SUM(BillAmount) > 10000
);

-- 7. This query finds doctors who have never had an appointment.
SELECT FirstName, LastName 
FROM Doctors 
WHERE DoctorID NOT IN (
    SELECT DISTINCT DoctorID 
    FROM Appointments
);
