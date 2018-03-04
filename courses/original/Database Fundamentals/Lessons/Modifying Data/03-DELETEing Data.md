Removing data from a table can be accomplished using the **`DELETE`** statement, as structured below:

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

info> There is no reversing the deletion of data. Instead, many developers choose to follow the "never delete anything" rule of thumb and add a column to a table to indicate that the record is "deleted". For example, a `DATETIME` that is `NULL` by default and then set to the current time when the record is deleted. This column can then be filtered on (e.g. `deleted_at IS NULL`) when writing queries.