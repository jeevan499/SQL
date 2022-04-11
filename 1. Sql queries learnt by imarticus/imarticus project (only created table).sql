create database if not exists Iproject;
use iproject;

#Creating employee_details table:


create table Employee_Details(
Emp_Id int(5) primary key,
Emp_Name varchar(30),
Emp_Branch varchar(15),
Emp_Designation varchar(40),
Emp_Addr varchar(100),
Emp_Cont_no varchar(10));

#Creating membership table:

create table Membership(
M_ID int primary key,
Start_Date text,
End_Date text);

# Creating Customer table:

create table Customer(
Cust_ID int(4) primary key,
Cust_Name varchar(30),
Cust_Email_ID varchar(50),
Cust_Count_No varchar(10),
Cust_Addr varchar(30),
Membership_M_ID int,
foreign key (Membership_M_ID) references Membership (M_ID));

# creating Shipment_details:

create table Shipment_Details(
SD_ID varchar(6) primary key,
SD_Content varchar(40),
SD_Domain varchar(15),
SD_Type varchar(15),
SD_Weight varchar(10),
SD_Charges int(10),
SD_Addr varchar(100),
DS_Addr varchar(100),
Customer_Cust_ID int(4),
foreign key (Customer_Cust_ID) references customer (Cust_ID));

# creating Payment_Details:

create table Payment_Details(
Payment_ID varchar(40) primary key unique,
Amount int,
Payment_Status varchar(10),
Payment_Date text,
Payment_Mode varchar(25),
Shipment_SH_ID varchar(6),
Shipment_Client_C_ID int(4),
foreign key (Shipment_SH_ID) references Shipment_Details (SD_ID),
foreign key (Shipment_Client_C_ID) references customer (cust_ID));

# creating status table:

create table status (
Current_ST varchar(15),
Sent_Date text,
Delivery_Date text,
SH_ID varchar(6) primary key);

# creating employee manages shipment table:

create table Employee_Manages_Shipment(
Employee_E_ID int(5),
Shipment_SH_ID varchar(6),
Status_SH_ID varchar(6),
foreign key (Employee_E_ID) references Employee_Details (emp_id),
foreign key (Shipment_SH_ID) references shipment_Details (SD_ID),
foreign key (Status_SH_ID) references status (SH_ID));

show tables;






