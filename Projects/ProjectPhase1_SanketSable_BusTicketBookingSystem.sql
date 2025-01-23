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

-- My Database theme is Bus_Ticket_Booking_System

create database Bus_Ticket_Booking_System;

drop database Bus_Ticket_Booking_System;

use Bus_Ticket_Booking_System;

-- -------------------------------------------------------Table 01 Queries-------------------------------------------------------

create table user(
User_id int not null primary key,
First_name varchar(40),
Last_name varchar(40),
User_email varchar(40),
Mobile varchar(20),
Gender varchar(10),
City varchar(30),
State varchar(40),
Registration_date varchar(30)
);

select * from user;

insert into user
values
(1,'Sanket','Sable','sanketsable123@gmail.com','8291621013','Male','Dombivali','Maharashtra','12 March 2024'),
(2,'Yash','Garud','yashgarud123@gmail.com','9546215801','Male','Kalyan','Maharashtra','23 December 2024'),
(3,'Anjali','Patil','anjalipatil123@gmail.com','8564158612','Female','Airoli','Maharashtra','03 April 2024'),
(4,'Mukashshaf','Momin','mukashshafmomin123@gmail.com','7568412862','Female','Mumbra','Maharashtra','31 October 2024'),
(5,'Raj','Mali','rajmali123@gmail.com','8546215378','Male','Dombivali','Maharashtra','04 May 2024'),
(6,'Yash','Pawar','yashpawar123@gmail.com','9546218756','Male','Vangani','Maharashtra','28 July 2024'),
(7,'Nupur','Lotekar','nupurlotekar123@gmail.com','7715821977','Male','Dombivali','Maharashtra','21 November 2024'),
(8,'Karan','Khegde','karankhegde123@gmail.com','9004178250','Male','Dombivali','Maharashtra','06 March 2023'),
(9,'Rohit','Thorat','rohitthorat123@gmail.com','8564791235','Male','Dombivali','Maharashtra','21 December 2023'),
(10,'Tanay','Kadam','tanaykadam123@gmail.com','7854628419','Male','Dombivali','Maharashtra','02 March 2023');


-- -------------------------------------------------------Table 02 Queries-------------------------------------------------------

create table buses(
Bus_id int not null primary key,
Bus_number int not null,
Bus_type varchar(30),
Capacity varchar(20),
Status varchar(30)
);

select * from buses;

insert into buses
values
(1,22024,'Sleeper','50 Seats','Active'),
(2,22045,'AC','48 Seats','Maintainance'),
(3,22057,'Non-AC','45 Seats','Inactive'),
(4,22095,'Sleeper','50 Seats','Inactive'),
(5,22085,'Semi-Sleeper','52 Seats','Active'),
(6,22048,'Non-AC','45 Seats','Active'),
(7,22042,'AC','48 Seats','Maintainance'),
(8,22058,'Sleeper','50 Seats','Inactive'),
(9,22038,'Sleeper','50 Seats','Active'),
(10,22067,'Non-AC','45 Seats','Active');

-- -------------------------------------------------------Table 03 Queries-------------------------------------------------------

create table operators(
Operator_id int not null primary key,
Operator_name varchar(40),
Work varchar(30),
Mobile varchar(20),
email varchar(40),
License_number varchar(40)
);

select * from operators;

insert into operators
values
(1,'Santosh Kadam','Bus Driver','7568412563','santoshkadam123@gmail.com','ABC123XY'),
(2,'Ravindra Patil','Bus Conductor','8465123795','ravindrapatil123@gmail.com','--'),
(3,'Rajat Gokhale','Bus Driver','8564125798','rajatgokhale123@gmail.com','DJY843YF'),
(4,'Sumit Pagare','Bus Conductor','8452617539','sumitpagare123@gmail.com','--'),
(5,'Shreyash Shinde','Bus Driver','8945651232','shreyashshinde123@gmail.com','DJA123IJ'),
(6,'Sabrinath Nair','Bus Conductor','8945658721','sabrinathnair123@gmail.com','--'),
(7,'Ashish Rawalkar','Bus Conductor','8456218768','ashishrawalkar123@gmail.com','--'),
(8,'Sarthak Sapkal','Bus Driver','9564821576','sarthaksapkal123@gmail.com','DIO358IJ'),
(9,'Aniket Potale','Bus Driver','8657215698','aniketpotale123@gmail.com','HDI389DI'),
(10,'Prathamesh Kadam','Bus Conductor','8645218675','prathameshkadam123@gmail.com','--');

