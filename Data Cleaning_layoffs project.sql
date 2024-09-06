select * 
from layoffs;

-- Aim:
-- 1.Remove Duplicates 
-- 2.Standardize data
-- 3.Null values or blank values
-- 4.Remove any columns

-- creating a copy of table bcoz we will make changes in layoff_copy and for referrence we need original db 
create table layoff_copy  -- this method creates similar schema like original db
like layoffs;

select * 
from layoff_copy;

insert into layoff_copy  -- inserting all values from original db into layoff_copy 
select * 
from layoffs;

select *,
row_number() over ( partition by company,location,industry,total_laid_off,percentage_laid_off,`date`,stage,country,funds_raised_millions) as row_num
from layoff_copy;

with duplicate_row as
(
select *,
row_number() over ( partition by company,location,industry,total_laid_off,percentage_laid_off,`date`,stage,country,funds_raised_millions) as row_num
from layoff_copy
)
select *
from duplicate_row
where row_num >1;

CREATE TABLE `layoff_copy2` (
  `company` text,
  `location` text,
  `industry` text,
  `total_laid_off` int DEFAULT NULL,
  `percentage_laid_off` text,
  `date` text,
  `stage` text,
  `country` text,
  `funds_raised_millions` int DEFAULT NULL,
  `row_num` int
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


select * 
from layoff_copy2;

insert into layoff_copy2
select *,
row_number() over ( partition by company,location,industry,total_laid_off,percentage_laid_off,`date`,stage,country,funds_raised_millions) as row_num
from layoff_copy;

select *
from layoff_copy2
where row_num>1;

delete   -- 1.removed duplicates done
from layoff_copy2
where row_num>1;

--  2.Standardizing data
select company , trim(company)  -- trim removes start and end spaces
from layoff_copy2;

update layoff_copy2
set company =trim(company);

select *
from layoff_copy2
where industry like 'Crypto%';

update layoff_copy2
set industry = 'Crypto'
where industry like 'Crypto%';  -- rename CryptoCurrency, Crypto Currency to Crypto

select distinct country, trim(trailing '.'from country)  -- Removed . from end in country = 'united states.'
from layoff_copy2
order by 1;

update layoff_copy2
set country= trim(trailing '.'from country)
where country like 'United States%';

select `date`,
str_to_date(`date`, '%m/%d/%Y')  -- Converted date column from text to date format but datatype is still text and in format mm/dd/yyyy. small 'm',small 'd', caps'Y' in str_to_date fn  
from layoff_copy2;

update layoff_copy2
set `date` = str_to_date(`date`, '%m/%d/%Y');

select `date`
from layoff_copy2;

alter table layoff_copy2
modify column `date` date; -- this changed date column ka datatype from text to date

select *
from layoff_copy2;

--  3.Null and blanck values
select *
from layoff_copy2
where total_laid_off is null
and percentage_laid_off is null;

select *
from layoff_copy2
where industry is null -- find where industry is null
or industry = '';  -- find where industry is blank 

select *
from layoff_copy2
where company = 'airbnb'; -- to see if other row of company=airbnb has industry written or not. if yes then we can replce the blank with it

select *
from layoff_copy2 t1
join layoff_copy2 t2
on t1.company=t2.company
where (t1.industry is null or t1.industry = '')
and t2.industry is not null;

update layoff_copy2
set industry = null
where industry ='';  -- convert blank to null 

update layoff_copy2 t1
join layoff_copy2 t2
on t1.company = t2.company 
set t1.industry =  t2.industry
where t1.industry is null
and t2.industry is not null;  -- copied industry where it was blank. but first convert it to null and then did it

select *
from layoff_copy2;

select *
from layoff_copy2
where total_laid_off is null
and percentage_laid_off is null;

-- deleting rows where total_laid_off and percentage_laid_off is null bcoz its of no use
delete 
from layoff_copy2
where total_laid_off is null
and percentage_laid_off is null;

alter table layoff_copy2
drop column row_num; -- removed row_num column as now its of no use 