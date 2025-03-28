/*

Part A: Real-World Database Challenge(Exercise-1)

Databases:-

1) College :-
	Database(College)
   i)Student(Student_id,Student_name,Course,Marks,Fees);
  ii)Teacher(Teacher_id,Teacher_name,Department,Position,Salary);
 iii)Staff(Staff_id,Staff_name,Role,Salary,City);
  iv)Exam(Exam_id,Exam_name,Examdate_time,Slot,Instructor);
   v)Event(Event_id,Event_name,Location,Organizer,Eventdate-time);
   
2) Company :-
	Database(Company)
   i)Employee(Employee_id,Employee_name,Email,Position,Salary);
  ii)Client(Client_id,Client_name,Occupation,Project,Deadline);
 iii)Manager(Manager_id,Manager_name,Project,Salary,Email);
  iv)Project(Project_id,Project_name,Number_of_Members,Duration,Deadline);
   v)Task(Task_id,Task_name,Employee_id,Project_id,Manager_id);
   
3) Railway :-
	Database(Railway)
   i)Customer(Customer_id,Customer_name,Mobile,Address,Ticket);
  ii)Station(Station_id,Station_name,Station_type,Location,Number_of_Platforms);
 iii)Train(Train_id,Train_Number,Ticket,Type,Name);
  iv)Officer(Officer_id,Officer_name,Workplace,Position,Salary);
   v)Employee(Employee_id,Employee_name,Position,Salary,Email);
   
4) Airline :-
	Database(Airline)
   i)Passenger(Passenger_id,Mobile,Passenger_name,Address,Passport);
  ii)Booking(Booking_id,Passport_id,Booking_type,Date,Destination);
 iii)Ticket(Tickey_id,Ticket_date,Destination,Duration,Cancellation);
  iv)Enquiry(Enquiry_id,Enquiry_date,Enquiry_type,Title,Passenger_id);
   v)Flights(Flight_Number,Departure_Hour,Airport_name,Capacity,Passenger);
   
5) Hotel :-
	Databese(Hotel)
   i)Rooms(Room_id,Room_Number,Category,Room_Type,Description);
  ii)Services(Service_id,Service_name,Type,Duration,Time);
 iii)Customer(Customer_id,Customer_name,Mobile,Email,Address);
  iv)Payments(Customer_id,Payment_id,Date,Amount,Method);
   v)Staff(Staff_id,Staff_name,Age,Mobile,Salary);
   
6) Bank :-
	Database(Bank)
   i)Customer(Customer_id,Customer_name,Address,Mobile,Email);
  ii)Account(Account_Number,Account_Type,Balance,Opening_Date,Account_id);
 iii)Transaction(Transaction_id,Account_Number,Account_Type,Amount,Date_Time);
  iv)Loan(Loan_id,Loan_Type,Amount,Interest_Rate,Bank_id);
   v)Branch(Branch_id,Branch_name,Address,Mobile,Management_name);
   
7) Online_Store :-
	Database(Online_Store)
   i)Customer(Customer_id,Customer_name,Email,Mobile,Shipping_Address);
  ii)Product(Product_id,Product_name,Category,Price,Quantity);
 iii)Order(Order_id,Customer_id,Order_Date,Status,Amount);
  iv)Payment(Payment_id,Order_id,Payment_Method,Amount_Paid,Payment_Date);
   v)Shipping(Shipping_id,Order_id,Shipping_Address,Shipping_Method,Status);
   
8) Hospital :-
	Database(Hospital)
   i)Patient(Patient_id,Patient_name,DOB,Gender,Contact);
  ii)Doctor(Doctor_id,Doctor_name,Specialization,Contact,Availability);
 iii)Appointment(Appointment_id,Patient_id,Doctor_id,Appointment_Date,Status);
  iv)Medical_Record(Record_id,Patient_id,Medical_Type,Treatment,Last_Visit);
   v)Billing(Billing_id,Patient_id,Amount,Date,Status);
   
9) Laptop_Showroom :-
	Database(Laptop_Showroom)
   i)Laptop(Laptop_id,Laptop_Brand,Laptop_Model,Specification,Price);
  ii)Customer(Customer_id,Customer_name,Contact,Address,Purchase_History);
 iii)Sales(Sales_id,Laptop_id,Customer_id,Sales_Date,Sales_Price);
  iv)Inventory(Inventory_id,Laptop_id,Stock,Restock_Date,Supplier_name);
   v)Warrenty(Warrenty_id,Laptop_id,Period,Warrenty_Status,Warrenty_Coverage);
   
10) Food_Truck_Management :-
	Database(Food_Truck_Management)
   i)Food_Truck(Truck_id,Truck_name,Location,Operating_Hours,License);
  ii)Menu_Item(Item_id,Item_name,Item_price,Category,Ingredients);
 iii)Order(Order_id,Customer_id,Order_Date&Time,Items_Ordered,Amount);
  iv)Customer(Customer_id,Customer_name,Contact,Order_History,Preferred_item);
   v)Employee(Employee_id,Employee_name,Position,Slot,Salary);
   
11) Library_Management :-
	Database(Library_Management)
   i)Book(Book_id,Title,Author,Publisher,Genre);
  ii)Member(Member_id,Member_name,Email,Mobile,Membership_Date);
 iii)Transaction(Transaction_id,Member_id,Book_id,Issue_Date,Due_Date);
  iv)Staff(Staff_id,Staff_name,Position,Email,Mobile);
   v)Category(Category_id,Category_name,Description,Sub_Category);
  
12) School :-
	Database(School)
   i)Student(Student_id,Student_name,DOB,Gender,Enrollment_Date);
  ii)Teacher(Teacher_id,Teacher_name,Subject,Email,Mobile);
 iii)Classroom(Class_id,Room_Number,Teacher_id,Capacity,Timing);
  iv)Parent(Parent_id,Parent_name,Student_id,Email,Mobile);
   v)Fees(Fees_id,Student_id,Fees_Type,Amount,Due_Date);
   
13) Retail_Management :-
	Database(Retail_Management)
   i)Product(Product_id,Product_name,Category,Price,Supplier_id);
  ii)Customer(Customer_id,Customer_name,Mobile,Email,Address);
 iii)Order(Order_id,Customer_id,Order_Date,Amount,Order_Status);
  iv)Employee(Employee_id,Employee_name,Position,Mobile,Email,Salary);
   v)Supplier(Supplier_id,Supplier_Name,Mobile,Email,Address);
   
14) University Management :-
	Database(University Management)
   i)Student(Student_id,Name,Age,Email,Program,Address);
  ii)Course(Course_id,Course_name,Credits,Instructor_id,Types);
 iii)Instructor(Instructor_id,Name,Email,Department,Salary);
  iv)Enrollment(Enrollment_id,Student_id,Course_id,Grade,Student_Capacity);
   v)Department(Dept_id,Dept_name,Head,Manager,Employee);
   
15) Transportation_Management :-
	Database(Transportation_Management)
   i)Vehicle(Vehicle_id,Vehicle_Type,Model,Registration_Number,Capacity);
  ii)Driver(Driver_id,Driver_name,License_Number,Mobile,Email);
 iii)Route(Route_id,Source,Destination,Distance,Stops);
  iv)Customer(Customer_id,Customer_name,Mobile,Email,Address);
   v)Employee(Employee_id,Employee_name,Position,Email,Salary);
   
16) Real_Estate :-
	Database(Real_Estate)
   i)Property(Property_id,Property_type,Address,Area,Price);
  ii)Owner(Owner_id,Owner_name,Mobile,Email,Address);
 iii)Buyer(Buyer_id,Buyer_name,Mobile,Email,Address);
  iv)Agent(Agent_id,Agent_name,Mobile,Email,Commission);
   v)Transaction(Transaction_id,Property_id,Buyer_id,Agent_id,Transaction_Date);
   
17) Fitness_Centre :-
	Database(Fitness_Centre)
   i)Member(Member_id,Member_name,DOB,Gender,Mobile);
  ii)Trainer(Trainer_id,Trainer_name,Experience,Gender,Mobile);
 iii)Workout_Plan(Plan_id,Name,Description,Duration,Trainer_id);
  iv)Equipment(Equipment_id,Equipment_name,Type,Quantity,Maintainance);
   v)Membership(Membership_id,Member_id,Fees,Start_Date,End_Date);
   
18) Pharmacy_Management_System :-
	Database(Pharmacy_Management_System)
   i)Medicine(Medicine_id,Medicine_name,Manufacturer,Batch_Number);
  ii)Customer(Customer_id,Customer_name,Mobile,Email,Prescription);
 iii)Supplier(Supplier_id,Supplier_name,Mobile,Email,Address);
  iv)Sales(Sales_id,Medicine_id,Customer_id,Quantity_Sold,Sale_Date);
   v)Employee(Employee_id,Employee_name,Position,Contact,Email);
   
19) Water_Supply_Management :-
	Database(Water_Supply_Management)
   i)Customer(Customer_id,Customer_name,Address,Mobile,Connection_type);
  ii)Water_Connection(Connection_id,Customer_id,Pipe_Size,Meter_id,Status);
 iii)Meter(Meter_id,Connection_id,Installation_Date,Current_Reading,Status);
  iv)Billing(Billing_id,Customer_id,Billing_Period,Total_Amount,Due_Date);
   v)Payment(Payment_id,Billing_id,Customer_id,Payment_Date,Amount_Paid);
   
20) Travel_Agency :-
	Database(Travel_Agency)
   i)Customer(Customer_id,Customer_name,Contact,Email,Address);
  ii)Tour_Package(Package_id,Package_name,Description,Destination,Duration);
 iii)Booking(Booking_id,Customer_id,Package_id,Booking_Date,Travel_Date);
  iv)Payment(Payment_id,Booking_id,Customer_id,Amount_Paid,Payment_Date);
   v)Transport(Transport_id,Transport_type,Provider,Departure,Location,Cost);
   
21) Taxi_Booking :-
	Database(Taxi_Booking)
   i)Passenger(Passenger_id,Passenger_name,Mobile,Email,Pickup_Location);
  ii)Driver(Driver_id,Driver_name,Mobile,License_Number,Vehicle_id);
 iii)Vehicle(Vehicle_id,Vehicle_Number,Model,Type,Capacity);
  iv)Ride(Ride_id,Passenger_id,Driver_id,Pickup_Location,Dropoff_Location);
   v)Payment(Payment_id,Ride_id,Amount,Payment_Method,Payment_Status);
   
22) Insurance_Management :-
	Database(Insurance_Management)
   i)Customer(Customer_id,Customer_name,DOB,Mobile,Email);
  ii)Insurance_Policy(Policy_id,Customer_id,Policy_type,Start_Date,Due_Date);
 iii)Claim(Claim_id,Policy_id,Customer_id,Claim_Amount,Claim_Date);
  iv)Payment(Payment_id,Customer_id,Policy_id,Amount_Paid,Payment_Date);
   v)Agent(Agent_id,Agent_name,Mobile,Email,Branch_Location);
   
23) Vehicle_Service_Management :-
	Database(Vehicle_Service_Management)
   i)Customer(Customer_id,Customer_name,Mobile,Vehicle,Address);
  ii)Mechanic(Mechanic_id,Mechanic_name,Skill,Mobile,Experience);
 iii)Service(Service_id,Vehicle_id,Mechanic_id,Service_type,Cost);
  iv)Invoice(Invoice_id,Service_id,Amount,Date,Payment_Mode);
   v)Parts(Part_id,Part_name,Price,Stock,Supplier);
   
24) Bus_Ticket_Booking_System :-
	Database(Bus_Ticket_Booking_System)
   i)Passenger(Passenger_id,Passenger_name,Age,Mobile,Email);
  ii)Bus(Bus_id,Bus_number,Bus_type,Bus_route,Capacity);
 iii)Ticket(Ticket_id,Passenger_id,Bus_id,Price,Seat_Number);
  iv)Payment(Payment_id,Ticket_id,Amount,Payment_Method,Date);
   v)Schedule(Schedule_id,Bus_id,Date,Departure,Arrival);
   
25) Online_Course_Platform :-
	Database(Online_Course_Platform)
   i)Instructor(Instructor_id,Instructor_name,Subject,Experience,Email);
  ii)Student(Student_id,Student_name,Email,Student_Course,Enrollment_Date);
 iii)Course(Course_id,Course_Title,Course_Duration,Instructor_id,Fee);
  iv)Payment(Payment_id,Student_id,Amount,Date,Method);
   v)Certification(Certificate_id,Student_id,Course_id,Date,Grade);
   
26) Crime_Record_Management :-
	Database(Crime_Record_Management)
   i)Criminal(Criminal_id,Name,Age,Crime_Type,Arrest_Date);
  ii)Officer(Officer_id,Name,Rank,Badge_Number,Station);
 iii)Case(Case_id,Criminal_id,Officer_id,Status,Date);
  iv)Evidence(Evidence_id,Case_id,Type,Location,Description);
   v)Court_Hearing(Hearing_id,Case_id,Date,Verdict,Judge);
   
27) Event_Management_System :-
	Databases(Event_Management_System)
   i)Organizer (Organizer_id,Organizer_name,Mobile,Email,Company);
  ii)Venue(Venue_id,Venue_name,Location,Capacity,Cost);
 iii)Event(Event_id,Event_name,Event_date,Venue_id,Budget);
  iv)Ticket(Ticket_id,Event_id,Price,Ticket_type,Availability);
   v)Sponsorship(Sponsor_id,Event_id,Company,Amount,Agreement);
   
28) Construction_Project_Management :-
	Database(Construction_Project_Management)
   i)Project(Project_id,Projecy_name,Budget,Deadline,Status);
  ii)Contractor(Contractor_id,Contractor_name,Mobile,License_Number,Experience);
 iii)Material(Material_id,Material_name,Quantity,Cost,Supplier);
  iv)Worker(Worker_id,Worker_name,Skill,Daily_Wage,Experience);
   v)Inspection(Inspection_id,Project_id,Date,Inspector,Remarks);
   
29) Sports_Club_Management :-
	Database(Sports_Club_Management)
   i)Player(Player_id,Player_name,Sport,Age,Rank);
  ii)Coach(Coach_id,Coach_name,Experience,Sport,Salary);
 iii)Membership(Membership_id,Player_id,Join_Date,Expiry_Date,Fee);
  iv)Equipment(Equipment_id,Equipment_name,Quantity,Condition,Supplier);
   v)Tournament(Tournament_id,Tournament_name,Sport,Date,Prize);
   
30) Zoo_Management_System :-
	Database(Zoo_Management_System)
   i)Animal(Animal_id,Animal_name,Species,Age,Health_Status);
  ii)Enclosure(Enclosure_id,Type,Capacity,Location,Condition);
 iii)Zookeeper(Zookeeper_id,Zookeeper_name,Experience,Shift,Contact);
  iv)Feeding_Schedule(Schedule_id,Animal_id,Time,Food,Quantity);
   v)Veterinary_Visit(Visit_id,Animal_id,Date,Treatment,Vet_Name);
*/

