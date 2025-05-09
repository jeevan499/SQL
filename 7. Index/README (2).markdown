# 🧠 Indexes in MySQL

<p align="center">
  <img src="https://www.mysqltutorial.org/wp-content/uploads/2020/07/MySQL-Index.png" alt="MySQL Indexes" />
</p>

🔗 [View SQL File on GitHub](https://github.com/jeevan499/SQL/blob/main/7.%20Indexes/Indexes%20in%20MySQL.sql)

---

## 📘 Overview

**Indexes** in MySQL are database structures that improve the speed of data retrieval operations on a table. They act like a table of contents, allowing the database to find rows more efficiently without scanning the entire table.

---

## ⚙️ Key Features of Indexes

- **Performance**: Speed up `SELECT` queries and `WHERE`, `JOIN`, `ORDER BY`, and `GROUP BY` clauses.
- **Trade-off**: Slow down `INSERT`, `UPDATE`, and `DELETE` operations due to index maintenance.
- **Types**: Include primary, unique, full-text, and spatial indexes.
- **Storage**: Use structures like B-Tree (default) or Hash for efficient data access.

---

## ⚙️ Syntax

### Creating an Index
```sql
CREATE [UNIQUE | FULLTEXT | SPATIAL] INDEX index_name
ON table_name (column_name [, column_name2, ...]);
```

### Creating an Index with Table Creation
```sql
CREATE TABLE table_name (
  column1 datatype,
  column2 datatype,
  [INDEX | KEY] index_name (column_name)
);
```

### Dropping an Index
```sql
DROP INDEX index_name ON table_name;
```

### Viewing Indexes
```sql
SHOW INDEX FROM table_name;
```

---

## ✅ Examples

### 🔹 1. Creating a Simple Index

```sql
CREATE INDEX idx_employee_name
ON employees (last_name);
```

### 🔹 2. Creating a Composite Index

```sql
CREATE INDEX idx_employee_dept
ON employees (department_id, hire_date);
```

### 🔹 3. Creating a Unique Index

```sql
CREATE UNIQUE INDEX idx_customer_email
ON customers (email);
```

### 🔹 4. Dropping an Index

```sql
DROP INDEX idx_employee_name ON employees;
```

### 🔹 5. Viewing Indexes on a Table

```sql
SHOW INDEX FROM employees;
```

---

## 📎 Summary Table

| Index Type       | Description                                      | Sample Context                     |
|------------------|--------------------------------------------------|------------------------------------|
| Primary Index    | Enforces uniqueness for primary key              | Employee ID in employees table     |
| Unique Index     | Ensures no duplicate values in column(s)         | Customer email addresses           |
| Composite Index  | Indexes multiple columns for complex queries     | Department and hire date filtering |
| Full-Text Index  | Optimizes text-based searches                    | Product descriptions               |
| Spatial Index    | Supports spatial data queries                    | Geographic coordinates             |

---

## 📎 Reference

Explore the full SQL script here 👉 [Indexes in MySQL.sql](https://github.com/jeevan499/SQL/blob/main/7.%20Indexes/Indexes%20in%20MySQL.sql)

---

💡 *Indexes in MySQL are like shortcuts in your database, speeding up data retrieval while balancing the cost of maintenance!*