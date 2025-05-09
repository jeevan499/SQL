# 🧠 Common Table Expressions (CTEs) in MySQL

<p align="center">
  <img src="https://github.com/jeevan499/SQL/blob/main/11.%20CTE%20%5BCommon%20Table%20Expression%5D/CTE.png" alt="MySQL CTEs" />
</p>

🔗 [View SQL File on GitHub](https://github.com/jeevan499/SQL/blob/main/11.%20CTE%20%5BCommon%20Table%20Expression%5D/CTE.sql)

---

## 📘 Overview

**Common Table Expressions (CTEs)** in MySQL are temporary result sets defined within a query, making complex queries more readable and reusable. CTEs act like virtual tables that can be referenced multiple times in the main query, simplifying nested subqueries and improving query organization.

---

## ⚙️ Key Features of CTEs

- **Readability**: Break down complex queries into manageable, named blocks.
- **Reusability**: Reference the same CTE multiple times in a query.
- **Recursive Support**: Handle hierarchical or iterative data (e.g., organizational charts).
- **Temporary**: Exist only for the duration of the query execution.

---

## ⚙️ Syntax

### Basic CTE
```sql
WITH cte_name AS (
  SELECT column_name
  FROM table_name
  [WHERE conditions]
)
SELECT column_name
FROM cte_name
[WHERE conditions];
```

### Recursive CTE
```sql
WITH RECURSIVE cte_name AS (
  -- Anchor member
  SELECT column_name
  FROM table_name
  WHERE condition
  UNION [ALL]
  -- Recursive member
  SELECT column_name
  FROM table_name
  JOIN cte_name ON condition
)
SELECT column_name
FROM cte_name;
```

---

## ✅ Examples

### 🔹 1. Basic CTE for Aggregated Data

```sql
WITH dept_salaries AS (
  SELECT department_id, AVG(salary) AS avg_salary
  FROM employees
  GROUP BY department_id
)
SELECT d.department_name, ds.avg_salary
FROM dept_salaries ds
JOIN departments d ON ds.department_id = d.id
WHERE ds.avg_salary > 60000;
```

### 🔹 2. Multiple CTEs in One Query

```sql
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
```

### 🔹 3. Recursive CTE for Hierarchical Data

```sql
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
```

### 🔹 4. CTE for Filtering Complex Conditions

```sql
WITH recent_orders AS (
  SELECT customer_id, COUNT(*) AS order_count
  FROM orders
  WHERE order_date >= '2024-01-01'
  GROUP BY customer_id
)
SELECT c.name, ro.order_count
FROM customers c
JOIN recent_orders ro ON c.customer_id = ro.customer_id
WHERE ro.order_count > 5;
```

---

## 📎 Summary Table

| CTE Type            | Description                                      | Sample Context                     |
|---------------------|--------------------------------------------------|------------------------------------|
| Basic CTE           | Simplifies complex queries                       | Aggregate department salaries      |
| Multiple CTEs       | Combines multiple temporary result sets          | Join high earners with dept counts |
| Recursive CTE       | Processes hierarchical or iterative data         | Employee reporting structure       |
| Filtering CTE       | Isolates complex filtering logic                 | Recent customer order analysis     |

---

## 📎 Reference

Explore the full SQL script here 👉 [CTEs in MySQL.sql](https://github.com/jeevan499/SQL/blob/main/11.%20CTE%20%5BCommon%20Table%20Expression%5D/CTE.sql)

---

💡 *CTEs in MySQL are like building blocks for your queries, making them cleaner, more modular, and powerful for tackling complex data challenges!*