-- Part B: In-Depth Focus Task(Exercise-2)

create database Travel_Agency;

drop database Travel_Agency;

use Travel_Agency;

-- -----------------------------------------------------------------Table 01 Queries-----------------------------------------------------------------

create table customer(
Customer_id int primary key,
Customer_name Varchar(70),
Contacts varchar(20),
Email varchar(50),
Address varchar(90)
);

select * from customer;

insert into customer
values
(1,'Sanket','9893742398','sanket123@gmail.com','Mumbai'),
(2,'Raj','9834243773','raj123@gmail.com','Pune'),
(3,'Piyush','8987423471','piyush123@gmail.com','Malad'),
(4,'Sameer','7827342342','sameer123@gmail.com','Thane'),
(5,'Yash','9343746274','yash123@gmail.com','Badlapur'),
(6,'Anjali','8923483764','anjali123@gmail.com','Airoli'),
(7,'Maithili','9823472834','maithili123@gmail.com','Goregaon'),
(8,'Tejas','8172187362','tejas123@gmail.com','Karjat'),
(9,'Pavan','8938748234','pavan123@gmail.com','Dombivali'),
(10,'Rushi','7189241284','rushi123@gmail.com','Mumbai');




-- -----------------------------------------------------------------Table 02 Queries-----------------------------------------------------------------

