-- DATA DEFINITION LANGUAGE (DDL) ------------------------------------------------------------------

-- Create New Schema or Database
CREATE SCHEMA test;

-- Create New Table
CREATE TABLE users(id INT PRIMARY KEY AUTO_INCREMENT NOT NULL, name VARCHAR(45) NOT NULL, email VARCHAR(45) NOT NULL UNIQUE, password VARCHAR(45) NOT NULL, date_added DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP);

-- Drop Table
DROP TABLE users;

-- END OF DATA DEFINITION LANGUAGE (DDL) ------------------------------------------------------------------

-- DATA MANIPULATION LANGUAGE (DML) ------------------------------------------------------------------

-- Get All Rows
SELECT * FROM employees;

-- Get Specific Row
SELECT * FROM employees WHERE EmployeeID = 1;

-- Get All Rows with Specific Columns
SELECT FirstName, LastName FROM employees;

-- WHERE Clause
SELECT * FROM customers WHERE Country = 'France';

-- AND
SELECT * FROM customers WHERE Country = 'France' AND City = 'Strasbourg';

-- OR
SELECT * FROM customers WHERE Country = 'France' OR PostalCode = 05021;

-- Parenthesis is used to isolate conditions
SELECT * FROM customers WHERE Country = 'Mexico' AND (PostalCode = 05021 OR City = 'Nantes');

-- NOT
SELECT * FROM customers WHERE NOT Country = 'France';

-- IS NULL
SELECT * FROM customers WHERE City IS NULL;

-- IS NOT NULL
SELECT * FROM customers WHERE City IS NOT NULL;

-- LIMIT - used for pagination, get top 3 customers
SELECT * FROM customers LIMIT 3;

-- ORDER BY
SELECT * FROM orders ORDER BY OrderDate;
SELECT * FROM orders ORDER BY OrderDate ASC;
SELECT * FROM orders ORDER BY OrderDate DESC;
SELECT * FROM customers ORDER BY COUNTRY, City;
SELECT * FROM customers ORDER BY COUNTRY DESC, City DESC;
SELECT * FROM customers WHERE Country = 'Brazil' ORDER BY COUNTRY DESC, City DESC;
SELECT * FROM orders ORDER BY OrderDate DESC LIMIT 10; -- Get latest 10 orders

-- AS for Alias
SELECT CustomerName AS Customer FROM customers ORDER BY CustomerName;
SELECT CONCAT(FirstName, ' ', LastName) AS full_name FROM employees;

-- AGGREGATE FUNCTION: COUNT
SELECT COUNT(OrderID) AS total_orders FROM orders;

-- AGGREGATE FUNCTION: SUM
SELECT SUM(Quantity) AS total_qty FROM order_details;
SELECT SUM(Quantity) AS total_qty FROM order_details WHERE ProductID = 11;

-- AGGREGATE FUNCTION: MAX
SELECT MAX(Quantity) AS max_qty FROM order_details;

-- AGGREGATE FUNCTION: MIN
SELECT MIN(Quantity) AS min_qty FROM order_details;

-- AGGREGATE FUNCTION: AVG
SELECT AVG(Quantity) AS avg_qty FROM order_details;

/*
Multi-line comment
*/

-- DISTINCT 
SELECT DISTINCT Country FROM customers ORDER BY Country;
SELECT COUNT(DISTINCT Country) FROM customers ORDER BY Country;

-- IFNULL
SELECT *, IFNULL(City, 'DEFAULT ADDRESS') AS CustomerCity FROM customers;

-- COALESCE
SELECT *, COALESCE(Address, City, 'DEFAULT_ADDRESS') AS CustomerAddress FROM customers;

-- CHARLENGTH
SELECT CHAR_LENGTH(CustomerName) FROM customers;

-- BETWEEN for range
SELECT * FROM orders WHERE OrderID BETWEEN 10248 AND 10255;
SELECT * FROM orders WHERE OrderDate BETWEEN '1996-07-04' AND '1996-07-16';

-- LIKE for searching - only for simple search
SELECT * FROM customers WHERE CustomerName LIKE 'a%';
SELECT * FROM products WHERE ProductName LIKE '%choco%';
SELECT * FROM products WHERE ProductName LIKE '_hef%';
SELECT * FROM customers WHERE CustomerName NOT LIKE 'a%';

