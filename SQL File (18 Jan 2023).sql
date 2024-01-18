select * from actor;

desc actor;
select curdate() from dual;
select curtime() from dual;

select now() from dual;

select last_update, adddate(last_update, 1)
from actor;

select last_update, date(last_update)
from actor;

select datediff(curdate(), "2024-01-22")
from dual;

-- date format
select date_format(curdate(), "%Y / %M / %D / %a") from dual;

select str_to_date("12 15 , 2024", '%m %d, %Y') from dual;

select year(curdate()) from dual;

select extract(year from curdate()) from dual;

select last_update ,extract(year from last_update) from actor;

select from_unixtime(1447430940);



/* Now we work on group of rows  = Multi Row functions*/
select count(address_id) from address;

select count(address2) from address; -- count does not count the null values

select sum(city_id) from address;

select max(city_id) from address;

select min(city_id) from address;

select count(*) from address;

select count(*) from address where district = "Haryana";

select * from address;

select count(district) from address;

select count(distinct(district)) from address;

select district , count(*)
from address group by district;


select district , count(*), sum(city_id)
from address group by district
order by count(*) desc; 

-- Having clause : This clause is used only when we want to filter data on group by


select district , count(*), sum(city_id)
from address group by district
having count(*) >= 9
order by count(*) desc;


select district, count(*), sum(city_id) 
from address where district in ("Alberta","California");

 
use employees;
show tables;
select * from employees;
