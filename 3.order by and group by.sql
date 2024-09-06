select * 
from employee_demographics;

select gender,avg(age), max(age), min(age), count(age)
from employee_demographics
group by gender;


-- ORDER BY Default in ascending
select *
from employee_demographics
order by gender,age; 

-- order by 5 means 5th column
select *
from employee_demographics
order by 5,4;  