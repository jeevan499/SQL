drop database if exists  clinical;
create database clinical;
use clinical;
show tables;
select * from clinictrial;

# 1. Add index name fast on name
alter table clinictrial  modify name varchar(30) primary key;

CREATE INDEX medical  ON clinictrial (Name);

show indexes from clinictrial;

#2. Describe the schema of table
describe table clinictrial;

#3. Find average of Age
select avg(age) from clinictrial;

#4. Find minimum of Age
select min(age) from clinictrial;

#5. Find maximum of Age
select max(age) from clinictrial;


#6. Find average age of those were pregnant and not pregnant
select avg(age) from clinictrial where pregnant ='no';
select avg(age) from clinictrial where pregnant ='yes';

#7. Find average blood pressure of those had drug reaction and did not had drug reaction

select avg(bp) from clinictrial where drug_reaction ='yes';
select avg(bp) from clinictrial where drug_reaction ='no';

#8. Add new column name as ‘Age_group’ and those having age between 16 & 21 should be categorized as Low, more than 21 and less than 35 should be categorized as Middle and above 35 should be categorized as High.

ALTER TABLE clinictrial ADD age_group varchar(10) ;

update clinictrial set age_group ='low' where age between 16 and 21;
update clinictrial set age_group ='middle' where age between 21 and 35;
update clinictrial set age_group ='high' where age>35 ;

#9. Change ‘Age’ of Reetika to 32
select * from clinictrial;
update clinictrial set age =32 where name='reetika';

# 10. Change name of Reena as Shara’

update clinictrial set name ='shara' where name='reena';

#11. Remove Chlstrl column
alter table clinictrial drop chlstrl;

#12. Select only Name, Age and BP

select name,age,bp from clinictrial;

#13. Select ladies whose first name starts with ‘E’
select * from clinictrial;
select * from clinictrial where name like 'e%';

#14. Select ladies whose Age_group were Low

select * from clinictrial where age_group ='low';

# 15. Select ladies whose Age_group were High

select * from clinictrial where age_group ='high';

#16. Select ladies whose name starts with ‘A’ and those were pregnant

select * from clinictrial where pregnant ='yes' and name regexp '^a' ;

# 17. Identify ladies whose BP was more than 120

select * from clinictrial where bp >120;

# 18. Identify ladies whose BP was between 100 and 120

select * from clinictrial where bp between 100 and 120;

#19. Identify ladies who had low anxiety aged less than 30

select * from clinictrial where anxty_lh ='no' and age <30;

#20. Select ladies whose name ends with ‘i’

select * from clinictrial where name regexp 'i$';

# 21. Select ladies whose name ends with ‘a’

select * from clinictrial where name regexp 'a$';

# 22. Select ladies whose name starts with ‘K’

select * from clinictrial where name regexp '^k';

# 23. Select ladies whose name have ‘a’ anywhere

select * from clinictrial where name regexp 'a';

#24. Order ladies in ascending way based on ‘BP’

select * from clinictrial order by bp;

# 25. Order ladies in descending way based on ‘Age’

select * from clinictrial order by age desc;



