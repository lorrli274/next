Columns can be added, modified, and removed after a table has been created using an `ALTER TABLE` statement.

## Adding a Column

A new column can be added using a **`ADD COLUMN`** statement:

```sql
ALTER TABLE employees
  ADD COLUMN phone_number VARCHAR(20); 
```

This inserts a new column called *phone_number* of type `VARCHAR(30)` as the last column in the table.

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

A column can be modified using a **`CHANGE COLUMN`** statement. The following would rename the _name_ column of the _projects_ table to _project_name_ and increase its maximum length to 500 characters (from 300);

```sql
ALTER TABLE projects
  CHANGE COLUMN name project_name VARCHAR(500) NOT NULL,
```



## Deleting a Column

Deleting a column is irreversible, so make sure you're absoloutely certain you'd like to delete it before you 
