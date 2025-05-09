Create database view_examples;
use view_examples;
select * from customer_data;
select * from orders_data;
select * from products_data;

/* 
View is a virtual table that do not store any data of their own but display the data stored in other tables.
You will not have to create complex queries involving joins repeatedly
Views helps in data security. You can use view to show only authorized information to the user and hide the sensitive information
*/

/* View Syntax: The basic syntax to create a view is as follows:
CREATE VIEW view_name AS
SELECT column1, column2, ...
FROM table
WHERE condition;  */

/* 
2. Data Retrieval: When you query a view, MySQL executes the underlying SELECT statement and returns the result as if you were querying a regular table.
3. Data Modification: Views can be used to update, insert, or delete data under certain conditions.
4. View Security: Views can provide an additional layer of security by allowing users to access a subset of data without giving direct access to the underlying tables. You can control user privileges on views separately from the underlying tables.
5. View Dependencies: Views can depend on other views or tables. If you modify the underlying tables, the data in the view will reflect those changes.
6. View Joins: Views can be created by joining multiple tables together in the SELECT statement. This allows you to simplify complex queries by encapsulating the join logic within a view.
7. Updatable Views: MySQL supports updatable views, which means you can perform data modification operations (INSERT, UPDATE, DELETE) directly on the view. However, there are certain conditions and limitations for an updatable view, such as having a single table in the underlying SELECT statement and following specific criteria.
8. View Limitations: While views provide convenience and flexibility, they have some limitations. For example, views cannot have indexes
9. View Management: You can alter existing views using the ALTER VIEW statement, drop a view using DROP VIEW, or retrieve information about views from the data dictionary tables, such as the INFORMATION_SCHEMA.VIEWS table.

*/

-- Now let me create a simple view such as i want to print all the details of the orders that has been made by customers and the total cost it generated

create view customer_summary as 
select c.customerid,c.customername,O.Date,p.productName,o.quantity,p.price, (o.quantity * p.price) as total_cost 
from customer_data c inner join orders_data o using(customerid) inner join products_data p using(productid);

select * from customer_summary;

# Granting permision to the external clint 
grant select 
on customer_summary 
to shravya;

-- Now let me make some changes in the view by adding discount percent 

create or replace view customer_summary as 
select c.customerid,c.customername,O.Date,p.productName,o.quantity as product_quantity,p.price, (o.quantity * p.price) as total_cost, discountPercent
from customer_data c inner join orders_data o using(customerid) inner join products_data p using(productid);

-- Let me update a view where ever i have kusuma as a customer i will give 30% discount because kusuma is our plus customer
update customer_summary set discountpercent =30 where customername ='kusuma';

select * from customer_summary where customername ='kusuma';





