# Database Basics

A collection of SQL practice files covering fundamental database concepts, SQL queries, data manipulation, and relational database operations.

## 📚 Topics Covered

This repository includes practical examples and exercises on:

* Database & Table Creation
* Primary Key & Foreign Key
* Data Insertion
* SELECT Queries
* Aggregate Functions
* GROUP BY
* JOIN Operations
* Views
* Triggers
* SQL Problem Solving

---

## 📂 SQL Files & Topics

### 1. `Create[database,table,insert].sql`

This file covers the basic steps of creating and preparing a relational database.

**Topics:**

* `CREATE DATABASE`
* `CREATE TABLE`
* `PRIMARY KEY`
* `FOREIGN KEY`
* `INSERT INTO`
* Table relationships
* Sample data insertion

---

### 2. `Aggregation_functions.sql`

This file focuses on SQL aggregate functions used to perform calculations on multiple rows.

**Topics:**

* `COUNT()` — counts rows
* `SUM()` — calculates the total
* `AVG()` — calculates the average
* `MIN()` — finds the minimum value
* `MAX()` — finds the maximum value

**Purpose:**
Useful for calculating totals, averages, counts, minimums, and maximums from database records.

---

### 3. `GroupBy.sql`

This file covers grouping records based on one or more columns.

**Topics:**

* `GROUP BY`
* Aggregate functions with `GROUP BY`
* Grouping records by categories
* Calculating summary information for each group

**Example concept:**

```sql
SELECT Department, COUNT(*)
FROM Employees
GROUP BY Department;
```

---

### 4. `Join_Operations.sql`

This file covers combining data from multiple related tables.

**Topics:**

* `INNER JOIN`
* `LEFT JOIN`
* Joining tables using related keys
* Retrieving data from multiple tables
* Table relationships

**Purpose:**
JOIN operations are used when required information is distributed across different tables.

---

### 5. `sql_queries.sql`

This file contains basic SQL query practice.

**Topics:**

* `SELECT`
* Selecting specific columns
* `WHERE`
* Filtering records
* Conditions
* Sorting and retrieving data

**Purpose:**
Practice the fundamental structure of SQL queries.

---

### 6. `sql_queries_1.sql`

This file contains additional SQL query practice.

**Topics:**

* Data retrieval
* Filtering
* Conditions
* Query combinations
* Practical SQL problem solving

**Purpose:**
Strengthen understanding of writing SQL queries for different requirements.

---

### 7. `PractiseProblem1.sql`

Contains SQL practice problems designed to improve basic database query skills.

**Focus:**

* Data retrieval
* Conditions
* Table-based queries
* Basic SQL problem solving

---

### 8. `PractiseProblem2.sql`

Contains additional SQL exercises.

**Focus:**

* SQL query writing
* Filtering data
* Working with database records
* Applying SQL conditions

---

### 9. `PractiseProblem3.sql`

Contains SQL problem-solving exercises.

**Focus:**

* Data retrieval
* Conditional queries
* Working with multiple records
* Practical SQL operations

---

### 10. `PractiseProblem4.sql`

Contains SQL practice problems involving database queries and data processing.

**Focus:**

* Query construction
* Filtering
* Data analysis
* Applying SQL concepts to practical problems

---

### 11. `PractiseProblem5.sql`

Contains further SQL exercises for practicing relational database queries.

**Focus:**

* SQL query logic
* Data filtering
* Record manipulation
* Problem solving

---

### 12. `PractiseProblem6.sql`

Contains SQL practice exercises focusing on applying database concepts to practical scenarios.

**Focus:**

* Query writing
* Data retrieval
* Conditions
* Relational data operations

---

### 13. `PractiseProblem7.sql`

Contains additional SQL problems for strengthening database query skills.

**Focus:**

* SQL problem solving
* Data retrieval
* Query conditions
* Applying multiple SQL concepts

---

### 14. `SQL_Views&Triggers_P1.sql`

This file introduces two important database concepts: **Views** and **Triggers**.

#### 👁️ Views

A **View** is a virtual table created from the result of a SQL query.

**Topics:**

* `CREATE VIEW`
* Selecting data from a View
* Using Views to simplify complex queries
* Combining data from multiple tables in a View
* Filtering data through a View

**Basic syntax:**

```sql
CREATE VIEW ViewName AS
SELECT column1, column2
FROM TableName
WHERE condition;
```

A View can then be queried like a table:

```sql
SELECT * FROM ViewName;
```

#### ⚡ Triggers

A **Trigger** is a database object that automatically executes when a specified event occurs.

**Common events:**

* `INSERT`
* `UPDATE`
* `DELETE`

**Topics:**

* `CREATE TRIGGER`
* `AFTER INSERT`
* `AFTER UPDATE`
* `AFTER DELETE`
* Automatic database actions

**Basic syntax:**

```sql
CREATE TRIGGER TriggerName
ON TableName
AFTER INSERT
AS
BEGIN
    -- Trigger logic
END;
```

---

## 🧠 Important SQL Concepts

### Database

A database is an organized collection of related data.

### Primary Key

A **Primary Key** uniquely identifies each record in a table.

```sql
PRIMARY KEY
```

### Foreign Key

A **Foreign Key** creates a relationship between two tables.

```sql
FOREIGN KEY
```

### JOIN

A JOIN combines related data from multiple tables.

```sql
INNER JOIN
LEFT JOIN
```

### Aggregate Functions

Aggregate functions perform calculations on multiple rows.

```sql
COUNT()
SUM()
AVG()
MIN()
MAX()
```

### GROUP BY

`GROUP BY` groups rows with the same values so aggregate calculations can be performed for each group.

### View

A View is a reusable virtual table based on a SQL query.

### Trigger

A Trigger automatically executes SQL statements when a specified database event occurs.

---

## 🛠️ SQL Concepts Practiced

```text
CREATE DATABASE
CREATE TABLE
PRIMARY KEY
FOREIGN KEY
INSERT INTO
SELECT
WHERE
GROUP BY
JOIN
INNER JOIN
LEFT JOIN
COUNT()
SUM()
AVG()
MIN()
MAX()
VIEW
TRIGGER
```

---

## 🎯 Purpose

The purpose of this repository is to practice SQL through hands-on exercises and develop a strong understanding of relational database concepts.

The repository progresses from basic database creation and SQL queries to more advanced concepts such as **JOINs, Views, and Triggers**.
