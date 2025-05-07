/* Data Types in MySQL

Data types mainly classified into three categories for every database.

1. String Data types
2. Numeric Data types
3. Date and time Data types

Numeric Types:
TINYINT : TINYINT is a numeric data type that represents a small integer value. 
It can store integer values ranging from -128 to 127 for signed TINYINT or 0 to 255 for unsigned TINYINT.

INT: Signed integer values (whole numbers). 
BIGINT: Larger signed integer values.
DECIMAL: Fixed-point decimal numbers.
FLOAT: Single-precision floating-point numbers.
DOUBLE: Double-precision floating-point numbers.

String Types:
VARCHAR: Variable-length character strings.
CHAR: Fixed-length character strings.
TEXT: Variable-length text strings.
ENUM: A set of predefined string values.


Date and Time Types:
DATE: Date values in 'YYYY-MM-DD' format.
TIME: Time values in 'HH:MM:SS' format.
DATETIME: Date and time values in 'YYYY-MM-DD HH:MM:SS' format.
TIMESTAMP: A timestamp value that gets updated automatically.  */

-- Creating Database
drop database if exists datatype_info;
create database datatype_info;
use datatype_info;

CREATE TABLE Example (
  ID INT PRIMARY KEY,
  Status TINYINT,
  Total_Sales BIGINT,
  Price DECIMAL(10,2),
  Temperature FLOAT,
  Revenue DOUBLE,
  Cust_Name VARCHAR(30),
  Ph_no CHAR(10),
  comments TEXT,
  Gender ENUM('Male','Female'),
  Order_Date DATE,
  Pickup_Time TIME,
  Delevery_Date TIMESTAMP,
  Manufacture_Year YEAR);

Insert into example
 values(1,0,89000,49000.93,23.231,9200000,'Jeevan Raj',9141919300,'Waiting for the product',
 'Male','2023-07-10','10:36:00','2023-07-11 9:30:00',2022);
select * from example;


--   These are the most commonly used datatype that mysql Supports

alter table example add column mode enum('Cash_on_delivery','Online_Payment');

update example set mode = 'Cash_on_delivery' where ID = 1;





