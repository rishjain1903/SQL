select * 
from employee_demographics;

select * 
from employee_salary;

-- INNER JOIN
select * 
from employee_demographics as dem
join employee_salary as sal on dem.employee_id=sal.employee_id;   -- join means inner join- return rows that are common to both tables

-- if column name is same in 2 tables then specify table name or alias of that table like done below
select dem.employee_id, age,occupation
from employee_demographics as dem
join employee_salary as sal on dem.employee_id=sal.employee_id;

-- OUTER JOIN- types are = left outer and right outer join
select *
from employee_demographics as dem
left join employee_salary as sal on dem.employee_id=sal.employee_id;  -- left join= left outer join- evrything from left tbl and only matches with right table
 
select *
from employee_demographics as dem  -- table written 1st is left table and latter one is right table  
right join employee_salary as sal on dem.employee_id=sal.employee_id; -- right join= right outer join- evrything from right tbl and only matches with left table

-- JOINGING MULTIPLE TABLE
select *
from employee_demographics as dem
join employee_salary as sal on dem.employee_id=sal.employee_id
join parks_departments as pd on sal.dept_id=pd.department_id;