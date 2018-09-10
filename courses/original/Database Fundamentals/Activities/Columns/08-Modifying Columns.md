So far, we've learned how to create tables with columns of specific data types, satisfy Third Normal Form, and add column constraints. However, you may create a table without knowing exactly how many columns you need, or need to change them. Columns can be added, modified, and removed after a table has been created using an `ALTER TABLE` statement.

## Adding a Column

A new column can be added using a **`ADD COLUMN`** statement:

```sql
ALTER TABLE employees
  ADD COLUMN phone_number VARCHAR(20); 
```

This inserts a new column called *phone_number* of type `VARCHAR(20)` as the last column in the table.

The position of the new column can be changed using the **`AFTER`** keyword:

```sql
ALTER TABLE employees
  ADD COLUMN phone_number VARCHAR(20) AFTER last_name;
```

This will insert the *phone_number* column directly after the *last_name* column. Instead of `AFTER`, **`FIRST`** can be used to insert the column as the first column in the table.

Any number of constraints can be applied to a new column when it is added, for example a `NOT NULL` constraint:

```sql
ALTER TABLE employees
  ADD COLUMN has_cdl BOOLEAN NOT NULL;
```

However, if there is existing data this will fail as the current records would violate the `NOT NULL` constraint.

To avoid this, a default value may be provided:

```sql
ALTER TABLE employees
  ADD COLUMN has_cdl BOOLEAN NOT NULL DEFAULT FALSE;
```

## Changing a Column

A column can be modified using a **`CHANGE COLUMN`** statement. The following would rename the _name_ column of the _projects_ table to _project_name_ and increase its maximum length to 500 characters (from 300):

```sql
ALTER TABLE projects
  CHANGE COLUMN name project_name VARCHAR(500) NOT NULL;
```

## Deleting a Column

Deleting a column is irreversible, so make sure you're absolutely certain you'd like to delete it before you run the `DELETE COLUMN` statement. If you decide you no longer need to track employees' phone numbers, you would delete this column from the *employees* table using the following syntax:

```sql
ALTER TABLE employees
	DROP COLUMN phone_number;
```

 DEV> Using the *contractors* table that we created in the last step, let's practice adding, changing, and deleting columns. 

| id   | first_name | last_name | hire_date | contract_length | hourly_wage | agency_id |
| ---- | ---------- | --------- | --------- | --------------- | ----------- | --------- |
|      |            |           |           |                 |             |           |

1. You realize after you created the table that there is no need to separate first name and last name. Add a new column to store contractors' full names as *name*, and delete the *first_name* and *last_name* columns. 
2. You also realize that the *contract_length* column is frequently misinterpreted. It should store the contract length in days, but some of your fellow data analysts thought it stores the data in months. Let's rename the column to *contract_length_days* to avoid further miscommunication. 

ANSWER: 

ALTER TABLE contractors ADD COLUMN name VARCHAR(300); 

ALTER TABLE contractors DROP COLUMN first_name, DROP COLUMN last_name;

ALTER TABLE contractors CHANGE COLUMN contract_length contract_length_days;