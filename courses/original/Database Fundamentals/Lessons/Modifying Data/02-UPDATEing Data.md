Once records have been added to a table, they can be modified using an **`UPDATE`** statement, which is structured as follows:

```sql
UPDATE table_name 
SET 
	column1 = expression1,
	column2 = expression2,
WHERE
    conditions;
```

For example, the following would change the name of all projects for banks to "A Bank Construction Project":

```sql
UPDATE projects
SET
	name = 'A Construction Project'
WHERE
	name ILIKE '%bank%';
```

You can select the data to see what has changed:

```sql
SELECT * FROM projects;
```

The expression that a column's value is set to does not need to be a constant value. For example, this would give a 10% raise to all employees earning less than $20.00 an hour:

```sql
UPDATE employees
SET
	hourly_wage = hourly_wage * 1.1
WHERE
	hourly_wage < 20;
```

Multiple update values and conditions can also be set:

```sql
UPDATE job_orders
SET
	quantity = quantity * 2,
	price = price * 2
WHERE
	project_id = 2 AND
	description ILIKE '%Tool Kit%';
```

info> Changes to the data in a table cannot be undone, so it's good to `SELECT` the data before running an `UPDATE` (using the same conditions) to ensure the records that will be updated are what you expect!

