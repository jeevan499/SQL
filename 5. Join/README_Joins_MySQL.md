
# 🔗 JOINS in MySQL

<p align="center">
  <img src="https://github.com/jeevan499/SQL/blob/main/5.%20Join/Joins%20In%20SQL.jpg" alt="MySQL Joins" />
</p>

🔗 [View SQL File on GitHub](https://github.com/jeevan499/SQL/blob/main/5.%20Join/Joins.sql)

---

## 📘 Overview

In MySQL, **JOINS** are used to combine rows from two or more tables based on a **related column** between them. They are crucial when dealing with **relational databases** where data is split across multiple tables.

---

## 🔢 Types of JOINS

MySQL supports the following types of joins:

---

### 1. 🔗 INNER JOIN

- Returns only the **matching rows** from both tables.

```sql
SELECT a.name, b.department
FROM employees a
INNER JOIN departments b ON a.dept_id = b.id;
```

---

### 2. 📥 LEFT JOIN (LEFT OUTER JOIN)

- Returns **all rows from the left table**, and the matched rows from the right table.
- If no match, returns NULL for right table columns.

```sql
SELECT a.name, b.department
FROM employees a
LEFT JOIN departments b ON a.dept_id = b.id;
```

---

### 3. 📤 RIGHT JOIN (RIGHT OUTER JOIN)

- Returns **all rows from the right table**, and the matched rows from the left table.
- If no match, returns NULL for left table columns.

```sql
SELECT a.name, b.department
FROM employees a
RIGHT JOIN departments b ON a.dept_id = b.id;
```

---

### 4. 🔄 FULL JOIN (FULL OUTER JOIN)

- Not supported natively in MySQL.
- Simulated using **UNION of LEFT and RIGHT JOIN**.

```sql
SELECT a.name, b.department
FROM employees a
LEFT JOIN departments b ON a.dept_id = b.id

UNION

SELECT a.name, b.department
FROM employees a
RIGHT JOIN departments b ON a.dept_id = b.id;
```

---

### 5. 🔍 SELF JOIN

- A table is joined with itself.

```sql
SELECT a.name AS Employee, b.name AS Manager
FROM employees a
JOIN employees b ON a.manager_id = b.id;
```

---

## 📎 Summary Table

| Join Type     | Description                                   | Returns                              |
|---------------|-----------------------------------------------|--------------------------------------|
| INNER JOIN    | Only matching rows                            | Common data in both tables           |
| LEFT JOIN     | All left rows + matched right rows            | Complete left, matching right        |
| RIGHT JOIN    | All right rows + matched left rows            | Complete right, matching left        |
| FULL JOIN     | All rows from both tables                     | Everything, matched and unmatched    |
| SELF JOIN     | Join within the same table                    | Useful for hierarchical data         |

---

## 📎 Reference

Explore the full SQL script here 👉 [Joins in MySQL.sql](https://github.com/jeevan499/SQL/blob/main/5.%20Join/Joins.sql)

---

💡 *Mastering JOINs is essential for querying data efficiently and gaining deeper insights from relational databases.*
