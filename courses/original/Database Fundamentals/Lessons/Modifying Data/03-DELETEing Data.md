Removing data from a database is even easier than adding or updating it. This is done using the **`DELETE`** statement, structured like the below:

```sql
DELETE FROM table_name
WHERE conditions;
```

To delete all the job orders for a particular project below a price of $100, the following would be used:

```sql
DELETE FROM job_orders
WHERE
	project_id = 3 AND
	price < 100;
```

Then, confirm that the data has been deleted:

```sql
SELECT * FROM job_orders
WHERE
	project_id = 3 AND
	price < 100;
```

This should return no results.

You cannot `DELETE` data that has objects referencing it, so the following will fail:

```sql
DELETE FROM projects;
```

To do this, you would use a **`TRUNCATE TABLE`** statement:

```sql
TRUNCATE TABLE projects;
```

This will:

* Drop and recreate the _projects_ table (which is faster than a `DELETE` if the table hold)
* ​

danger> There are almost no everyday use cases for `TRUNCATE TABLE` statements. 

info> There is no reversing the deletion of data. Instead, many developers choose to follow the "never delete anything" rule of thumb and add a column to a table to indicate that the record is "deleted".<br><br>For example, they may add a `DATETIME` column (e.g. *deleted_at*) that is `NULL` by default and then set to the current time when the record is deleted. This column can then be filtered on (e.g. `deleted_at IS NULL`) when writing queries.
