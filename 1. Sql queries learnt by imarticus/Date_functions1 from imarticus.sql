use customer_info;

## Selecting system date and time using now()
select now();

## Selecting only date part from system date using curdate()
select curdate();

## Extracting only date from now()  which is equal to curdate()
select date(now());

drop table if exists salesorders;
CREATE TABLE SalesOrders (
    ID INTEGER,
    CustomerID Integer,
    OrderDate Date,
    FinancialCode Char( 2 ),
    Region Char( 7 ),
    SalesRepresentative Integer);
    
INSERT INTO SalesOrders VALUES(2001, 101, '2000-03-16', 'r1', 'Eastern', 299);
INSERT INTO SalesOrders VALUES( 2002, 102, '2000-03-17', 'r2', 'Western', 399);
INSERT INTO SalesOrders VALUES (2003, 103, '2000-03-18', 'r3', 'Western', 499);
INSERT INTO SalesOrders VALUES (2004, 104, '2001-01-02', 'y1', 'Eastern', 599);
INSERT INTO SalesOrders VALUES (2005, 105, '2001-01-03', 'y2', 'Western', 699);
INSERT INTO SalesOrders VALUES (2006, 106, '2001-01-04', 'y3', 'Eastern', 799);
INSERT INTO SalesOrders VALUES (2007, 107, '2007/01/04', 'y3', 'Eastern', 799);
INSERT INTO SalesOrders VALUES (2007, 108, str_to_date('23/08/2007','%d/%m/%Y'), 'y5', 'Eastern', 899);
INSERT INTO SalesOrders VALUES (2008, 109, '2003/03/15', 'y3', 'Eastern', 799);
INSERT INTO SalesOrders VALUES (2009, 110, '2003/03/20', 'y3', 'Eastern', 799);
update salesorders set
orderdate = '2000-03-15'
where id = 2008;
update salesorders set
orderdate = '2000-03-20'
where id = 2009;
select * from salesorders;

## Selecting data between two dates.  The default date format is YYYY-MM-DD
SELECT *
FROM salesorders
where OrderDate between '2000-03-15' and '2000-03-20';

## Selecting data with only year part
SELECT * FROM salesorders WHERE YEAR(OrderDate) <= 2001;       # year(orderdate) will prints only the year

select month(orderdate), day(orderdate), count(*) 
from salesorders 
group by month(orderdate), day(orderdate)
order by month(orderdate), day(orderdate);

## Selecting only the unique month from orderdate
select distinct month(orderdate) from salesorders order by month(orderdate) desc;
select distinct monthname(orderdate) from salesorders;                               # month name will prints the name of the month(like 01 = january)

## 
select str_to_date(orderdate,"%Y-%m-%d") from salesorders;           # str_to_date will convert string format to date format
select date_format(orderdate,"%d-%m-%Y") from salesorders;           # date_format will display the date in whichever format you want

select date_format(date_add(str_to_date('20/10/2020', '%d/%m/%Y'),interval +30 day),'%d/%m/%Y') '3Type format';      # printing 3type of date format and giving alias as 3type format


## Str_to_date will help to format the date string to date
SELECT date_add(STR_TO_DATE('August,5,2017', "%M,%d,%Y"), interval 30 day);
SELECT STR_TO_DATE('Monday, August 14, 2017', '%W, %M %d, %Y');

## Dateadd function
select date_add(curdate(), interval 28 day);
SELECT DATE_ADD(curdate(), interval 1 month);
select date_add(curdate(), interval 1 year);
SELECT DATE_ADD("2021-06-04", INTERVAL -2 MONTH);
SELECT DATE_FORMAT(curdate(),'%D %y %a %d %m %b %j');     # D=25th, y=year last 2number, a=week 3char,d=date(25),m=month in number(12),b=month in 3char, j=total no of days from 01jan
