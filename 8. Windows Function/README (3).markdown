# 🧠 Window Functions in MySQL

<p align="center">
  <img src="https://www.sqlservertutorial.net/wp-content/uploads/SQL-Server-Window-Functions.png" alt="MySQL Window Functions" />
</p>

🔗 [View SQL File on GitHub](https://github.com/jeevan499/SQL/blob/main/8.%20Window%20Functions/Window%20Functions%20in%20MySQL.sql)

---

## 📘 Overview

**Window Functions** in MySQL perform calculations across a set of rows (called a "window") related to the current row, without collapsing the result set like aggregate functions. They are ideal for tasks like ranking, running totals, and comparing rows within a group.

---

## ⚙️ Key Features of Window Functions

- **Non-aggregating**: Retain individual rows in the output, unlike `GROUP BY`.
- **Flexible Windows**: Define custom row sets using `OVER` and `PARTITION BY`.
- **Types**: Include ranking (`RANK`, `ROW_NUMBER`), aggregate (`SUM`, `AVG`), and navigational (`LAG`, `LEAD`) functions.
- **Performance**: Optimize complex analytical queries efficiently.

---

## ⚙️ Syntax

```sql
function_name() OVER (
  [PARTITION BY column1, column2, ...]
  [ORDER BY column3, column4, ...]
  [ROWS or RANGE frame_specification]
)
```

- **PARTITION BY**: Divides the data into groups (like `GROUP BY` but keeps rows).
- **ORDER BY**: Defines the order of rows within the window.
- **ROWS/RANGE**: Specifies the window frame (e.g., rows preceding or following).

---

## ✅ Examples

### 🔹 1. Ranking Rows with ROW_NUMBER

```sql
SELECT 
  employee_id,
  first_name,
  salary,
  ROW_NUMBER() OVER (PARTITION BY department_id ORDER BY salary DESC) AS rank
FROM employees;
```

### 🔹 2. Calculating Running Total

```sql
SELECT 
  order_id,
  order_date,
  amount,
  SUM(amount) OVER (PARTITION BY customer_id ORDER BY order_date) AS running_total
FROM orders;
```

### 🔹 3. Comparing Rows with LAG

```sql
SELECT 
  product_id,
  sale_date,
  quantity,
  LAG(quantity) OVER (PARTITION BY product_id ORDER BY sale_date) AS previous_quantity
FROM sales;
```

### 🔹 4. Top-N per Group with RANK

```sql
SELECT 
  department_id,
  first_name,
  salary,
  RANK() OVER (PARTITION BY department_id ORDER BY salary DESC) AS salary_rank
FROM employees
WHERE salary_rank <= 3;
```

### 🔹 5. Moving Average with Window Frame

```sql
SELECT 
  sale_date,
  amount,
  AVG(amount) OVER (
    ORDER BY sale_date
    ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
  ) AS moving_average
FROM sales;
```

---

## 📎 Summary Table

| Function Type       | Description                                      | Sample Context                     |
|---------------------|--------------------------------------------------|------------------------------------|
| Ranking             | Assign ranks (`ROW_NUMBER`, `RANK`, `DENSE_RANK`) | Employee salary ranking            |
| Aggregate           | Compute totals or averages (`SUM`, `AVG`)        | Running sales totals               |
| Navigational        | Access other rows (`LAG`, `LEAD`, `FIRST_VALUE`) | Compare sales across dates         |
| Framing             | Define custom row ranges for calculations        | Moving averages or cumulative sums |

---

## 📎 Reference

Explore the full SQL script here 👉 [Window Functions in MySQL.sql](https://github.com/jeevan499/SQL/blob/main/8.%20Window%20Functions/Window%20Functions%20in%20MySQL.sql)

---

💡 *Window Functions in MySQL are like a superpower for analytics, letting you slice and dice data across rows with precision and clarity!*