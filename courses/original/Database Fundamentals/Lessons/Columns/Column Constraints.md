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