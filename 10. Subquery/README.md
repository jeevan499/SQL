# 🧠 Subqueries in MySQL

<p align="center">
  <img src="https://github.com/jeevan499/SQL/blob/main/10.%20Subquery/Subquery.jpg" />
</p>

🔗 [View SQL File on GitHub](https://github.com/jeevan499/SQL/blob/main/10.%20Subquery/Subquery.sql)

---

## 📘 Overview

**Subqueries** in MySQL are queries nested within another query, often used to return data that will be used by the main query. They provide a way to break down complex problems, filter data, or perform calculations based on dynamic conditions.

---

## ⚙️ Key Features of Subqueries

- **Nested Queries**: Execute an inner query to provide results for the outer query.
- **Types**: Single-row, multi-row, correlated, or non-correlated subqueries.
- **Flexibility**: Used in `SELECT`, `WHERE`, `FROM`, or `HAVING` clauses.
- **Use Cases**: Filtering, comparisons, or deriving aggregated data.

---

## ⚙️ Syntax

### Basic Subquery
```sql
SELECT column_name
FROM table_name
WHERE column_name [operator] (
  SELECT column_name
  FROM table_name
  [WHERE conditions]
);
```

### Correlated Subquery
```sql
SELECT column_name
FROM table_name t1
WHERE column_name [operator] (
  SELECT column_name
  FROM table_name t2
  WHERE t2.column_name = t1.column_name
);
```

---

## ✅ Examples

### 🔹 1. Single-Row Subquery

```sql
SELECT employee_id, first_name, salary
FROM employees
WHERE salary > (
  SELECT AVG(salary)
  FROM employees
);
```

### 🔹 2. Multi-Row Subquery with IN

```sql
SELECT customer_id, name
FROM customers
WHERE customer_id IN (
  SELECT customer_id
  FROM orders
  WHERE order_date > '2024-01-01'
);
```

### 🔹 3. Correlated Subquery

```sql
SELECT department_id, department_name
FROM departments d
WHERE EXISTS (
  SELECT 1
  FROM employees e
  WHERE e.department_id = d.department_id
  AND e.salary > 50000
);
```

### 🔹 4. Subquery in FROM Clause

```sql
SELECT dept_id, avg_salary
FROM (
  SELECT department_id AS dept_id, AVG(salary) AS avg_salary
  FROM employees
  GROUP BY department_id
) AS dept_salaries
WHERE avg_salary > 60000;
```

### 🔹 5. Subquery in SELECT Clause

```sql
SELECT 
  product_id,
  product_name,
  (SELECT AVG(price) FROM products) AS avg_price
FROM products;
```

---

## 📎 Summary Table

| Subquery Type       | Description                                      | Sample Context                     |
|---------------------|--------------------------------------------------|------------------------------------|
| Single-Row          | Returns one row, one column                      | Compare against average salary     |
| Multi-Row           | Returns multiple rows, one column                | Filter customers with recent orders|
| Correlated          | References outer query, executes per row         | Find departments with high earners |
| Derived Table       | Subquery in FROM clause as a virtual table       | Analyze aggregated department data |
| Scalar Subquery     | Returns single value in SELECT clause            | Include average price in results   |

---

## 📎 Reference

Explore the full SQL script here 👉 [Subqueries in MySQL.sql](https://github.com/jeevan499/SQL/blob/main/10.%20Subquery/Subquery.sql)

---

💡 *Subqueries in MySQL are like mini-queries within your query, unlocking powerful ways to filter, compare, and analyze data dynamically!*
