-- Lab | SQL Queries 9
-- Create a table rentals_may to store the data from rental table with information for the month of May.
use sakila;

drop table if exists rentals_may;
create table rentals_may (
`rental_id` int unique not null,
`rental_date` datetime not null,
`inventory_id` int default null, 
`customer_id` int default null, 
`return_date` datetime default null, 
`staff_id` int not null,
`last_update` TIMESTAMP);

-- Insert values in the table rentals_may using the table rental, filtering values only for the month of May.
insert into rentals_may
select * from rental
where rental_date < '2005-06-01';

-- Create a table rentals_june to store the data from rental table with information for the month of June.
drop table if exists rentals_june;

create table rentals_june (
`rental_id` int unique not null,
`rental_date` datetime not null,
`inventory_id` int default null, 
`customer_id` int default null, 
`return_date` datetime default null, 
`staff_id` int not null,
`last_update` TIMESTAMP);

-- Insert values in the table rentals_june using the table rental, filtering values only for the month of June.
insert into rentals_june
select * from rental
where rental_date between '2005-06-01' and '2005-07-01';

-- Check the number of rentals for each customer for May.
select customer_id, count(rental_id) as 'Nº of rentals' from rentals_may
group by customer_id
order by count(rental_id) desc;

-- Check the number of rentals for each customer for June.
select customer_id, count(rental_id) as 'Nº of rentals' from rentals_june
group by customer_id
order by count(rental_id) desc;







