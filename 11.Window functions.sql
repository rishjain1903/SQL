select gender, avg(salary)
from employee_demographics
join employee_salary 
on employee_demographics.employee_id=employee_salary.employee_id
group by gender;


select gender, avg(salary) over()
from employee_demographics
join employee_salary 
on employee_demographics.employee_id=employee_salary.employee_id;


select gender, avg(salary) over(partition by gender)  -- over is  window fn
from employee_demographics
join employee_salary 
on employee_demographics.employee_id=employee_salary.employee_id;


select employee_demographics.employee_id,gender,salary, avg(salary) over(partition by gender order by employee_demographics.employee_id)
from employee_demographics
join employee_salary 
on employee_demographics.employee_id=employee_salary.employee_id;


select employee_demographics.employee_id,gender,salary, sum(salary) over(partition by gender order by employee_demographics.employee_id)
from employee_demographics
join employee_salary 
on employee_demographics.employee_id=employee_salary.employee_id;


select employee_demographics.employee_id,gender,salary,
row_number() over(partition by gender order by salary desc) as row_num,  -- gives row no.- unique no. to each one 
rank() over(partition by gender order by salary desc) as rank_num,  -- gives ranking- if same then gives same rank and 
-- next rank is skipped (here rank 6 is skipped)
dense_rank() over(partition by gender order by salary desc) as dense_rank_num  -- gives ranking- if same then gives same rank and 
-- next rank is not skipped
from employee_demographics
join employee_salary 
on employee_demographics.employee_id=employee_salary.employee_id;