-- -------------------------------------------------------Table 04 Queries-------------------------------------------------------

create table routes(
Route_id int not null primary key,
Source_city varchar(30),
Destination_city varchar(30),
Total_distance_KM varchar(30),
Estimated_duration varchar(30)
);

select * from routes;

insert into routes
values
(1,'Mumbai','Pune','150 KM','03 HOURS'),
(2,'Bangalore','Hyderabad','600 KM','09 HOURS'),
(3,'Dombivali','Thane','20 KM','30 MIN'),
(4,'Dombivali','Chatrapati Sambhajinagar','450 KM','08 HOURS'),
(5,'Dombivali','CSMT','70 KM','1.5 HOURS'),
(6,'Chatrapati Samnhajinagar','Jalana','40 KM','1.2 HOURS'),
(7,'Delhi','Jaipur','270 KM','05 HOURS'),
(8,'Kasara','Dombivali','100 KM','2.2 HOURS'),
(9,'Mumbai','Kolhapur','500 KM','08 HOURS'),
(10,'CSMT','Satara','650 KM','09 HOURS');

-- -------------------------------------------------------Table 05 Queries-------------------------------------------------------

create table bus_routes(
Bus_route_id int not null primary key,
Bus_id int not null,
Route_id int not null,
Departure_time varchar(20),
Arrival_time varchar(20),
Fare varchar(40)
);

select * from bus_routes;

insert into bus_routes
values
(1,1,1,'01.16 P.M.','04.16 P.M.','350 Per Person'),
(2,2,2,'12.07 P.M.','09.07 P.M.','1102.450 Per Person'),
(3,3,3,'10.40 A.M.','11.10 A.M.','30 Per Person'),
(4,4,4,'06.27 A.M.','02.27 P.M.','750 Per Person'),
(5,5,5,'11.11 A.M.','12.41 P.M.','60.43 Per Person'),
(6,6,6,'02.27 P.M.','03.47 P.M.','100.60 Per Person'),
(7,7,7,'09.12 A.M.','01.12 P.M.','415.20 Per Person'),
(8,8,8,'10.56 A.M.','01.16 P.M.','115.60 Per Person'),
(9,9,9,'12.00 P.M.','08.00 P.M.','750 Per Person'),
(10,10,10,'09.00 A.M,','06.00 P.M.','790.98 Per Person');


-- -------------------------------------------------------Table 06 Queries-------------------------------------------------------

create table seats(
Seat_id int not null primary key,
Bus_id int not null,
Seat_number int not null,
Seat_type varchar(20),
Status varchar(20)
);

select * from seats;

insert into seats
values
(1,1,32,'Window','Reserved'),
(2,2,15,'Non-Window','Available'),
(3,3,18,'Non-Window','Booked'),
(4,4,28,'Window','Booked'),
(5,5,45,'Non-Window','Reserved'),
(6,6,35,'Window','Available'),
(7,7,37,'Window','Available'),
(8,8,34,'Non-Window','Booked'),
(9,9,12,'Window','Available'),
(10,10,09,'Window','Reserved');

-- -------------------------------------------------------Table 07 Queries-------------------------------------------------------

create table bookings(
Booking_id int not null primary key,
User_id int not null,
Bus_route_id int not null,
Seat_id int not null,
Booking_date varchar(20),
Journey_date varchar(20),
Total_fare varchar(20),
Status varchar(20)
);

select * from bookings;

