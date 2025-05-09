# 🧠 Triggers in MySQL

<p align="center">
  <img src="https://www.mysqltutorial.org/wp-content/uploads/2020/07/MySQL-Trigger.png" alt="MySQL Triggers" />
</p>

🔗 [View SQL File on GitHub](https://github.com/jeevan499/SQL/blob/main/9.%20Triggers/Triggers%20in%20MySQL.sql)

---

## 📘 Overview

**Triggers** in MySQL are special stored procedures that automatically execute in response to specific events on a table, such as `INSERT`, `UPDATE`, or `DELETE`. They are used to enforce business rules, maintain data integrity, or automate tasks.

---

## ⚙️ Key Features of Triggers

- **Automation**: Execute automatically when a defined event occurs.
- **Event-Driven**: Respond to `INSERT`, `UPDATE`, `DELETE` operations.
- **Row-Level**: Can act on each affected row (`FOR EACH ROW`).
- **Use Cases**: Audit logging, data validation, or cascading updates.

---

## ⚙️ Syntax

### Creating a Trigger
```sql
CREATE TRIGGER trigger_name
[BEFORE | AFTER] [INSERT | UPDATE | DELETE]
ON table_name
FOR EACH ROW
BEGIN
  -- Trigger logic
END;
```

### Dropping a Trigger
```sql
DROP TRIGGER [IF EXISTS] trigger_name;
```

### Viewing Triggers
```sql
SHOW TRIGGERS [FROM database_name];
```

---

## ✅ Examples

### 🔹 1. Logging Insert Operations

```sql
CREATE TRIGGER after_employee_insert
AFTER INSERT ON employees
FOR EACH ROW
BEGIN
  INSERT INTO employee_audit (employee_id, action, action_date)
  VALUES (NEW.employee_id, 'INSERT', NOW());
END;
```

### 🔹 2. Preventing Invalid Updates

```sql
CREATE TRIGGER before_salary_update
BEFORE UPDATE ON employees
FOR EACH ROW
BEGIN
  IF NEW.salary < 0 THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'Salary cannot be negative';
  END IF;
END;
```

### 🔹 3. Cascading Updates

```sql
CREATE TRIGGER after_department_update
AFTER UPDATE ON departments
FOR EACH ROW
BEGIN
  UPDATE employees
  SET department_name = NEW.department_name
  WHERE department_id = OLD.id;
END;
```

### 🔹 4. Logging Deleted Records

```sql
CREATE TRIGGER before_employee_delete
BEFORE DELETE ON employees
FOR EACH ROW
BEGIN
  INSERT INTO employee_archive (employee_id, first_name, last_name, deleted_date)
  VALUES (OLD.employee_id, OLD.first_name, OLD.last_name, NOW());
END;
```

### 🔹 5. Dropping a Trigger

```sql
DROP TRIGGER IF EXISTS after_employee_insert;
```

---

## 📎 Summary Table

| Trigger Type        | Description                                      | Sample Context                     |
|---------------------|--------------------------------------------------|------------------------------------|
| BEFORE Trigger      | Executes before the event (e.g., validate data)  | Prevent negative salaries          |
| AFTER Trigger       | Executes after the event (e.g., log changes)     | Audit employee insertions          |
| INSERT Trigger      | Responds to row insertions                       | Log new employee records           |
| UPDATE Trigger      | Responds to row updates                          | Sync department name changes       |
| DELETE Trigger      | Responds to row deletions                        | Archive deleted employees          |

---

## 📎 Reference

Explore the full SQL script here 👉 [Triggers in MySQL.sql](https://github.com/jeevan499/SQL/blob/main/9.%20Triggers/Triggers%20in%20MySQL.sql)

---

💡 *Triggers in MySQL are like silent guardians, automatically enforcing rules and keeping your database in check with every change!*