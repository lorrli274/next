The **`NULL`** value in a database indicates that no data is present for a record in a given column. It's different than the values 0, `FALSE`, and the empty string (''). It simply means that no value whatsoever is present.

`NULL` can be an especially tricky value to work with in databases. It can result in unexpected results being returned, especially if there is no default data provided.

For example, here's the data currently in the _projects_ table:

```sql
SELECT *
FROM   projects
ORDER  BY value; 
```

Note that the record with ID 5 has no value set yet.

As such, a query for all projects with a value below 1,000 will return nothing:

```sql
SELECT *
FROM   projects
WHERE  value < 1000; 
```

To address this, there are two things that can be done: add a default value or catch nulls when querying.

## Default Values
It's common for a default column value will be provided when creating a table. Here's an example of a table creation statement that defaults the _hours_ column to a value of 0.00:

```sql
CREATE TABLE `project_employees` (
  `employee_id` int(6) NOT NULL,
  `project_id` int(6) NOT NULL,
  `hours` float(6,2) NOT NULL DEFAULT '0.00'
)
```
When a new record is created and a value for _hours_ is not provided, it will be set to 0.00 by default.

Note also the use of the `NOT NULL` contraints. If you attempt to insert a record with a `NULL` value in column with a `NOT NULL` constraint, the database will reject the record (and it will not be saved).

Therefore, the following `INSERT` statement would fail:

```sql
INSERT INTO `project_employees` (employee_id, project_id, hours) VALUES (1, 2, NULL);
```

As would the following:

```sql
INSERT INTO `project_employees` (employee_id, project_id, hours) VALUES (NULL, 3, 1.40);
```

However, the following would pass:

```sql
INSERT INTO `project_employees` (employee_id, project_id, hours) VALUES (4, 5);
```
because the default value of 0.00 would be used. In the first example, `NULL` was provided explicitly, which caused it to fail.


## `COALESCE`
When it makes sense for `NULL` values to be present at times, the **`COALESCE`** function can be used to generate an ad hoc default value.

`COALESCE` takes 2 or more arguments and returns the first of them that is not `NULL`. For example:

* `COALESCE(NULL, 1000)` = 1000
* `COALESCE(NULL, '', 1000)` = ''
* `COALESCE(NULL)` = `NULL`

`COALESCE` can be used in both the `SELECT` column list and the `WHERE` condition list:

```sql
SELECT employee_id,
       project_id,
       COALESCE(value, 0) AS "value"
FROM   projects
WHERE  COALESCE(value, 0) < 1000; 
```

This can also be written using a `HAVING` clause:

```sql
SELECT employee_id,
       project_id,
       COALESCE(value, 0) AS "value"
FROM   projects
HAVING value < 1000; 
```