insert into bookings
values
(1,1,1,1,'06 January 2025','12 January 2025','1050 Rupees','Confirmed'), -- 350 RUPEES * 3 PERSON = 1050 RUPEES
(2,2,2,2,'05 January 2025','13 January 2025','2204.9 Rupees','Waiting'), -- 1102.450 RUPEES * 2 PERSON = 2204.900 RUPEES
(3,3,3,3,'02 January 2025','10 January 2025','300 Rupees','Cancelled'), -- 30 RUPEES * 10 PERSON = 300 RUPEES
(4,4,4,4,'30 December 2024','12 January 2025','3000 Rupees','Confirmed'), -- 750 RUPEES * 4 PERSON = 3000 RUPEES
(5,5,5,5,'20 December 2024','20 January 2025','60.43 Rupees','Cancelled'), -- 60.43 RUPEES * 1 PERSON = 60.43 RUPEES
(6,6,6,6,'01 January 2025','15 January 2025','301.8 Rupees','Confirmed'), -- 100.60 RUPEES * 3 PERSON = 301.80 RUPEES
(7,7,7,7,'04 January 2025','17 January 2025','6229.5 Rupees','Waiting'), -- 415.30 RUPEES * 15 PERSON = 6229.5 RUPEES
(8,8,8,8,'06 January 2025','20 January 2025','2310 Rupees','Confirmed'), -- 115.5 RUPEES * 20 PERSON = 2310 RUPEES
(9,9,9,9,'30 December 2024','08 January 2025','3000 Rupees','Cancelled'), -- 750 RUPEES * 4 PERSON = 3000 RUPEES
(10,10,10,10,'02 January 2025','12 January 2025','15819.6 Rupees','Confirmed'); -- 790.98 RUPEES * 20 PERSON = 15819.6 RUPEES

-- -------------------------------------------------------Table 08 Queries-------------------------------------------------------

create table passengers(
passenger_id int not null primary key,
Booking_id int not null,
First_name varchar(20),
Last_name varchar(20),
Gender varchar(20),
Age varchar(10)
);

select * from passengers;

insert into passengers 
values
(1,1,'Sanket','Sable','Male','20 Years'),
(2,2,'Yash','Garud','Male','21 Years'),
(3,3,'Anjali','Patil','Female','24 Years'),
(4,'4','Mukashshaf','Momin','Female','18 Years'),
(5,'5','Raj','Mali','Male','31 Years'),
(6,'6','Yash','Pawar','Male','32 Years'),
(7,'7','Nupur','Lotekar','Male','30 Years'),
(8,'8','Karan','Khegde','Male','29 Years'),
(9,'9','Rohit','Thorat','Male','33 Years'),
(10,'10','Tanay','Kadam','Male','33 Years');

-- -------------------------------------------------------Table 09 Queries-------------------------------------------------------

create table payments(
Payment_id int not null primary key,
Booking_id int not null,
User_id int not null,
Payment_date varchar(30),
Amount_paid int not null,
Payment_method varchar(30),
Transaction_id varchar(30),
Status varchar(20)
);

select * from payments;

insert into payments
values
(1,1,1,'03 January 2025','1050','UPI','ahfnf3823849nsncnd','Success'),
(2,2,2,'03 January 2025','2205','Cash','--','Success'),
(3,3,3,'03 January 2025','300','Credit Card','uafeu7398238suhfus','Success'),
(4,4,4,'03 January 2025','3000','Cash','--','Success'),
(5,5,5,'03 January 2025','60.43','Cash','--','Success'),
(6,6,6,'03 January 2025','301.8','Cash','--','Success'),
(7,7,7,'03 January 2025','6229.5','UPI','suefb8374918gliugu','Success'),
(8,8,8,'03 January 2025','2310','UPI','fnuif9275223sufuie','Success'),
(9,9,9,'03 January 2025','3000','Cash','--','Success'),
(10,10,10,'03 January 2025','15819.6','Cash','--','Success');

-- -------------------------------------------------------Table 10 Queries-------------------------------------------------------

