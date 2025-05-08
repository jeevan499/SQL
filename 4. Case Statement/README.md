
# 🧠 CASE Statement in MySQL

<p align="center">
  <img src="https://training-blog-uploads.internshala.com/blog/wp-content/uploads/2023/07/Case-statement-in-sql-1-2048x854.jpg.webp" alt="MySQL CASE Statement" />
</p>

🔗 [View SQL File on GitHub](https://github.com/jeevan499/SQL/blob/main/4.%20Case%20Statement/Case%20Statement%20in%20MySQL.sql)

---

## 📘 Overview

The **`CASE`** statement in MySQL is a powerful **conditional expression** that acts like an `IF-ELSE` ladder. It allows you to return specific values based on different conditions, making your queries **dynamic and readable**.

---

## ⚙️ Syntax

```sql
CASE
  WHEN condition1 THEN result1
  WHEN condition2 THEN result2
  ...
  ELSE resultN
END
```

You can use it:
- In **`SELECT`**, **`UPDATE`**, **`DELETE`**, and **`ORDER BY`** clauses.
- With **column values** or **custom expressions**.

---

## ✅ Examples

### 🔹 1. Using CASE in SELECT

```sql
SELECT 
  name,
  marks,
  CASE 
    WHEN marks >= 90 THEN 'Grade A'
    WHEN marks >= 75 THEN 'Grade B'
    ELSE 'Grade C'
  END AS grade
FROM students;
```

### 🔹 2. Using CASE in ORDER BY

```sql
SELECT name, status
FROM orders
ORDER BY 
  CASE 
    WHEN status = 'pending' THEN 1
    WHEN status = 'shipped' THEN 2
    ELSE 3
  END;
```

### 🔹 3. Using CASE in UPDATE

```sql
UPDATE employees
SET bonus = 
  CASE 
    WHEN performance = 'Excellent' THEN 1000
    WHEN performance = 'Good' THEN 500
    ELSE 100
  END;
```

---

## 📎 Summary Table

| Use Case         | Description                                 | Sample Context                    |
|------------------|---------------------------------------------|------------------------------------|
| SELECT           | Add conditional labels to columns           | Assign grades, categories          |
| ORDER BY         | Custom sort order using logic               | Prioritize by status               |
| UPDATE           | Apply logic when updating values            | Set bonuses or adjustments         |
| DELETE           | Conditionally delete rows (in subqueries)   | Remove flagged or outdated data    |

---

## 📎 Reference

Explore the full SQL script here 👉 [CASE Statement in MySQL.sql](https://github.com/jeevan499/SQL/blob/main/4.%20Case%20Statement/Case%20Statement%20in%20MySQL.sql)

---

💡 *The CASE statement makes your SQL logic more flexible, readable, and powerful—like a mini decision engine inside your query!*