create table Tour_Package(
Package_id int primary key,
Package_name Varchar(70),
Description varchar(100),
Destination varchar(50),
Duration varchar(90)
);

select * from Tour_Package;

insert into Tour_Package
values
(101,'Full Goa Trip','Beach Holiday','Goa','07 Days'),
(102,'Maldives Holiday','Beach with All the Amenities','Maldives','12 Days'),
(103,'Historical Rajasthan','History with All the Traditions','Rajasthan','09 Days'),
(104,'Kashmir Storm','Explore Winter with Fun','Kashimir','07 Days'),
(105,'South India Trip','Trip with the action of Fun and the Taste of South','South India','15 Days'),
(106,'Winter Wonderland','Explore Winter Sport in the Alps','Switzerland','08 Days'),
(107,'Cultural Exploration','Discover Ancient Temples and Traditions','Japan','12 Days'),
(108,'Boat Suffer','Cruise around the sea','Italy','15 Days'),
(109,'Adventure Trek','A Challenging Mountain Trekking Experience','Nepal','10 Days'),
(110,'Beach Paradise','Visit the Wolrd Most Luxurious Beaches','Bora Bora','05 Days');

-- -----------------------------------------------------------------Table 03 Queries-----------------------------------------------------------------

create table booking(
Booking_id int primary key,
Customer_id int,
Package_id int,
Booking_Date varchar(50),
Travel_Date varchar(90)
);

