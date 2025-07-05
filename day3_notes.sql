-- DDL (Data Definition Language)
-- Creates a new table structure
CREATE TABLE table_name (...); 

-- Removes a column from an existing table
ALTER TABLE table_name DROP COLUMN column_name; 

-- Deletes the entire table from the database
DROP TABLE table_name;

-- DML (Data Manipulation Language)
-- Inserts a new row into the table
INSERT INTO table_name (column1, column2) VALUES (value1, value2);

-- Deletes rows matching the condition
DELETE FROM table_name WHERE condition;

-- Updates existing data in rows that match the condition
UPDATE table_name SET column1 = value1 WHERE condition;

-- DQL (Data Query Language)
-- Fetches all rows and columns from the orders table
SELECT * FROM orders;

-- Selects only specific columns from orders table
SELECT order_date, product_name, order_id FROM orders;

-- Gets the first 5 rows based on default sorting (use LIMIT in MySQL)
SELECT order_date, order_id FROM orders LIMIT 5;

-- Fetches all columns, sorting by date descending and then by customer ID
SELECT * FROM orders ORDER BY order_date DESC, customer_id;

-- Returns the latest 10 orders by order_date
SELECT * FROM orders ORDER BY order_date DESC LIMIT 10;

-- WHERE clause (for filtering data)

-- Selects orders where category is 'Furniture'
SELECT order_id, order_date, category, sales 
FROM orders
WHERE category = 'Furniture';

-- Filters orders where category is either 'Furniture' or 'Technology'
SELECT order_id, order_date, category, sales 
FROM orders
WHERE category IN ('Furniture','Technology');

-- Filters orders where quantity is not equal to 3
SELECT order_id, order_date, category, sales, quantity
FROM orders
WHERE quantity != 3;

-- Filters quantity where it's exactly one of 4,5,6,7,8
SELECT order_id, order_date, category, sales, quantity
FROM orders
WHERE quantity IN (4,5,6,7,8);

-- Filters quantity between 4 and 8 (inclusive)
SELECT order_id, order_date, category, sales, quantity
FROM orders
WHERE quantity BETWEEN 4 AND 8;

-- Shows unique categories in the orders table
SELECT DISTINCT category FROM orders;

-- Shows unique quantities in range 4–8, sorted
SELECT DISTINCT quantity FROM orders
WHERE quantity BETWEEN 4 AND 8
ORDER BY quantity;

-- Filters rows where quantity is not in the range 4–8
SELECT order_id, order_date, category, sales, quantity
FROM orders
WHERE quantity NOT BETWEEN 4 AND 8;

-- Filters orders excluding categories 'Furniture' and 'Technology'
SELECT order_id, order_date, category, sales 
FROM orders
WHERE category NOT IN ('Furniture','Technology');

-- Filters orders on an exact date match
SELECT order_id, order_date, category, sales 
FROM orders
WHERE order_date = '2019-10-11';

-- Filters orders that fall within January 2020
SELECT order_id, order_date, category, sales 
FROM orders
WHERE order_date BETWEEN '2020-01-01' AND '2020-01-31'
ORDER BY order_date;

-- Filters orders with category 'Furniture' and segment 'Consumer'
SELECT order_id, order_date, category, segment, sales 
FROM orders
WHERE category = 'Furniture' AND segment = 'Consumer';

-- Filters orders where category is either 'Furniture' or 'Technology'
SELECT order_id, order_date, category, segment, sales 
FROM orders
WHERE category = 'Furniture' OR category = 'Technology';

-- Combines multiple AND/OR conditions in grouped filters
SELECT order_id, order_date, category, segment, sales, quantity
FROM orders
WHERE (category = 'Furniture' AND quantity BETWEEN 3 AND 5)
   OR (order_date BETWEEN '2020-01-01' AND '2020-01-31' AND segment = 'Consumer');

-- Shows orders for January 2020
SELECT order_id, order_date, category, sales 
FROM orders
WHERE order_date BETWEEN '2020-01-01' AND '2020-01-31';

-- ❌ Incorrect NULL check (this will never return rows)
SELECT * FROM orders
WHERE postal_code = NULL;

-- ✅ Correct NULL check for city not being empty and quantity = 3
SELECT * FROM orders 
WHERE city IS NOT NULL AND quantity = 3;

-- LIKE queries (pattern matching)

-- Finds customers whose name contains "ab" anywhere
SELECT order_id, customer_name, order_date, quantity
FROM orders
WHERE customer_name LIKE '%ab%';

-- Matches names starting with "m", any one character, then "t" (e.g., "mat", "mit")
SELECT order_id, customer_name, order_date, quantity
FROM orders
WHERE customer_name LIKE 'm_t%';

-- Excludes customer names that contain "e_g" pattern
SELECT order_id, customer_name, order_date, quantity
FROM orders
WHERE customer_name NOT LIKE '%e_g%';

-- Complex pattern using wildcards and character sets (might not work fully in MySQL)
SELECT order_id, customer_name, order_date, quantity
FROM orders
WHERE customer_name LIKE '%e[i apq][anc]g%';

-- Negated space after 'e', pattern matching (might not be valid in MySQL)
SELECT order_id, customer_name, order_date, quantity
FROM orders
WHERE customer_name NOT LIKE '%e[^ ]g%';

-- Excludes customer names where there's 'e' followed by a-d and 'g'
SELECT order_id, customer_name, order_date, quantity
FROM orders
WHERE customer_name NOT LIKE '%e[a-d]g%';

-- Matches names starting with "a" and then any letter a to f
SELECT order_id, customer_name, order_date, quantity
FROM orders
WHERE customer_name LIKE 'a[a-f]%';

-- Finds names containing at least two "a"s
SELECT order_id, customer_name, order_date, quantity
FROM orders
WHERE customer_name LIKE '%a%a%';

-- FROM: tells SQL which table to use
-- WHERE: filters rows based on conditions
-- SELECT DISTINCT: returns unique (non-duplicate) values
-- ORDER BY: sorts rows based on specified column(s)
-- LIMIT (MySQL): returns a fixed number of rows
-- LIKE: searches using patterns
-- IS NULL / IS NOT NULL: checks if a value is null
