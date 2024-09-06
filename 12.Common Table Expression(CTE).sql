select gender,avg(salary),max(salary),min(salary),count(salary)
from employee_demographics
join employee_salary
on employee_demographics.employee_id=employee_salary.employee_id
group by gender;


-- CTE
with cte_example as
(
select gender,avg(salary),max(salary),min(salary),count(salary)
from employee_demographics
join employee_salary
on employee_demographics.employee_id=employee_salary.employee_id
group by gender)
select * 
from cte_example;
-- when u create a cte, u need to use it immediately. if used later then it wont run


with cte_example as
(
select employee_id,gender, birth_date
from employee_demographics
where birth_date> '1985-01-01'),
cte_example2 as
(
select employee_id,salary 
from employee_salary
where salary>50000
)
select * 
from cte_example
join cte_example2
on cte_example.employee_id= cte_example2.employee_id;


