# Columns

Each **column** of a table stores a specific attribute about a row. A table can have as many columns as you'd like, but tables with too many columns are good candidates for splitting into multiple tables.

In a table storing information about employees, _first\_name_ is a potential column:

| first_name |
| ---------- |
| Samantha   |
| Devin      |
| Kylah      |
| Ali        |
| Lathan     |

A column should only ever store data for one attribute. For example, you would never want to sometimes store an employee's last name in a column called _first\_name_.

Deciding what to store in each column is important. You may find yourself asking these questions:

* Should I store the first and last name in a column called _name_, or separately?
* Should I store an entire address in one column, or break it up into _street_, _city_, _state_, _zip_, etc.?
* Should I store a employee's age or their date of birth?

The answers to these questions can be found the requirements of your application. The respective answers might be:

* Yes, because I only ever use a employee's full name, not their first or last name.
* No, because I will want to be able to find all employees in a specific zip code.
* No, because I can calculate their age from their date of birth at any time.

When in doubt, it's best to store data in as much detail as possible, and to avoid storing data that can be inferred from other data (e.g. store a employee's date of birth instead of their age).

# Data Types

The type of data stored in each column varies from column to column. Database software allow you to pick from a number of different types when designing your database. The commonly used ones are:

| Type             | Stores                                   | Maximum             |
| ---------------- | ---------------------------------------- | ------------------- |
| `INT`            | An integer between -2147483648 and  2147483647. | 11 numbers          |
| ``FLOAT(M,D)``   | A floating-point number with *M* total digits and up to *D* decimal places. | 24 decimal places   |
| ``DOUBLE(M, D)`` | A floating-point number with *M* total digits and up to *D* decimal places (but 2x the size of a `FLOAT`) | 53 decimal places   |
| `CHAR(M)`        | A fixed-length string _M_ characters long. Uses all _M_ characters, padding the string with ending spaces. | 255 characters      |
| `VARCHAR(M)`     | A variable-length string of up to _M_ characters. Only stores the characters provided and does not pad the string. | 255 characters      |
| `BLOB` or `TEXT` | A large storage type for text or other data (e.g. JSON). `BLOB`s are case sensitive when extracting data while `TEXT`s are not. | 65535 characters    |
| `DATE`           | A date formatted as _YYYY-MM-DD_.        | 9999-12-31          |
| `DATETIME`       | A date and time formatted as _YYYY-MM-DD HH:MM:SS_. | 9999-12-31 23:59:59 |

# Column Constraints

> TODO: All the below need to have code blocks

Columns can have a number of **constraints** placed on them to ensure that the data they contain is predictable. For example, you may want to:

* Ensure that each employee has a name
* Never store two projects with the same name
* Never store data for job orders without an employee

To do this and many other things you use a combination of one or more constraints on a column.

## `NOT NULL` Constraint

A `NOT NULL` constraint ensures that the column does not contain `NULL` values. `NULL` is the default value stored in a column if no data is inserted for it when a record is created.

You can use a `NOT NULL` constraint to force a user of a database to insert data for a column that you expect there to always be data for (like a name, foreign key, or project value).

## `DEFAULT` Constraint

A `DEFAULT` constraint sets the value of a column to a value if one is not provided. If used with a `NOT NULL` constraint, it provides a convenient way to initialize data without having to set it when a new record is created.

For example, if you are storing job orders, you may want to start each _total_ column with a default value of 0.

## `UNIQUE` Constraint

The `UNIQUE` constraint ensures that a specific value only exists once for a column. This is used to ensure that duplicated data isn't inserted by mistake.

With a `UNIQUE` constraint on the _projects.name_ column (note the use of a `.` to indicate the _name_ column on the _projects_ table), you would not be able to have the following data in a _projects_ table:

| id   | name          | value      |
| ---- | ------------- | ---------- |
| 1    | West Ave Cafe | 100000.00  |
| 2    | West Ave Cafe | 2500000.00 |

because the SSN's are duplicated.

However, you could have the following data in the table:

| id   | name          | value      |
| ---- | ------------- | ---------- |
| 1    | West Ave Cafe | 2500000.00 |
| 2    | East Ave Cafe | 2500000.00 |

since the `UNIQUE` constraint is only on the _name_ column.

## `CHECK` Constraint

A `CHECK` constraint allows you to ensure that a value being inserted matches a pre-defined condition. The rule(s) for a `CHECK` constraint are written similar to a `SELECT` statement.

## `Primary Key` Constraint

A `PRIMARY KEY` constraint ensures that a unique, not-`NULL` identifier is provided for each row in a table. A record's primary key is often used by foreign keys in other tables to reference that record.

## `FOREIGN KEY` CONSTRAINT

A `FOREIGN KEY` constraint ensures that if a value is provided for the column with the constraint, then a record in the referenced table exists with the correct key.

For example, if you had only the following data in an _employees_ table:

| id   | first_name | last_name |
| ---- | ---------- | --------- |
| 3    | Kylah      | Whitney   |
| 4    | Ali        | Chandler  |

then you could not insert a record into a _job_orders_ table referencing an employee with an _id_ of 8.

## `INDEX` Constraint

An `INDEX` constraint can be applied to one or more columns to speed up the retreival of data from that table. It's common to add indexes to primary and foreign keys, as well as any other columns that will be used frequently in large tables.

In a _job_orders_ table, you may want to add an index to the _employee_id_ column so that you can quickly find all the job orders placed by a specific employee.

However, each index comes with a cost. When a new record is added to a table, updated, or deleted, the index must regenerate. Index data is also stored separately from the rest of the table, so large indexes can bloat the size of a database.

Indexes rely on several different data structures, the most common of which being a [B-tree](https://en.wikipedia.org/wiki/B-tree).
