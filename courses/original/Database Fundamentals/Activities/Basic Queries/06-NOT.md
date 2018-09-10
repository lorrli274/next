The **`NOT`** condition can be applied to many other operators to negate their affect.

For example, the `IN` clause can be combined with the `NOT` operator:

```sql
SELECT *
FROM   employees
WHERE  last_name NOT IN ( 'Hamill', 'Langworth', 'Sauer' ); 
```

It can also be used with the `LIKE` clause, for example to return all the employees whose first names do not start with "S":

```sql
SELECT *
FROM   employees
WHERE  first_name NOT LIKE 'S%'; 
```

Lastly, it can be used with the `BETWEEN` clause:

```sql
SELECT *
FROM   employees
WHERE  hourly_wage NOT BETWEEN 0 AND 50; 
```

DEV: Using the `NOT` condition, return all rows from the *job_orders* table that were placed for all projects except for project_id 2, 3 or 4, and were not placed any time between 2012-01-01 and 2017-01-01. 

ANSWER:

```sql
SELECT * 
FROM job_orders
WHERE project_id NOT IN (2, 3, 4)
AND order_datetime NOT BETWEEN 2012-01-01 AND 2017-01-01;
```

