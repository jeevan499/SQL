drop database if exists cereals;

create database cereals;
use cereals;
show tables;
select * from cereals_data;

alter table cereals_data modify name varchar(50) primary key;

#1. Add index name fast on name

create index nickname on cereals_data (name);
show indexes from cereals_data;

#2. Describe the schema of table

describe table cereals_data;

# 3. Create view name as see where users can not see type column [first run appropriate query then create view]

create view see as select name,mfr,calories,protein,fat,sodium,fiber,carbo,sugars,potass,vitamins,shelf,weight,cups,rating from cereals_data ;
select * from see;

# 4. Rename the view as saw
rename table see to saw;

#5. Count how many are cold cereals
select * from cereals_data;
select count(*) from cereals_data where type='c';

#6. Count how many cereals are kept in shelf 3
select count(*) from cereals_data where shelf=3;

#7. Arrange the table from high to low according to ratings
select * from cereals_data;
select * from cereals_data order by rating desc;

#8. Suggest some column/s which can be Primary key
# a column (or a set of columns) whose value exists and is unique for every record in a table is called primary key
# according to me the column name ='name' looks like primary key for this table

#9. Find average of calories of hot cereal and cold cereal in one query
select * from cereals_data;
select type,avg(calories) from cereals_data group by type;

#10. Add new column as HL_Calories where more than average calories should be categorized as HIGH and less than average calories should be categorized as LOW

alter table cereals_data add HL_Calories varchar(5);
update cereals_data set HL_calories='HIGH' where calories >=106.9737;
select avg(calories) from cereals_data;
update cereals_data set HL_calories='LOW' where calories <106.9737;

#11. List only those cereals whose name begins with B
select * from cereals_data where name regexp '^b';

#12. List only those cereals whose name begins with F
select * from cereals_data where name regexp '^f';

# 13. List only those cereals whose name ends with s
select * from cereals_data where name regexp 's$';

# 14. Select only those records which are HIGH in column HL_calories and mail to vinodanalytics@gmail.com [save/name your file as <your first name_cereals_high>]

select * from cereals_data where HL_calories='high';
# mail has sent to vinod sir

# 15. Find maximum of ratings
select max(rating) from cereals_data;

# 16. Find average ratings of those were High and Low calories
select * from cereals_data;
select hl_calories,avg(rating) from cereals_data group by hl_calories;

# 17. Craete two examples of Sub Queries of your choice and give explanation in the script itself with remarks by using #

# we are going to find the second higest rating from cereals_data
select max(rating) as 'second highest rating'from cereals_data where rating <(select max(rating) from cereals_data) ; 

# finding the name of those who have higest rating who has max calories
select name from cereals_data where calories =(select max(calories) from cereals_data having max(rating));

#18. Remove column fat
alter table cereals_data drop fat;

select * from cereals_data;

# 19. Count records for each manufacturer [mfr]

select mfr,count(mfr) from cereals_data group by mfr;

#20. Select name, calories and ratings only
select name,calories,rating from cereals_data;









