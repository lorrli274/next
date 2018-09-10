We first mentioned column constraints in the Creating a Table lesson, and introduced the `PRIMARY KEY` constraint. Columns can have a number of **constraints** placed on them to ensure that the data they contain is predictable. This helps keep your database normalized. 

For example, you may want to:

* Ensure that each employee has a name
* Never store two projects with the same name
* Never store data for job orders without an employee

To do this and many other things you use a combination of one or more constraints on a column. Here are some commonly used constraints:

## `NOT NULL` Constraint

A **`NOT NULL`** constraint ensures that the column does not contain `NULL` values. `NULL` is the default value stored in a column if no data is inserted for it when a record is created.

You can use a `NOT NULL` constraint to force a user of a database to insert data for a column that you expect there to always be data for (like a name, foreign key, or project value).

## `DEFAULT` Constraint

A **`DEFAULT`** constraint sets the value of a column to a value if one is not provided. If used with a `NOT NULL` constraint, it provides a convenient way to initialize data without having to set it when a new record is created.

For example, if you are storing job orders, you may want to start each _total_ column with a default value of 0.

## `UNIQUE` Constraint

The **`UNIQUE`** constraint ensures that a specific value only exists once for a column. This is used to ensure that duplicated data isn't inserted by mistake.

With a `UNIQUE` constraint on the _projects.name_ column (note the use of a `.` to indicate the _name_ column on the _projects_ table), you would not be able to have the following data in a _projects_ table:

| id   | name          | value      |
| ---- | ------------- | ---------- |
| 1    | West Ave Cafe | 100000.00  |
| 2    | West Ave Cafe | 2500000.00 |

because the project names are duplicated.

However, you could have the following data in the table:

| id   | name          | value      |
| ---- | ------------- | ---------- |
| 1    | West Ave Cafe | 2500000.00 |
| 2    | East Ave Cafe | 2500000.00 |

since the `UNIQUE` constraint is only on the _name_ column.

## `CHECK` Constraint

A **`CHECK`** constraint allows you to ensure that a value being inserted matches a pre-defined condition. For example, you could make sure that all employees are being paid above the Federal minimum wage of $7.25 by using the check constraint like this:

```sql
CREATE TABLE employees 
	(
		id 			INT(6) AUTO_INCREMENT PRIMARY KEY,
		first_name 	VARCHAR(300),
 	   	last_name 	VARCHAR(300),
        hourly_wage	FLOAT(5, 2),
	    hire_date 	DATE,
	    CHECK (hourly_wage >= 7.25)
    );
```

## `Primary Key` Constraint

A **`PRIMARY KEY`** constraint ensures that a unique, not-`NULL` identifier is provided for each row in a table. A record's primary key is often used by foreign keys in other tables to reference that record.

## `FOREIGN KEY` CONSTRAINT

A **`FOREIGN KEY`** constraint ensures that if a value is provided for the column with the constraint, then a record in the referenced table exists with the correct key.

For example, if you had only the following data in an *employees* table:

| id   | first_name | last_name |
| ---- | ---------- | --------- |
| 3    | Kylah      | Whitney   |
| 4    | Ali        | Chandler  |

then you could not insert a record into a *job_orders* table referencing an employee with an ID of 8.

## `INDEX` Constraint

An **`INDEX`** constraint can be applied to one or more columns to speed up the retrieval of data from that table. It Is common to create indexes to primary and foreign keys, as well as any other columns that will be used frequently in queries.

In a *job_orders* table, you may want to add an index to the *employee_id* column so that you can quickly find all the job orders placed by a specific employee. The syntax to do so is:

```sql
CREATE INDEX idx_employee_id
ON job_orders (employee_id);
```

Each index, however, comes with a cost. When a table with an index is updated, the index must regenerate which takes time. Index data is also stored separately from the rest of the table, so large indexes can bloat the size of a database.

Indexes rely on several different data structures, the most common of which being a [B-tree](https://en.wikipedia.org/wiki/B-tree).

Dev: Let's practice creating a table with column constraints. Create a new table *contractors* to store information about Codey's Constructions contract employees. This table should follow this structure:

| Question      | *contractors* table                                          |
| ------------- | ------------------------------------------------------------ |
| Type of data  | Contract employee data                                       |
| Attributes    | ID, first name, last name, hire date, contract length, hourly wage, agency_id |
| Data type     | `INT(6)`, `VARCHAR(300)`, `VARCHAR(300)`, `DATE`, `INT(10)`, `FLOAT(6, 2)`, `INT(6)` |
| Relationships | 1. Contractors can work on many projects<br />2. Contractors belong to one agency |

- The ID should be the contractors' unique identifier (i.e. PK) and should auto-increment. 
- No columns should be allowed to have `null` values.
- The hourly wage for all contractors should be greater or equal to $10.00/hr. 
- The *agency_id* column references another table so it should be a foreign key.
- Codey's Construction's data analysts use the *agency_id* column frequently to run queries. To help speed things up, add an index to this column.

ANSWER: 

```sql
CREATE TABLE contractors
	(
        id INT(6) AUTO_INCREMENT PRIMARY KEY,
        first_name VARCHAR(300) NOT NULL,
        last_name VARCHAR(300) NOT NULL,
        hire_date DATE NOT NULL,
        contract_length INT(10) NOT NULL,
        hourly_wage FLOAT(6, 2) NOT NULL,
        agency_id INT(6) NOT NULL FOREIGN KEY,
        CHECK (hourly_wage => 10)
    );

CREATE INDEX idx_agency_id 
ON contractors (agency_id);
```