-- REGEXP for Regular Expression - best for complex search
SELECT * FROM products WHERE ProductName REGEXP '^[A-C]+';
SELECT * FROM products WHERE ProductName NOT REGEXP '^[A-C]+';

-- WHERE IN - like or clauses
SELECT * FROM customers WHERE Country IN ('Germany', 'France');
SELECT * FROM order_details WHERE ProductID IN (
SELECT ProductID FROM products WHERE Price BETWEEN 18 AND 20 -- subquery
);

-- WHERE EXISTS - works like JOIN statement
SELECT SupplierName FROM suppliers WHERE EXISTS (
	SELECT ProductID FROM products WHERE products.SupplierID = suppliers.SupplierID
);

-- SELECT INTO - for variables
SELECT * FROM employees;
SELECT LastName INTO @lastname FROM employees WHERE EmployeeID = 1; -- only 1 row is allowed
SELECT FirstName, LastName INTO @firstname, @lastname FROM employees WHERE EmployeeID = 1; -- only 1 row is allowed
SELECT CONCAT(@firstname, ' ', @lastname) AS full_name;
SELECT Price INTO @price FROM products WHERE ProductID = 1;
SELECT @price * 1000 AS price;
SELECT * FROM products WHERE Price < @price;

-- INSERT INTO - for inserting new record
INSERT INTO products(ProductName, SupplierID, CategoryID, Unit, Price) VALUES('Band Aid', 1, 1, '10 boxes x 20 bags', 4);
INSERT INTO products(ProductName, SupplierID, CategoryID, Unit, Price) VALUES('Bluetooth Speaker', 1, 1, '20 items', @price);

-- UPDATE SET - for updating existing record
UPDATE products SET Price = @price * 100 WHERE ProductID = 79;

-- DELETE FROM - for deleting existing record
DELETE FROM products WHERE productID = 79;

-- GROUP BY
-- get total customers per city
SELECT City, COUNT(CustomerID) AS totalCustomers FROM customers GROUP BY City;

-- get max price per category
SELECT CategoryID, MAX(Price) AS maxPrice FROM products GROUP BY CategoryID;

-- get total quantity per order
SELECT OrderID, SUM(Quantity) FROM order_details GROUP BY OrderID;

-- get total quantity ordered per products
SELECT ProductID, SUM(Quantity) AS totalQuantity FROM order_details GROUP BY ProductID;

-- get the best selling product
SELECT ProductID, SUM(Quantity) AS totalQuantity FROM order_details GROUP BY ProductID ORDER BY totalQuantity DESC LIMIT 1;

-- HAVING - works like WHERE statement for GROUP BY only because WHERE cannot be used with GROUP BY
SELECT ProductID, SUM(Quantity) AS totalQuantity FROM order_details GROUP BY ProductID HAVING totalQuantity >= 100;

-- UNION ALL 
-- used to combine rows/result-set of 2 or more SELECT statement; should have same number of columns
-- can also be used to combine rows of multiple tables
SELECT * FROM products WHERE CategoryID = 1
UNION ALL
SELECT * FROM products WHERE CategoryID = 2;

SELECT ProductID, ProductName, CategoryID FROM products WHERE CategoryID = 1
UNION ALL
SELECT SupplierID, SupplierName, NULL FROM suppliers WHERE SupplierID = 2;

-- UNION 
-- only select distinct rows
SELECT * FROM categories WHERE CategoryID = 1
UNION
SELECT * FROM categories WHERE CategoryID = 2
UNION
SELECT * FROM categories WHERE CategoryID = 2;

-- CASE
SELECT ProductID, 
CASE
WHEN SUM(Quantity) > 450 THEN 'Restock'
WHEN SUM(Quantity) > 300 THEN 'Ready'
ELSE 'Enough'
END AS inventory_status
FROM order_details GROUP BY ProductID;

-- 3 Types of Relationships
-- Foreign Key Constraints

-- INNER JOIN
SELECT * FROM employees e 
INNER JOIN orders o 
ON e.EmployeeID = o.EmployeeID;

SELECT e.EmployeeID, CONCAT(e.FirstName, ' ', e.LastName) AS FullName, o.OrderID 
FROM employees e
INNER JOIN orders o 
ON e.EmployeeID = o.EmployeeID;