create table refunds(
Refund_id int not null primary key,
Booking_id int not null,
Payment_id int not null,
Refund_amount varchar(20),
Refund_date varchar(20),
Status varchar(20)
);

select * from refunds;

insert into refunds
values
(1,1,1,'2500rs','--','Pending'),
(2,2,2,'1000rs','03 January 2025','Done'),
(3,3,3,'1200rs','--','Processing'),
(4,4,4,'2000rs','05 January 2025','Done'),
(5,5,5,'1000rs','--','Pending'),
(6,6,6,'4500rs','--','Processing'),
(7,7,7,'2300rs','01 January 2025','Done'),
(8,8,8,'2540rs','--','Processing'),
(9,9,9,'3450rs','--','Pending'),
(10,10,10,'3500rs','06 January 2025','Done');

-- -------------------------------------------------------Table 11 Queries-------------------------------------------------------

create table discounts(
Discount_id int not null primary key,
Discount_code varchar(20),
Discount_percentage varchar(5),
Valid_from varchar(30),
Valid_to varchar(30),
Status varchar(20)
);

select * from discounts;

Insert into discounts
values
(1,'FlatDiscount','5%','31 December 2024','05 January 2025','Expired'),
(2,'FlatDiscount','4%','30 December 2024','15 January 2025','Active'),
(3,'FlatDiscount','5%','31 December 2024','10 January 2025','Active'),
(4,'FlatDiscount','8%','30 December 2024','02 January 2025','Expired'),
(5,'FlatDiscount','10%','30 December 2024','03 January 2025','Expired'),
(6,'FlatDiscount','6%','31 December 2024','08 January 2025','Active'),
(7,'FlatDiscount','7%','30 December 2024','09 January 2025','Active'),
(8,'FlatDiscount','10%','30 December 2024','08 January 2025','Active'),
(9,'FlatDiscount','4%','30 December 2024','10 January 2025','Active'),
(10,'FlatDiscount','9%','31 December 2024','02 January 2025','Expired');

-- -------------------------------------------------------Table 12 Queries-------------------------------------------------------

create table reviews(
Review_id int not null primary key,
User_id int not null,
Operator_id int not null,
Rating varchar(10),
Comment varchar(30),
Review_date varchar(20)
);

select * from reviews;

insert into reviews
values
(1,1,1,'4.1 star','Awesome','02 January 2025'),
(2,2,2,'4.5 star','Great Response','31 December 2024'),
(3,3,3,'4.5 star','Great','21 November 2024'),
(4,4,4,'4.6 star','Nice','20 November 2024'),
(5,5,5,'4.2 star','Good Staff','30 November 2024'),
(6,6,6,'4.2 star','Nice','01 November 2024'),
(7,7,7,'4.5 star','Awesome','31 October 2024'),
(8,8,8,'4.2 star','Nice','05 January 2025'),
(9,9,9,'4.2 star','Nice','21 November 2024'),
(10,10,10,'4.5 star','Great','21 May 2024');

-- -------------------------------------------------------Table 13 Queries-------------------------------------------------------

create table complaints(
Complaint_id int primary key not null,
User_id int not null,
Operator_id int not null,
Subject varchar(80),
Description varchar(100),
Status varchar(20),
Submitted_date varchar(30)
);

select * from complaints;

insert into complaints
values
(1,1,1,'Bus Delay','The bus was delayed by 2 hours without notice','Resolved','02 March 2024'),
(2,2,2,'Rude Staff','The counductor was very rude to passenger','Pending','10 May 2024'),
(3,3,3,'AC Not Working','The AC was not functioning during the journey','Resolved','08 November 2024'),
(4,4,4,'Overcharging for ticket','Charged more than the displayed fare','Pending','20 December 2024'),
(5,5,5,'Dirty Bus Interior','The seats and floor were very dirty','Resolved','12 January 2025'),
(6,6,6,'No Water Bottles','Promised water bottle were not provided','Pending','03 January 2025'),
(7,7,7,'Broken Seat','My seat was broken and uncomfortable','Resolved','10 January 2024'),
(8,8,8,'Late Night Cancellation','The bus was cancelled at the last minute','Pending','04 July 2024'),
(9,9,9,'Unhygienic Washroom','The bus washroom was not clean','Resolved','07 July 2024'),
(10,10,10,'Reckless Driving','The driver was speeding and driving recklessly','Resolve','28 November 2024');

