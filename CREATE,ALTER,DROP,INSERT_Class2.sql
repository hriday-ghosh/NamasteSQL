-- CREATE: To create a new table in the database
create table amazon_orders
(
    order_id integer primary key,  -- Primary key = unique & not NULL (unique identifier)

    order_date date,               -- Stores a calendar date (YYYY-MM-DD)

    amount decimal(6,2) not null check (amount > 0),  
    -- decimal(6, 2) = total 6-digits, 2 after decimal
    -- not null = we must put a value here
    -- check (amount > 0) = amount should be greater than 0

    product_name varchar(100) not null unique, 
    -- varchar(100) = text, max 100 letters
    -- unique = this must be different in each row

    customer_id varchar(20) not null,  
    -- not null = we must put a customer_id (can't be empty)

    payment_mode varchar(15) check (payment_mode in ('UPI','CREDIT CARD','DEBIT CARD')),
    -- check (... in (...)) = only these values are allowed

    mobile_number varchar(10) default '0000000000'
    -- default = if we don't insert a phone number, it will use this
);

-- ALTER (To modify table structure)

-- ADD a new column:
alter table amazon_orders add delivery_status varchar(20);
-- delivery_status is a new column now

-- DROP (To delete a column):
alter table amazon_orders drop column delivery_status;

-- MODIFY column's datatype:
alter table amazon_orders alter column amount decimal(7,2);
-- Now amount can have total 7-digits instead of 6

-- ADD a UNIQUE constraint afterwards:
alter table amazon_orders add constraint unique_order unique (order_id);
-- Ensuring order_id must be unique across table

-- ADD a CHECK constraint afterwards:
alter table amazon_orders add constraint amount_check check (amount > 0);
-- amount must be greater than 0

-- REMOVE a constraint:
alter table amazon_orders drop constraint amount_check;

-- SELECT (To view all rows):
select * from amazon_orders;

-- INSERT (To put a row into the table):
insert into amazon_orders (order_id, amount, product_name, customer_id, payment_mode) 
values (1, 500, 'Shirt', 'Amit123', 'UPI');  
-- If we omit phone, it will take the Default phone number
