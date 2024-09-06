create temporary table temp_table
(
first_name varchar(50),
last_name varchar(50),
fav_movie varchar(50)
);
-- creates temporary table but not stored in memory. if u do select * from temp_tablein new file then also it works. 
-- if u close sql and do select * from temp_table then it wont work 
 
select *
from temp_table;

insert into temp_table
values('alex','freberg','ZNMD');

select * 
from temp_table;

-- creating a temp_table from already existing table
-- create temp-table from salary table where salary>50k
create temporary table salary_over_50k
select *
from employee_salary
where salary > 50000;

select * 
from salary_over_50k;