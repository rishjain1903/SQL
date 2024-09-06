select *
from layoff_copy2;

select max(total_laid_off), max(percentage_laid_off)
from layoff_copy2;

-- to see which company was entirely closed (percent_laid_off must be 1)
select *
from layoff_copy2
where percentage_laid_off=1
order by total_laid_off desc;

select *
from layoff_copy2
where percentage_laid_off=1
order by funds_raised_millions desc;

-- company with highest laid off
select company, sum(total_laid_off)
from layoff_copy2
group by company
order by 2 desc;

select min(`date`), max(`date`)
from layoff_copy2;

-- industry with highest laid off
select industry, sum(total_laid_off)
from layoff_copy2
group by industry
order by 2 desc;

-- country with highest laid off
select country, sum(total_laid_off)
from layoff_copy2
group by country
order by 2 desc;

-- year wise highest laid off
select year(`date`), sum(total_laid_off)
from layoff_copy2
group by year(`date`)
order by 1 desc;

-- stage wise highest laid off
select stage, sum(total_laid_off)
from layoff_copy2
group by stage
order by 2 desc;

-- year, month wise total laid off 
select substring(`date`,1,7) as `month`, sum(total_laid_off)
from layoff_copy2
where substring(`date`,1,7) is not null
group by  `month`
order by 1;

-- finding a rolling total of total_laid_off year,month wise using CTE 
with rolling_total as
(
select substring(`date`,1,7) as `month`, sum(total_laid_off) as total_off
from layoff_copy2
where substring(`date`,1,7) is not null
group by  `month`
order by 1
)
select `month`,total_off , sum(total_off) over(order by `month`) as rolling_sum
from rolling_total;

select company, year(`date`), sum(total_laid_off)
from layoff_copy2
group by company, year(`date`)
order by 3 desc;

-- found top 5 companies year wise with highest laid off. used 2 CTE to do it
with company_year(company, years, total_laid_off) as
(
select company, year(`date`), sum(total_laid_off)
from layoff_copy2
group by company, year(`date`)
order by 3 desc
), company_year_wise_rank as
(select *, dense_rank() over(partition by years order by total_laid_off desc) as ranking
from company_year
where years is not null)
select * 
from company_year_wise_rank
where ranking <=5;
