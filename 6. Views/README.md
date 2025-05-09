# 🧠 Views in MySQL

<p align="center">
  <img src="https://github.com/jeevan499/SQL/blob/main/6.%20Views/Views%20in%20SQL.jpg" alt="MySQL Views" />
</p>

🔗 [View SQL File on GitHub](https://github.com/jeevan499/SQL/blob/main/6.%20Views/Views%20in%20Mysql%20by%20Jeevan%20Raj.sql)

---

## 📘 Overview

**Views** in MySQL are virtual tables created by a query that combines data from one or more tables. They simplify complex queries, enhance security by restricting data access, and provide a way to present data in a customized format without altering the underlying tables.

---

## ⚙️ Key Features of Views

- **Virtual**: Views do not store data physically; they are dynamically generated from the base tables.
- **Simplification**: Encapsulate complex queries for easier reuse.
- **Security**: Restrict access to specific columns or rows.
- **Updatable**: Some views allow `INSERT`, `UPDATE`, or `DELETE` operations under certain conditions.

---

## ⚙️ Syntax

### Creating a View
```sql
CREATE [OR REPLACE] VIEW view_name AS
SELECT columns
FROM tables
[WHERE conditions];
```

### Dropping a View
```sql
DROP VIEW [IF EXISTS] view_name;
```

### Modifying a View
```sql
CREATE OR REPLACE VIEW view_name AS
SELECT columns
FROM tables
[WHERE conditions];
```

---

## ✅ Examples

### 🔹 1. Creating a Simple View

```sql
CREATE VIEW employee_details AS
SELECT employee_id, first_name, last_name, department_name
FROM employees
JOIN departments
ON employees.department_id = departments.id;
```

### 🔹 2. Querying a View

```sql
SELECT * FROM employee_details
WHERE department_name = 'Sales';
```

### 🔹 3. Creating an Updatable View

```sql
CREATE VIEW active_customers AS
SELECT customer_id, name, email
FROM customers
WHERE status = 'active'
WITH CHECK OPTION;
```

### 🔹 4. Modifying a View

```sql
CREATE OR REPLACE VIEW employee_details AS
SELECT employee_id, first_name, last_name, department_name, hire_date
FROM employees
JOIN departments
ON employees.department_id = departments.id
WHERE hire_date > '2020-01-01';
```

### 🔹 5. Dropping a View

```sql
DROP VIEW IF EXISTS employee_details;
```

---

## 📎 Summary Table

| Use Case             | Description                                          | Sample Context                     |
|----------------------|-----------------------------------------------------|------------------------------------|
| Simplifying Queries  | Encapsulate complex joins or calculations           | Summarize employee data            |
| Security             | Limit access to specific columns or rows            | Restrict sensitive data            |
| Reusability          | Reuse predefined queries                            | Frequently used reports            |
| Updatable Views      | Allow modifications to base tables via views        | Update customer status             |

---

## 📎 Reference

Explore the full SQL script here 👉 [Views in MySQL.sql](https://github.com/jeevan499/SQL/blob/main/6.%20Views/Views%20in%20Mysql%20by%20Jeevan%20Raj.sql)

---

💡 *Views in MySQL are like custom lenses for your database, making data access simpler, safer, and more tailored to your needs!*
