select *
from employee_demographics;

select * 
from employee_salary;

delimiter $$
create trigger employee_insert 
	after insert on employee_salary
    for each row 
begin
	insert into employee_demographics (employee_id, first_name,last_name)
    values (new.employee_id,new.first_name,new.last_name);
end $$
delimiter ;

insert into employee_salary
values (13,'Jean','Saperstein','entertainment',1000000,null);

select *
from employee_salary;

select * 
from employee_demographics;

-- EVENTS- similar to triggers
delimiter $$
create event delete_retirees
on schedule every 30 second
do
begin
	delete 
    from employee_demographics
    where age>=60 ;
end $$
delimiter ;

select * 
from employee_demographics;

show variables like 'event%';  -- to check if event named something like "event___" is created or not. if output has on then its created
