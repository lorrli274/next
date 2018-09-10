The **`NULL`** value in a database indicates that no data is present for a record in a given column. It's different than the values 0, `FALSE`, and the empty string (''). It simply means that no value whatsoever is present.

`NULL` can be an especially tricky value to work with in databases. It can result in unexpected results being returned, especially if there is no default data provided.

For example, here's the data currently in the _projects_ table:

|id|name|value|start_date|end_date|
|--- |--- |--- |--- |--- |
|1|East Ave Shermans Diner|250000.0|2008-03-01|2012-05-15|
|2|Big Money Bank|560000.0|2012-02-15|2015-09-01|
|3|Central Valley Hospital|54000.0|2013-12-01|2017-09-15|
|4|Washington Avenue Barber|10000.0|2015-07-01|2020-08-01|
|5|Hamill, Berge and Adams Office|NULL|2018-01-01|2024-12-01|


Note that the record with ID 5 has no value set yet.

As such, a query for all projects with a value below 1,000 will return nothing:

```sql
SELECT *
FROM   projects
WHERE  value < 1000; 
```

To address this, there are two things that can be done: add a default value or catch `NULL`s when querying.

## Default Values
We briefly covered the `DEFAULT` keyword in the Columns lesson. If you need a quick refresher, you can go back to the Column Constraints step to reread how default column values are used when creating a table.

Here's an example of a table creation statement that combines the `DEFAULT` keyword with a `NOT NULL` constraint. It defaults the _hours_ column to a value of 0.00:

```sql
CREATE TABLE project_employees
  (
     employee_id INT(6) NOT NULL,
     project_id  INT(6) NOT NULL,
     hours       FLOAT(6, 2) NOT NULL DEFAULT '0.00'
  ) 
```
When a new record is created and a value for _hours_ is not provided, it will be set to 0.00 by default. 

If you attempt to insert a record with a `NULL` value in column with a `NOT NULL` constraint, the database will reject the record (and it will not be saved). Therefore, the following `INSERT` statement would fail:

```sql
INSERT INTO project_employees (employee_id, project_id, hours)
VALUES (1, 2, NULL);
```

As would the following:

```sql
INSERT INTO project_employees (employee_id, project_id, hours)
VALUES (NULL, 3, 1.40);
```

However, the following would pass:

```sql
INSERT INTO project_employees (employee_id, project_id, hours)
VALUES (4, 5);
```
because the default value of 0.00 would be used. In the first example, `NULL` was provided explicitly, which caused it to fail.

DEV: The following statement will change the default value of *employees.hourly_wage* to 0.00: 

```sql
ALTER TABLE employees ALTER hourly_wage SET DEFAULT 0.00;
```

1. Run this statement in your code editor, then try to insert a row into the *employees* table without specifying the hourly wage. You can use your own name in the *first_name* and *last_name* columns, and today’s date as the hire date. 
2. Now, try to insert another row of data explicitly providing `NULL` as the hourly wage. You should receive an error.

ANSWER:

1. INSERT INTO employees (first_name, last_name, hire_date) VALUES ('X', 'Y', CURDATE());
2. INSERT INTO employees (first_name, last_name, hourly_wage, hire_date) VALUES ('X', 'Y', NULL, CURDATE());

## Catch Nulls When Querying Using `COALESCE`

When it makes sense for `NULL` values to be present at times, the **`COALESCE`** function can be used to generate an ad hoc default value.

`COALESCE` takes 2 or more arguments and returns the first of them that is not `NULL`. For example:

* `COALESCE(NULL, 1000)` will return 1000
* `COALESCE(NULL, '', 1000)` will return ''
* `COALESCE(1000, NULL)` will return 1000
* `COALESCE(NULL)` will return `NULL`

If you run the following snippet in your code editor, you will see that the `NULL` value for the Hamill, Berge and Adams Office project now shows as ‘0.0’. The value is still `NULL` in the table, but the `COALESCE` function has temporarily replaced it just for this query.

```sql
SELECT id,
       name,
       COALESCE(value, 0) AS "value"
FROM   projects;
```

`COALESCE` can be used in both the `SELECT` column list and the `WHERE` condition list:

```sql
SELECT id,
       name,
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

DEV: From the *projects* table, write a query to capture and temporarily replace `NULL` values with ‘500,000’, then filter for all values greater or equal to 200,000. Pull only the *name* and *value* columns. 

```SQL
SELECT name, 
	   coalesce(value, 500000) AS value 
FROM projects
WHERE coalesce(value, 500000) >= 200000;
```

