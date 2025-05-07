# 🧠 Commands in MySQL

<p align="center">
  <img src="https://github.com/jeevan499/SQL/blob/main/1.%20Commands/commands%20in%20MySQL.jpg" alt="SQL Banner" />
</p>


## 📘 Overview

In MySQL, SQL commands are grouped into categories based on their functionality. Understanding these command types is essential for efficient database interaction and management. There are **five main categories** of SQL statements:

- DDL (Data Definition Language)
- DML (Data Manipulation Language)
- DQL (Data Query Language)
- DCL (Data Control Language)
- TCL (Transaction Control Language)

---

## 1️⃣ DDL – Data Definition Language

DDL commands are used to **define or modify the structure of a database** such as tables, schemas, or indexes.

| Command | Description |
|---------|-------------|
| `CREATE` | Creates a new database object such as a table or view. |
| `ALTER` | Modifies an existing database object (e.g., add/remove columns). |
| `DROP` | Deletes objects like tables or databases. |
| `TRUNCATE` | Removes all records from a table, resetting auto-increment values. |
| `RENAME` | Changes the name of a table or database object. |

✅ *DDL commands are auto-committed – changes are permanent immediately.*

---

## 2️⃣ DML – Data Manipulation Language

DML commands are used to **manipulate data within tables**.

| Command | Description |
|---------|-------------|
| `INSERT` | Adds new records to a table. |
| `UPDATE` | Modifies existing records in a table. |
| `DELETE` | Removes records from a table. |

✅ *DML operations can be rolled back (used with transactions).*

---

## 3️⃣ DQL – Data Query Language

DQL is used to **fetch data** from a database.

| Command | Description |
|---------|-------------|
| `SELECT` | Retrieves records from one or more tables. |

🔍 *This is the most used command to query databases and retrieve information.*

---

## 4️⃣ DCL – Data Control Language

DCL commands are used to **control access to data** in the database.

| Command | Description |
|---------|-------------|
| `GRANT` | Provides user access privileges. |
| `REVOKE` | Removes user access privileges. |

🔐 *Useful for managing database security.*

---

## 5️⃣ TCL – Transaction Control Language

TCL commands are used to **manage transactions** in the database to maintain data integrity.

| Command | Description |
|---------|-------------|
| `COMMIT` | Saves all changes made during the transaction. |
| `ROLLBACK` | Undoes changes if there is an error. |
| `SAVEPOINT` | Sets a point within a transaction to roll back to. |
| `SET TRANSACTION` | Sets properties for a transaction. |

🔁 *TCL is mainly used with DML operations to ensure data consistency.*

---

## 🧩 Summary Table

| Command Type | Primary Use | Key Commands |
|--------------|-------------|--------------|
| DDL | Define or modify schema | CREATE, ALTER, DROP, TRUNCATE |
| DML | Manage table data | INSERT, UPDATE, DELETE |
| DQL | Retrieve data | SELECT |
| DCL | Access control | GRANT, REVOKE |
| TCL | Manage transactions | COMMIT, ROLLBACK, SAVEPOINT |

---

## 📌 Final Note

Understanding these SQL command types helps in organizing SQL queries more efficiently and mastering how databases operate under the hood.  
Explore the full SQL file here 👉 [Commands in MySQL.sql](https://github.com/jeevan499/SQL/blob/main/1.%20Commands/Commands%20in%20MySQL.sql)
