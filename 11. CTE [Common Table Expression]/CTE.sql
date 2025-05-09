/* What is a CTE?
A Common Table Expression (CTE) is a temporary result set defined within a MySQL query using the WITH clause. It exists only for the duration of the query and can be referenced multiple times within that query. CTEs simplify complex queries, improve readability, and support recursive operations for hierarchical data.

Introduced: MySQL 8.0 and later (not available in earlier versions).
Purpose: Break down complex queries, avoid repetitive subqueries, and handle hierarchical or recursive data.


Syntax
Basic CTE Syntax

WITH cte_name [(column_name1, column_name2, ...)]
AS (
    -- Subquery defining the CTE
    SELECT ...
)
SELECT ... FROM cte_name ...;


WITH: Starts the CTE definition.
cte_name: Unique name for the CTE.
[(column_name1, ...)]: Optional. Explicitly names the CTE’s columns. If omitted, column names are derived from the subquery.
AS (...): Subquery that defines the CTE’s result set.
Main Query: Uses the CTE like a table.

Multiple CTEs 

WITH cte1 AS (
    SELECT ...
),
cte2 AS (
    SELECT ... FROM cte1 ...
)
SELECT ... FROM cte2 ...;


Recursive CTEs
Used for hierarchical or iterative data (e.g., organizational charts, trees).

WITH RECURSIVE cte_name AS (
    -- Base case
    SELECT ...
    UNION ALL
    -- Recursive part
    SELECT ... FROM cte_name WHERE ...
)
SELECT ... FROM cte_name;

Key Features
1. Temporary: CTEs exist only during query execution.
2. Readable: Simplifies complex queries by replacing nested subqueries.
3. Reusable: A CTE can be referenced multiple times in the same query.
4. Recursive: Supports recursive queries for hierarchical data.
5. Non-Materialized: MySQL evaluates CTEs each time they are referenced (not stored as temporary tables).

Advantages

- Modularity: Breaks queries into logical parts.
- Clarity: Enhances readability compared to nested subqueries.
- Reusability: Avoids repeating subqueries.
- Recursion: Ideal for hierarchical data (e.g., parent-child relationships).
- Maintainability: Easier to debug and modify.

Limitations
1. Version: Only available in MySQL 8.0+.
2. Non-Materialized: May lead to performance issues if referenced multiple times.
3. No Direct Modifications: Cannot be used directly in INSERT, UPDATE, or DELETE (requires subquery wrapping).
4. Recursion Limit: Controlled by cte_max_recursion_depth (default: 1000).
5. No Indexes: CTEs cannot be indexed, unlike temporary tables.

Performance Considerations

- Non-Materialized: MySQL re-evaluates CTEs each time they are referenced, which can be inefficient for large datasets. Consider temporary tables for performance-critical cases.
- Recursive CTEs: Ensure recursion limits are set appropriately to avoid infinite loops or excessive iterations.
- Optimizer: MySQL’s query optimizer may not always handle CTEs as efficiently as subqueries or joins in some cases.
*/


-- Create sample tables for demonstration
CREATE TABLE employees (
  employee_id INT PRIMARY KEY,
  first_name VARCHAR(50),
  salary DECIMAL(10, 2),
  department_id INT,
  manager_id INT
);

CREATE TABLE departments (
  id INT PRIMARY KEY,
  department_name VARCHAR(50)
);

CREATE TABLE orders (
  order_id INT PRIMARY KEY,
  customer_id INT,
  order_date DATE,
  amount DECIMAL(10, 2)
);

CREATE TABLE customers (
  customer_id INT PRIMARY KEY,
  name VARCHAR(100)
);

-- Insert sample data
INSERT INTO departments (id, department_name) VALUES
(1, 'Sales'),
(2, 'Engineering'),
(3, 'HR');

INSERT INTO employees (employee_id, first_name, salary, department_id, manager_id) VALUES
(1, 'Alice', 80000, 1, NULL),
(2, 'Bob', 75000, 1, 1),
(3, 'Charlie', 90000, 2, NULL),
(4, 'David', 65000, 2, 3),
(5, 'Eve', 55000, 3, NULL);

INSERT INTO customers (customer_id, name) VALUES
(1, 'Acme Corp'),
(2, 'Beta Inc'),
(3, 'Gamma Ltd');

INSERT INTO orders (order_id, customer_id, order_date, amount) VALUES
(1, 1, '2024-01-15', 1000.00),
(2, 1, '2024-02-10', 1500.00),
(3, 2, '2024-03-05', 800.00),
(4, 1, '2024-04-20', 2000.00),
(5, 3, '2024-05-01', 1200.00);

-- Example 1: Basic CTE for Aggregated Data
WITH dept_salaries AS (
  SELECT department_id, AVG(salary) AS avg_salary
  FROM employees
  GROUP BY department_id
)
SELECT d.department_name, ds.avg_salary
FROM dept_salaries ds
JOIN departments d ON ds.department_id = d.id
WHERE ds.avg_salary > 60000;

-- Example 2: Multiple CTEs in One Query
WITH high_earners AS (
  SELECT employee_id, first_name, salary
  FROM employees
  WHERE salary > 70000
),
dept_counts AS (
  SELECT department_id, COUNT(*) AS emp_count
  FROM employees
  GROUP BY department_id
)
SELECT h.first_name, h.salary, dc.emp_count
FROM high_earners h
JOIN dept_counts dc ON h.department_id = dc.department_id;

-- Example 3: Recursive CTE for Hierarchical Data
WITH RECURSIVE employee_hierarchy AS (
  -- Anchor: Start with top-level manager
  SELECT employee_id, first_name, manager_id, 0 AS level
  FROM employees
  WHERE manager_id IS NULL
  UNION ALL
  -- Recursive: Get subordinates
  SELECT e.employee_id, e.first_name, e.manager_id, eh.level + 1
  FROM employees e
  JOIN employee_hierarchy eh ON e.manager_id = eh.employee_id
)
SELECT first_name, level
FROM employee_hierarchy
ORDER BY level, first_name;

-- Example 4: CTE for Filtering Complex Conditions
WITH recent_orders AS (
  SELECT customer_id, COUNT(*) AS order_count
  FROM orders
  WHERE order_date >= '2024-01-01'
  GROUP BY customer_id
)
SELECT c.name, ro.order_count
FROM customers c
JOIN recent_orders ro ON c.customer_id = ro.customer_id
WHERE ro.order_count > 2;

-- Clean up: Drop tables (optional)
-- DROP TABLE employees, departments, orders, customers;