
# 🚧 Constraints in MySQL

<p align="center">
  <img src="https://github.com/jeevan499/SQL/blob/main/3.%20Constraints/Constraints%20In%20SQL.jpg" alt="MySQL Constraints" />
</p>

🔗 [View SQL File on GitHub](https://github.com/jeevan499/SQL/blob/main/3.%20Constraints/Constraints%20in%20MySQL.sql)

---

## 📘 Overview

In MySQL, **constraints** are a set of rules and instructions that help maintain the **validity**, **consistency**, and **integrity** of data in a table. They restrict the type of data that can be inserted into columns to avoid errors or conflicts in the database.

---

## 🔢 Types of Constraints

MySQL provides the following types of constraints:

### 1. 🔒 NOT NULL Constraint

- Ensures that a column **cannot have NULL values**.
- Typically used when a field **must always have a value**.

```sql
CREATE TABLE employees (
  id INT NOT NULL,
  name VARCHAR(100) NOT NULL
);
```

---

### 2. 🆔 UNIQUE Constraint

- Ensures that **all values in a column are different**.
- Prevents duplicate entries in a column.

```sql
CREATE TABLE users (
  email VARCHAR(255) UNIQUE
);
```

---

### 3. 🗝️ PRIMARY KEY Constraint

- Uniquely identifies each record in a table.
- Combines **NOT NULL** and **UNIQUE**.
- Only **one** primary key is allowed per table.

```sql
CREATE TABLE students (
  student_id INT PRIMARY KEY,
  name VARCHAR(100)
);
```

---

### 4. 🔗 FOREIGN KEY Constraint

- Ensures **referential integrity** by linking two tables.
- The foreign key in one table points to the **primary key** in another.

```sql
CREATE TABLE orders (
  order_id INT PRIMARY KEY,
  customer_id INT,
  FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);
```

---

### 5. ✅ CHECK Constraint

- Ensures that values in a column **meet a specific condition**.
- Helps enforce **custom business rules**.

```sql
CREATE TABLE products (
  price DECIMAL(10, 2),
  CHECK (price > 0)
);
```

---

### 6. 🧰 DEFAULT Constraint

- Assigns a **default value** to a column if no value is provided.
- Useful for fields like `status`, `created_at`, etc.

```sql
CREATE TABLE accounts (
  status VARCHAR(20) DEFAULT 'active'
);
```

---

## 📎 Summary Table

| Constraint      | Description                                      | Example Usage                        |
|----------------|--------------------------------------------------|--------------------------------------|
| NOT NULL        | Prevents NULL values                            | `name VARCHAR(100) NOT NULL`         |
| UNIQUE          | Ensures all values are unique                   | `email VARCHAR(255) UNIQUE`          |
| PRIMARY KEY     | Unique + Not Null (one per table)               | `student_id INT PRIMARY KEY`         |
| FOREIGN KEY     | Links column to another table’s primary key     | `FOREIGN KEY (customer_id) ...`      |
| CHECK           | Validates values using a condition              | `CHECK (price > 0)`                  |
| DEFAULT         | Sets default value if none provided             | `status VARCHAR DEFAULT 'active'`    |

---

## 📎 Reference

Explore the full SQL script here 👉 [Constraints in MySQL.sql](https://github.com/jeevan499/SQL/blob/main/3.%20Constraints/Constraints%20in%20MySQL.sql)

---

💡 *Using constraints effectively ensures reliable and meaningful data within your database.*
