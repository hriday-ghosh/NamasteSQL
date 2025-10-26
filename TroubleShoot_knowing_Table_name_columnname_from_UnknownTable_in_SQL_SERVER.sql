--Step 1: Select your database
USE NamasteSQL;
GO


--Step 2: Show all tables in that database
-- Option 1: Recommended
SELECT * FROM sys.tables;

-- Option 2: Show only table names
SELECT name FROM sys.tables;

-- Option 3: Older syntax (still works)
EXEC sp_tables;




--Step 3: Check the columns of a specific table
SELECT COLUMN_NAME, DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'Superstore_orders';


--Step 4: Once you confirm the table name
SELECT order_id
FROM Superstore_orders;


