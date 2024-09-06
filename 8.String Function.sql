select length('skyfall');

select first_name,length(first_name)
from employee_demographics
order by length(first_name);

select upper('sky');
select lower('SKY');

select first_name,upper(first_name)
from employee_demographics;

select trim('   sky   ');  -- trim removes starting and ending ke spaces
select ltrim('   sky   '); -- ltrim=left trim removes starting ke spaces
select rtrim('   sky   '); -- rtrim=right trim removes ending ke spaces

select first_name, 
left (first_name,4), -- selects 4 letter of first_name from left side 
right (first_name,4), -- selects 4 letter of first_name from right side
birth_date,
substring(birth_date,6,2) as birth_month -- selects specific part of data. 
-- here its starts from 6th position of birth_date and selects 2 positions after that ie 6th and 7th 
from employee_demographics;

select first_name, replace(first_name,'a','z') -- replaces small 'a' with small 'z'  
from employee_demographics;

select locate('i','rishabh'); -- tells position of letter 'i' in 'rishabh'

select first_name,last_name, 
concat(first_name,' ',last_name) as full_name  -- combines 2 columns and this- ' ' adds space btw 2 columns  
from employee_demographics;