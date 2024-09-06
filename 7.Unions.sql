select first_name, last_name, 'Old' as label
from employee_demographics
where age>50
union
select first_name, last_name, 'Highly Paid Employee' as label
from employee_salary
where salary>70000;

select first_name, last_name, 'Old Man' as label
from employee_demographics
where age>40 and gender='Male'
union
select first_name, last_name, 'Old Lady' as label
from employee_demographics
where age>40 and gender='Female'
union
select first_name, last_name, 'Highly Paid Employee' as label
from employee_salary
where salary>70000
order by first_name,last_name;