# 🧠 Data Types in MySQL

<p align="center">
  <img src="https://trainings.internshala.com/blog/wp-content/uploads/2023/04/MySQL-Data-types-1.jpg" alt="MySQL Data Types" />
</p>

🔗 [View SQL File on GitHub](https://github.com/jeevan499/SQL/blob/main/2.%20Data%20Types/Data%20Types%20in%20MySQL.sql)

---

## 📘 Overview

In MySQL, **data types** define the kind of value a column can store. Choosing the right data type is crucial for performance, storage efficiency, and data integrity.

MySQL data types are broadly classified into three main categories:

1. **Numeric Data Types**
2. **String (Character) Data Types**
3. **Date and Time Data Types**

---

## 1️⃣ Numeric Data Types

Numeric types are used to store numbers. These can be **integers** or **floating-point values**.

| Data Type | Description |
|-----------|-------------|
| `TINYINT` | Stores very small integers (-128 to 127 for signed, 0 to 255 for unsigned). |
| `INT` | Stores whole numbers (signed). Commonly used for IDs or counters. |
| `BIGINT` | Stores large integers beyond the range of INT. |
| `DECIMAL(p, s)` | Fixed-point numbers, accurate for financial calculations. |
| `FLOAT` | Single-precision floating-point number. |
| `DOUBLE` | Double-precision floating-point number for higher accuracy. |

✅ Use `DECIMAL` when accuracy matters (e.g., currency), and `FLOAT`/`DOUBLE` when you need performance over precision.

---

## 2️⃣ String (Character) Data Types

String types store sequences of characters such as names, descriptions, and text.

| Data Type | Description |
|-----------|-------------|
| `VARCHAR(n)` | Variable-length strings up to `n` characters. Most common string type. |
| `CHAR(n)` | Fixed-length strings. Pads with spaces if input is shorter. |
| `TEXT` | Large variable-length text, not indexable in the same way as `VARCHAR`. |
| `ENUM` | A string object with a predefined set of possible values. |

📝 Choose `VARCHAR` for flexible input, `ENUM` for strict value control, and `TEXT` for long descriptions or logs.

---

## 3️⃣ Date and Time Data Types

These types store time-related values such as birthdays, timestamps, or durations.

| Data Type | Format | Description |
|-----------|--------|-------------|
| `DATE` | `YYYY-MM-DD` | Stores only date. |
| `TIME` | `HH:MM:SS` | Stores only time. |
| `DATETIME` | `YYYY-MM-DD HH:MM:SS` | Stores both date and time. |
| `TIMESTAMP` | Unix timestamp | Auto-updates to current time on record change (by default). |

📅 Use `TIMESTAMP` for tracking row changes, and `DATETIME` when timezone consistency is needed.

---

## 📌 Summary Table

| Category | Common Data Types | Use Case |
|----------|-------------------|----------|
| Numeric | `INT`, `BIGINT`, `FLOAT`, `DECIMAL` | Storing quantities, prices, scores |
| String  | `VARCHAR`, `TEXT`, `ENUM` | Names, descriptions, categories |
| Date/Time | `DATE`, `TIME`, `DATETIME`, `TIMESTAMP` | Tracking events, logs, creation times |

---

## 📎 Reference

Explore the complete `.sql` script here 👉 [Data Types in MySQL.sql](https://github.com/jeevan499/SQL/blob/main/2.%20Data%20Types/Data%20Types%20in%20MySQL.sql)

---

💡 *Choosing the right data type improves query performance and ensures better storage optimization.*