-- -------------------------------------------------------Table 14 Queries-------------------------------------------------------

create table notifications(
Notification_id int not null primary key,
User_id int not null,
Message varchar(100),
Sent_date varchar(30),
Status varchar(20)
);

select * from notifications;

insert into notifications
values
(1,1,'You have great chance to ride','12 May 2024','Read'),
(2,2,'You have deal with 20% off','12 January 2025','Unread'),
(3,3,'You want a long trip join now in premium subscription','30 November 2024','Read'),
(4,4,'Are you Bored....click for more','24 August 2024','Read'),
(5,5,'Are you Ready for tomorrows trip','04 January 2025','Unread'),
(6,6,'Have a break for you 07 days long trip','04 December 2024','read'),
(7,7,'Your Membership end in 09 days renew now','12 June 2024','Unread'),
(8,8,'Make some plan for nightout','19 April 2024','Read'),
(9,9,'Today mumbai-pune road is block','05 July 2024','Read'),
(10,10,'Make some funday on this sunday','20 November 2024','Read');

-- -------------------------------------------------------Table 15 Queries-------------------------------------------------------

create table loyalty_points(
Loyalty_id int not null primary key,
User_id int not null,
Points_earned int,
Points_redeemed int,
Balance_points int
);

select * from loyalty_points;

insert into loyalty_points
values
(1,1,2000,1800,200),
(2,2,3450,450,3000),
(3,3,3162,1162,2000),
(4,4,1500,1100,400),
(5,5,1900,1800,100),
(6,6,2142,2100,42),
(7,7,3200,3000,200),
(8,8,5600,4600,1000),
(9,9,4500,3200,1300),
(10,10,7000,4500,2500);

-- -------------------------------------------------------Table 16 Queries-------------------------------------------------------

create table bus_stops(
Stop_id int not null primary key,
Route_id int not null,
Stop_name varchar(30),
Arrival_time timestamp default current_timestamp on update current_timestamp
);

select * from bus_stops;

Insert into bus_stops (Stop_id, Route_id, Stop_name) values
(1,1,'Dombivali'),
(2,2,'Kalyan'),
(3,3,'Thane'),
(4,4,'Pune'),
(5,5,'Dadar'),
(6,6,'Goregaon'),
(7,7,'Kolhapur'),
(8,8,'CSMT'),
(9,9,'Karjat'),
(10,10,'Ghatkopar');

-- -------------------------------------------------------Table 17 Queries-------------------------------------------------------

create table staff(
Staff_id int not null primary key,
bus_id int not null,
Name varchar(40),
Role varchar(20),
Contact_number varchar(20)
);

select * from staff;

insert into staff 
values
(1,1,'Aman Sharma','Driver','9845415464'),
(2,2,'Abhishek Patil','Conductor','8486486482'),
(3,3,'Anil Badgujar','Conductor','9848161815'),
(4,4,'Raj Mishra','Driver','8974846841'),
(5,5,'Karan Mehra','Conductor','9894681846'),
(6,6,'Avinash Oberoi','Driver','7686468148'),
(7,7,'Eisha Patel','Conductor','8461684156'),
(8,8,'Rakhi Jaiswal','Conductor','8748168184'),
(9,9,'Vinod Sawant','Driver','7846848464'),
(10,10,'Mahendra Jadhav','Conductor','8946846168');

-- -------------------------------------------------------Table 18 Queries-------------------------------------------------------

create table bus_maintainance(
Maintainance_id int not null primary key,
Bus_id int not null,
Service_date timestamp default current_timestamp on update current_timestamp,
Description varchar(50),
Cost int,
Next_service_due timestamp default current_timestamp on update current_timestamp
);

