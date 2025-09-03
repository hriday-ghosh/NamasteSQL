-- ======================
-- DDL (Data Definition Language) 
-- To define or structure the database
-- ======================

-- CREATE: To create a new table
create table amazon_orders
(
    order_id integer,  -- whole number
    order_date date,    -- calendar date
    amount decimal(6,2),  -- number with max 6-digits, 2 after decimal
    product_name varchar(100),  -- text, max 100 letters
    customer_id varchar(20),  -- text, max 20 letters
    payment_mode varchar(10)  -- text, max 10 letters
);

-- DROP: To delete a table
-- drop table amazon_orders;

-- ALTER: To modify a table (add, drop, or change column)


-- ======================
-- DML (Data Manipulation Language) 
-- To insert, update or delete data
-- ======================

-- INSERT: To add a new row
insert into amazon_orders
 values
    ('ank',
     '2023-07-25',
      5000,
     'babybee', 
     'rahulbansal',
     'Credit');  

-- UPDATE: To modify existing row(s) 
update amazon_orders set payment_mode='Credit'
where order_id = 2;

-- DELETE: To delete row(s) 
delete from amazon_orders where order_id = 1;

-- ======================
-- DQL (Data Query Language) 
-- To view or retrieve data
-- ======================

-- SELECT: To view all
select * from amazon_orders;

-- To view specific columns
select order_id, order_date, amount from amazon_orders;

-- To filter
select order_id, order_date, amount from amazon_orders where order_id = 1;

-- To order by amount (high to low)
select * from amazon_orders order by amount desc;

-- ======================
-- DATA TYPES (General Explanation) 
-- ======================

-- integer: whole number
-- bigint: large whole number
-- decimal(6,2): number with max 6-digits, 2 after decimal
-- date: calendar dates
-- varchar(100): text, max 100 letters
