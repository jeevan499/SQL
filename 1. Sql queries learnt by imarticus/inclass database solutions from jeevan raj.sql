#Q1. Print product, price, sum of quantity more than 5 sold during all three months.  

select * from bank_inventory_pricing;
select * from bank_branch_pl;

select product, price, sum(quantity) from bank_inventory_pricing  group by product having sum(quantity) >5;

#Q2.Print product, quantity , month and count of records for which estimated_sale_price is less than purchase_cost

select product, quantity, month,count(*) from bank_inventory_pricing where estimated_sale_price <purchase_cost group by product;

#Q3. Extarct the 3rd highest value of column Estimated_sale_price from bank_inventory_pricing dataset

select Estimated_sale_price from (select * from bank_inventory_pricing order by Estimated_sale_price desc limit 3) as estimated_sales_price order by Estimated_sale_price limit 1;

# same question in different way of solving
select Estimated_sale_price from (select distinct ifnull(estimated_sale_price,0) as estimated_sale_price from bank_inventory_pricing order by Estimated_sale_price desc limit 3) price order by Estimated_sale_price limit 1 ;       # replacing some value with 0 by using ifnull statement 

# using dense rank if we have an duplicate values    ( dense rank will give you the best result)
# row number function cannot be used in distinct values 

select Estimated_sale_price from (select distinct ifnull(estimated_sale_price,0) as
estimated_sale_price,dense_rank() over (order by Estimated_sale_price desc ) as row_num 
from bank_inventory_pricing) t where row_num =3 ;       # replacing some value with 0 by using ifnull statement 


#Q4. Count all duplicate values of column Product from table bank_inventory_pricing

select count(*) from (select product,count(product) as times from bank_inventory_pricing group by product having count(product)>1) as t;


#Q5. Create a view 'bank_details' for the product 'PayPoints' and Quantity is greater than 2 

create or replace view bank_details as select product , quantity from bank_inventory_pricing where  product ='paypoints' and Quantity>2;

select * from  bank_details;

#Q6 Update view bank_details1 and add new record in bank_details1.
-- --example(Producct=PayPoints, Quantity=3, Price=410.67)

create or replace view bank_details1 as select * from bank_inventory_pricing;
insert into bank_details1 values('paypoints',3,410.67,null,425.98,3);
select * from bank_details1;

#Q7.Real Profit = revenue - cost  Find for which products, branch level real profit is more than the estimated_profit in Bank_branch_PL.

select * from bank_branch_pl;
desc bank_branch_pl;

select product,branch,(revenue-cost) as realprofit, Estimated_profit from bank_branch_pl where (revenue-cost)>Estimated_profit ;    # revenue - cost = calculated profit

#Q8.Find the least calculated profit earned during all 3 periods

select month,min(revenue - cost) as realprofit from bank_branch_pl group by month;

#Q9. In Bank_Inventory_pricing, 
-- a) convert Quantity data type from numeric to character 
-- b) Add then, add zeros before the Quantity field.  

alter table bank_inventory_pricing modify Quantity char (5);       # lpad() -> left pad  ,   length() -> length number gives the number of char

select product,lpad(quantity,5,'0') from bank_inventory_pricing;                # we do pading because when we want to right ----5


#Q11.Reduce 30% of the cost for all the products and print the products whose  calculated profit at branch is exceeding estimated_profit .


select branch, product,(revenue - cost *.7) as realprofit, estimated_profit from bank_branch_pl where (revenue *(1-0.3))> Estimated_profit;

#Q12.Write a MySQL query to print the observations from the Bank_Inventory_pricing table excluding the values “BusiCard” And “SuperSave” from the column Product

select * from bank_inventory_pricing where product not in ('busicard','supersave');

#Q13. Extract all the columns from Bank_Inventory_pricing where price between 220 and 300

select * from bank_inventory_pricing where price between 220 and 300;

#Q14. Display all the non duplicate fields in the Product form Bank_Inventory_pricing table and display first 5 records.

select * from (select * from bank_inventory_pricing group by product having count(product) =1) product  limit 5;

#Q15.Update price column of Bank_Inventory_pricing with an increase of 15%  when the quantity is more than 3.

update bank_inventory_pricing set price =price * 1.15 where quantity >3;      # price *0.15

#Q16. Show Round off values of the price without displaying decimal scale from Bank_Inventory_pricing

select round(price) from bank_inventory_pricing;

#Q17.Increase the length of Product size by 30 characters from Bank_Inventory_pricing.

alter table bank_inventory_pricing modify product varchar(30);

#Q18. Add '100' in column price where quantity is greater than 3 and dsiplay that column as 'new_price' 

alter table bank_inventory_pricing add column new_price float;
desc bank_inventory_pricing;
select product,price,quantity,new_price from bank_inventory_pricing;

select * from bank_inventory_pricing;
update bank_inventory_pricing set new_price = 100+price where quantity >3;





