select first_name,last_name,age,
case  -- its like IF ELSE statement of python 
	when age<=30 then 'young'
    when age between 31 and 40 then 'old'
    when age>40 then 'retired'
end as age_grp
from employee_demographics;

-- if salary < 50k then 5% increase
-- if salary > 50k then 7% increase
-- if working in finance dept then 10% bonus
select * 
from employee_salary as sal
join parks_departments as dept on sal.dept_id=dept.department_id ;

select first_name,last_name,salary,
case
	when salary<=50000 then salary+(salary*0.05)
    when salary>50000 then salary*1.07
end  as new_salary,
case
	when dept_id=6 then salary*.1
end as bonus
from employee_salary;