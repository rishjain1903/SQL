select *
from employee_salary
where salary >=50000;

-- procedures are like collection of code. its like functions in python. 
create procedure large_salaries()
select *
from employee_salary
where salary >=50000;

call large_salaries(); -- used to call procedure. similar to calling a function


 -- changing delimiter from ; to $  so that we can write multiple queries in procedure separated by ; and sql wont recognise as end
delimiter $$ 
create procedure large_salaries2()
begin
	select *
	from employee_salary
	where salary >=50000;
	select *
	from employee_salary
	where salary >=10000;
end $$
delimiter ;

call large_salaries2();
-- we get 2 tables as output. 1 with >50k and another >10k 


 -- passing parameter like did in functions of python. mentioning its data type is compulsory. 
 -- can put any name for parameter in bracket here its parameter_employee_id
delimiter $$ 
create procedure large_salaries3(parameter_employee_id int) 
begin  
	select salary
	from employee_salary
	where employee_id=parameter_employee_id;
	
end $$
delimiter ;

call large_salaries3(1);