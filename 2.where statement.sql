select * 
from employee_salary
where salary<=50000;

select * 
from employee_demographics
where birth_date>'1985-01-01';

-- AND OR NOT -- Logical Operator
select * 
from employee_demographics
where (first_name = 'Leslie' and age=44) or age>55;

-- LIKE Statement % means anything and _means single character
select * 
from employee_demographics
where birth_date like '1989%'  