select * from bus;

insert into bus_maintainance ( Maintainance_id, Bus_id, Description, Cost ) values
(1,1,'Engine oil change and Bus Brake check','5000'),
(2,2,'Tire replacement','12000'),
(3,3,'AC filter cleaning','3500'),
(4,4,'Full body Check-up','8000'),
(5,5,'Brake pad replacement','6000'),
(6,6,'Engine tuning','7000'),
(7,7,'Battery check & replacement','9000'),
(8,8,'Exterior & Interior cleaning','2500'),
(9,9,'Clutch & gearbox repair','11000'),
(10,10,'Suspension system maintainance','9500');

-- -------------------------------------------------------Table 19 Queries-------------------------------------------------------

create table emergency_contacts(
Emergency_id int not null primary key,
Passenger_id int not null,
Contact_name varchar(50),
Mobile varchar(20),
Relationship varchar(20)
); 

select * from emergency_contacts;

insert into emergency_contacts
values
(1,1,'Rajesh Sharma','8984684844','Father'),
(2,2,'Anjali Verma','7948468416','Mother'),
(3,3,'Ramesh Patel','8794868454','Brother'),
(4,4,'Sita Mehta','8646444884','Sister'),
(5,5,'Aman Gupta','8784646846','Friend'),
(6,6,'Kiran Joshi','8485484556','Spouse'),
(7,7,'Sunita Desai','8684684686','Mother'),
(8,8,'Alok Nair','8746484684','Father'),
(9,9,'Pooja Malhotra','9564656165','Sister'),
(10,10,'Arjun Saxena','9686468416','Cousin');

-- -------------------------------------------------------Table 20 Queries-------------------------------------------------------

create table route_fares(
Fare_id int not null primary key,
Route_id int not null,
Distance_range_KM int not null,
Fare_amount int not null
);

select * from route_fares;

insert into route_fares
values
(1,1,450,700), 
(2,2,500,900), 
(3,3,300,500), 
(4,4,700,1200), 
(5,5,490,750), 
(6,6,840,1350), 
(7,7,680,1175), 
(8,8,450,700), 
(9,9,900,1400), 
(10,10,1000,1600);

-- -------------------------------------------------------Table 21 Queries-------------------------------------------------------

create table admins(
Admin_id int not null primary key,
name varchar(40),
Email varchar(50),
Phone varchar(12),
Role varchar(20),
Password_hash varchar(20)
);

select * from admins;

insert into admins
values
(1,'Raj Mali','rajmali@gmail.com','8935156168','Super Admin','g86fd4g6d4g8ag'),
(2,'Vinod Tawade','vinodtawade@gmail.com','8866684616','Ticket Manager','f84ed4faf48fe8'),
(3,'Sumit Pagare','sumitpagare@gmail.com','9681616811','System Admin','84g86rv6w4vrvr'),
(4,'Pradeep Yadav','pradeepyadav@gmail.com','7988686684','HR Manager','49f4vwe84f6wfw'),
(5,'Nitesh Yadav','niteshyadav@gmail.com','9861166535','Finance Admin','6ds84ec6e4cefe'),
(6,'Rajat Gokhale','rajatgokhale@gmail.com','7984616548','IT Admin','68f46e84fc6ef4'),
(7,'Sabrinath Nair','sabrinathnair@gmail.com','8885561446','Super Admin','4f84fc4e6c4e84'),
(8,'Siddesh Patil','siddeshpatil@gmail.com','8648656516','Ticket Manager','f4cs4v864v6868'),
(9,'Sairaj Vichare','sairajvichare@gmail.com','8989465864','IT Admin','c8ds4c84c64cet'),
(10,'Ashish Patil','ashishpatil@gmail.com','76464848168','Finance Admin','f684s86c4e6cc6');

-- -------------------------------------------------------Table 22 Queries-------------------------------------------------------