select * from booking;

insert into booking
values
(1001,1,101,'31 Dec 2024','06 Jan 2025'),
(1002,2,102,'01 Jan 2025','06 Jan 2025'),
(1003,3,103,'10 Dec 2024','10 Jan 2025'),
(1004,4,104,'25 Nov 2024','08 Jan 2025'),
(1005,5,105,'12 Dec 2024','12 Jan 2025'),
(1006,6,106,'07 Dec 2024','09 Feb 2025'),
(1007,7,107,'31 Nov 2024','10 Jan 2025'),
(1008,8,108,'19 Dec 2024','20 Jan 2025'),
(1009,9,109,'27 Nov 2024','07 Feb 2025'),
(1010,10,110,'23 Dec 2024','06 Feb 2025');

-- -----------------------------------------------------------------Table 04 Queries-----------------------------------------------------------------

create table payment(
Payment_id int primary key,
Booking_id int,
Customer_id int,
Amount_Paid varchar(20),
Payment_Date varchar(20)
);

select * from payment;

insert into payment
values
(10001,1001,1,'Done','01 Jan 2025'),
(10002,1002,2,'Done','02 Jan 2025'),
(10003,1003,3,'Done','03 Jan 2025'),
(10004,1004,4,'Done','04 Jan 2025'),
(10005,1005,5,'Done','02 Jan 2025'),
(10006,1006,6,'Done','01 Feb 2025'),
(10007,1007,7,'Done','03 Jan 2025'),
(10008,1008,8,'Done','05 Jan 2025'),
(10009,1009,9,'Done','01 Feb 2025'),
(10010,1010,10,'Done','04 Feb 2025');

-- -----------------------------------------------------------------Table 05 Queries-----------------------------------------------------------------

create table transport(
Transport_id int primary key,
Customer_id int,
Transport_type varchar(30),
Provider varchar(40),
Departure varchar(20),
Location varchar(20)
);

select * from transport;

insert into transport
values
(11,1,'Flight','Spice Jet','06 Jan 2025','Goa'),
(12,2,'Flight','Spice Jet','06 Jan 2025','Maldives'),
(13,3,'Bus','Red Bus','10 Jan 2025','Rajasthan'),
(14,4,'Train','Confirmtkt','08 Jan 2025','Kashmir'),
(15,5,'Bus','Red Bus','12 Jan 2025','South India'),
(16,6,'Flight','Spice Jet','09 Feb 2025','Switzerland'),
(17,7,'Flight','Spice Jet','10 Jan 2025','Japan'),
(18,8,'Flight','Spice Jet','20 Jan 2025','Italy'),
(19,9,'Flight','Spice Jet','07 Feb 2025','Nepal'),
(20,10,'Flight','Spice Jet','06 Feb 2025','Bora Bora');