-- join 3 tables
SELECT o.OrderID, e.EmployeeID, CONCAT(e.FirstName, ' ', e.LastName) AS EmployeeName, c.CustomerID, c.CustomerName
FROM orders o
INNER JOIN employees e ON o.EmployeeID = e.EmployeeID
INNER JOIN customers c ON o.CustomerID = c.CustomerID;

-- get top 10 employees
SELECT e.EmployeeID, CONCAT(e.FirstName, ' ', e.LastName) AS FullName, SUM(od.Quantity) AS TotalQty
FROM orders o
INNER JOIN employees e ON o.EmployeeID = e.EmployeeID
INNER JOIN order_details od ON o.OrderID = od.OrderID
GROUP BY e.EmployeeID
ORDER BY TotalQty DESC
LIMIT 10;

-- get top 10 customers
SELECT c.CustomerID, c.CustomerName, SUM(od.Quantity) AS TotalQtyOrdered
FROM orders o
INNER JOIN customers c ON o.CustomerID = c.CustomerID
INNER JOIN order_details od ON o.OrderID = od.OrderID
GROUP BY c.CustomerID
ORDER BY TotalQtyOrdered DESC
LIMIT 10;

-- LEFT JOIN
SELECT e.EmployeeID, CONCAT(e.FirstName, ' ', e.LastName) AS FullName, COUNT(o.OrderID) AS TotalOrders 
FROM employees e
LEFT JOIN
orders o
ON e.EmployeeID = o.EmployeeID
GROUP BY e.EmployeeID;

-- RIGHT JOIN
-- FULL OUTER JOIN
-- CROSS JOIN

-- VIEWS
-- a view saves the result-set of a query
-- views cannot insert/update/delete
SELECT * FROM vw_orders;

SELECT e.EmployeeID, CONCAT(e.FirstName, ' ', e.LastName) AS FullName, SUM(o.Quantity) AS TotalQty
FROM vw_orders o
INNER JOIN employees e ON o.EmployeeID = e.EmployeeID
GROUP BY e.EmployeeID
ORDER BY TotalQty DESC
LIMIT 10;

SELECT c.CustomerID, c.CustomerName, SUM(o.Quantity) AS TotalQtyOrdered
FROM vw_orders o
INNER JOIN customers c ON o.CustomerID = c.CustomerID
GROUP BY c.CustomerID
ORDER BY TotalQtyOrdered DESC
LIMIT 10;

SELECT * FROM vw_top_10_employees;
SELECT * FROM vw_top_10_customers;

-- Stored Procedures
-- Unlike VIEWS, Stored Procedures can accept parameters
-- You can have multiple SQL statements with Stored Procedures
CALL sp_create_new_employee('Juan', 'Dela Cruz');

CALL sp_update_employee_notes(11, 'John Doe Notes');

CALL sp_create_new_employee('Peter', 'Parker', @employeeid);
SELECT @employeeid;

-- INFORMATION FUNCTIONS
-- https://dev.mysql.com/doc/refman/8.0/en/information-functions.html
SELECT user();
SELECT version();
SELECT database();
SELECT row_count();

-- INOUT
SET @employeeid = 1;
CALL sp_get_employee_by_id(@employeeid);
SELECT @employeeid;

-- Stored Procedure Local and Session Variables
SET @v_session = 1;
CALL sp_variables();

-- FUNCTIONS
SELECT CONCAT(FirstName, ' ', LastName) AS FullName FROM employees; -- Built-in Function
SELECT fn_get_fullname(FirstName, LastName) FROM employees; -- Custom Function
SELECT fn_get_employee_fullname(1);

SET GLOBAL log_bin_trust_function_creators = 1; -- Execute this statement so that you don't have to put DETERMINISTIC OR READS SQL DATA everytime you create a function

-- TRIGGERS
-- Are codes executed before or after table events like INSERT, UPDATE, DELETE
-- You can add triggers:
-- BEFORE INSERT OR AFTER INSERT
-- BEFORE UPDATE OR AFTER UPDATE
-- BEFORE DELETE OR AFTER DELETE
UPDATE employees SET Notes = "Hello World!" WHERE EmployeeID = 11;

-- END OF DATA MANIPULATION LANGUAGE (DML) ------------------------------------------------------------------

-- INDEXING | QUERY OPTIMIZATIONcustomers
-- How to optimize your query?
-- Through INDEX