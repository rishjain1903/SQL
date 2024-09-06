-- Having used for conditions(aggreate functions) after Group by
-- Can not use where clause for condition with group by
select gender,avg(age)
from employee_demographics
group by gender
having avg(age)>40;


select * 
from employee_salary;


select occupation, avg(salary)
from employee_salary
where occupation like '%manager%'
group by occupation
having avg(salary) >75000