create table offers(
Offer_id int not null primary key,
Title varchar(50),
Description varchar(50),
Start_date timestamp default current_timestamp on update current_timestamp,
End_date timestamp default current_timestamp on update current_timestamp,
Status varchar(20)
);

select * from offers;

insert into offers (Offer_id,Title,Description,Status) values
(1,'New Year Discount','20% off on all tickets for New Year 2025','Expired'),
(2,'Summer Special','Flat ₹100 off on all long-distance routes','Expired'),
(3,'Weekend Saver','Buy one get one free on weekend trips','Active'),
(4,'Festival Bonanza','₹50 off during Diwali season','Expired'),
(5,'First Ride Free','Free ticket for first-time users','Active'),
(6,'Flash Sale 50% Off','50% off on selected routes for one day','Active'),
(7,'Monsoon Madness','₹75 discount on all overnight buses','Active'),
(8,'Student Discount','15% off for students on all bookings','Active'),
(9,'Senior Citizen Offer','Extra 10% off for senior citizens','Active'),
(10,'Independence Day Sale','₹150 off on Independence Day bookings','Active');

-- -------------------------------------------------------Table 23 Queries-------------------------------------------------------

create table cancellation_policies(
Policy_id int not null primary key,
Description varchar(100),
Refund_percentage int,
Cancellation_window_hour int
);

select * from cancellation_policies;

insert into cancellation_policies
values
(1,'Full refund if cancelled 48 hours before travel',100,48),
(2,'50% refund if cancelled between 24-48 hours',50,24),
(3,'No refund for cancellations within 24 hours',0,24),
(4,'Full refund for cancellations 72 hours before',100,72),
(5,'25% refund if cancelled within 1 hour of travel',25,1),
(6,'Full refund for medical emergencies (with proof)',100,48),
(7,'75% refund if cancelled 36 hours before travel',75,36),
(8,'No refund if trip is missed (no-show)',0,0),
(9,'50% refund for group bookings if cancelled 48hrs before',50,48),
(10,'Full refund for cancellations due to weather conditions',100,48);

-- -------------------------------------------------------Table 24 Queries-------------------------------------------------------

create table Bus_live_tracking(
Tracking_id int not null primary key,
Bus_id int not null,
Latitude float,
Longitude float,
timestamp timestamp default current_timestamp on update current_timestamp
);

select * from Bus_live_tracking;

insert into Bus_live_tracking (Tracking_id,Bus_id,Latitude,Longitude)
values
(1,1,19.3222,72.8648),
(2,2,19.4868,72.8898),
(3,3,19.8675,72.9879),
(4,4,19.4461,72.8468),
(5,5,19.6348,72.8496),
(6,6,19.8463,72.8748),
(7,7,19.2616,72.5154),
(8,8,19.1135,72.3135),
(9,9,19.4845,72.6613),
(10,10,19.4866,72.4843);

-- -------------------------------------------------------Table 25 Queries-------------------------------------------------------

create table feedback(
Feedback_id int not null primary key,
User_id int not null,
Booking_id int not null,
Rating int,
Comments varchar(100),
Feedback_date timestamp default current_timestamp on update current_timestamp
);

select * from feedback;

insert into feedback ( Feedback_id, User_id, Booking_id, Rating, Comments )
values
(1,1,1,5,"Excellent service, the bus was clean and on time!"),
(2,2,2,4,"Good ride, but the seat could have been more comfortable."),
(3,3,3,3,"Average experience, the bus was a bit late."),
(4,4,4,5,"Great journey! Everything was perfect."),
(5,5,5,2,"The bus was delayed by an hour, no updates were provided."),
(6,6,6,4,"Comfortable trip, but could improve the air conditioning."),
(7,7,7,5,"Fantastic service, I’ll definitely book again!"),
(8,8,8,3,"Okay experience, had some issues with the ticketing system."),
(9,9,9,4,"Bus was on time, but the ride could have been smoother."),
(10,10,10,1,"Worst experience! The bus was very late and uncomfortable.");