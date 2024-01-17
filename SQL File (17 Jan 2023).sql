
-- DQL
-- Data query language
-- Ctrl + enter
-- Data 
show databases;
use sakila;
show tables;
describe actor;
select * from actor;
select first_name, FIRST_NAME,actor_id,
actor_id*10 as new_actor   -- it is an alias
FROM ACTOR;

-- where clause condition of how you will extract the data

select * FROM ACTOR WHERE actor_id = 3;
select * FROM ACTOR WHERE actor_id <3;

/* Comment here */

select * from actor;

select * from city;

select * from city where city_id > country_id;

select * from actor where first_name = 'Nick';

-- where clause extracts the data according to the conditions

# (Projection) --> columns , {collection) --> rows

select * from actor where actor_id between 2 and 10; 

select first_name from actor where actor_id between 2 and 10; -- between have always first vlaue is small

select * from actor where actor_id not between 2 and 10;

-- in operatior for specific values

select * from actor where actor_id in (2,4,8,11);

select * from actor where actor_id not in (2,4,8,11);

-- like
use sakila;
select * from actor where first_name = "NICK";

-- % (wild ccard character --> zeor or more character
select * from actor where first_name like 'N%'; -- for n at start

select * from actor where first_name like '%N'; -- for n at end

select * from actor where first_name like '%KE%'; -- for KE at start and end

select * from actor where first_name like '_A%'; -- for second character should be A

# logical operator and or operator

select * from actor
where first_name= "NICK" or actor_id = 32;


select * from actor
where first_name= "NICK" or actor_id in (32,100);

-- and operator have highest priority than or operator hence solved first

-- from the customer table t the customer id and fname where the fname is patrica  or mary and customer id should be = 2

select customer_id,first_name from customer
where (first_name ="PATRICIA" or first_name = "MARY" or first_name = "ELIZABETH" ) and customer_id = 2;

-- Crate database xyz use xyz and create table tushar and tushar( name varchar(20);
-- using like operator but the %

-- sorting

select * from customer
order by first_name;

use sakila;
select * from customer
order by store_id desc;


select * from customer
order by store_id desc, first_name;

-- by default asc

select * from customer
order by store_id desc, customer_id desc;

-- sort on the basis of column 
select * from customer
order by 1;

select customer_id ,first_name from customer
order by 2;

-- functions 
-- block of code (collection of statment) -> reuse multiple time
-- pre-defined / user-defined functions ( UDF )
# Pre defined
# Scalar function / multi-row function
# map => map(lambda x: x**2 , list)

# every row apply -> return

# string, number, data . general function , type_cating function

# string functions
select first_name , lower(first_name) from customer;

select first_name ,last_name,  concat(first_name, ' ', last_name) from customer;
 -- concat  method to add two columns

select first_name ,last_name,customer_id,  concat_ws(' ',first_name, last_name, customer_id) from customer;
-- concatws => concat based on the basis of seprator


select length("hello") from dual; -- dispaly the size in bytes

select length("hello") from dual;

-- Scalar function applied on whole row

select first_name, substr(first_name, 1) from actor;

select first_name, substr(first_name, -3) from actor;

select first_name, substr(first_name, 2,4) from actor;

select first_name, instr(first_name, 'e') from actor -- instring method gives the index positon of the substring
-- instr(string, substing(to find in string)

select first_name, locate('e',first_name,1) from actor;

-- trim ()  Remove all the whitspaces by default, we can give a particular character 

select trim("   Hello         ") from dual; -- dual is dummy table

-- leading( to remove a particular element from starting)
select trim(leading "h" from "hhhhhello hh") from dual; 

-- trailing
select trim(trailing "v" from "hello vinayak vvvopvvv")  from dual;
-- both
select trim(both "h" from "hhhhhello hh") from dual;   

-- lpad and rpad 
select first_name, lpad(first_name,5,"_") from actor;

-- replace

select first_name, replace(first_name, 'E', '$') from actor;  -- to replace with a certain character

select first_name from actor where substring(first_name, 1,1) = "S";

select mod(11, 2) from dual;

-- ceil and floor always give the o/p in int;
-- ceil --> Upper value , floor --> Lower value 
select ceil(11.23) from dual;

select ceil(11.000) from dual;

select floor(10.00) from dual;

select round(12.501) from dual;

select round(12.501, 2) from dual;

select round(12.571, 1) from dual;  -- round of on the basis of next digit 

select power(2,3) from dual;

select round(17.235, -1) from dual;

select round(52.267, -2) from dual;

select truncate(752.258, 2) from dual; -- without round of

select truncate (752.258 , -2) from dual;

-- General Functions / Null handling functions 

-- Null ==> No Data(pointer which represents no presence of data)

use sakila;
select * from address;

select postal_code, length(postal_code) from address;
select * from address
where postal_code = " ";
select * from  address where address2 is null;

select address_id, address2,
ifnull(address2 , 0) from address;  -- replace the Null values in address2  with 0

select password, email from staff
where password is not null;

select password , ifnull(password , 1000) , email from staff;

select password , ifnull(password , first_name) , email from staff;

select first_name, length(first_name), last_name, length(last_name), nullif(length(first_name),length(last_name) ) from actor;

select if(strcmp('hey','hey');

select if(1 >2, 1,0) from dual;

select first_name,
if (length(first_name) = 3, "abc", "No Data")
from actor;

-- To give multiple conditions 

select first_name,
	case first_name
		when "Nick" then actor_id*20
	end
    from actor;

select first_name,
	case first_name
		when "Nick" then actor_id*20
        when "PENELOPE" then actor_id*10
        else actor_id
	end "New_Actor_ID"
    from actor;

-- More Better approach :
select first_name,
	case 
		when first_name = "Nick" then actor_id*20
        when first_name = "PENELOPE" then actor_id*10
        else actor_id
	end "New_Actor_ID"
    from actor;
-- print the actor id , firstname, for the user based on conditio if actor id more thanor  = 2 the print actor id is morethan two
-- if the actor id is between 5-7 print id between 5 and 7 , if the actor id is more than 12 print actor id is more than 12 else print no cond is verifed

select first_name , actor_id,
	case 
        when actor_id > 12 then "actor id is more than 12"
        when actor_id > 5 and actor_id <7 then "actor id id between 5 and 7 "
        when actor_id > 2 then "actor_id is more than 2"
        else "no cond is verifed"
	end "New Actor ID"
from actor;



