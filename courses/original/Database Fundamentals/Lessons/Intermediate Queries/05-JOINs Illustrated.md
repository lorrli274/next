> DEV: TODO step script for this step:

```sh
#!/bin/bash
mysql < "REPLACE INTO projects (id, name, value, start_date, end_date) VALUES (6, 'King Burgers Shop', 80000, '2018-03-15', '2018-12-01');"
```

All `JOIN`s are not created equal! The differences between each type are illustrated below using the _projects_ and *job_orders* tables.

## `INNER JOIN`

![](https://raw.githubusercontent.com/Codevolve/next/master/courses/original/Database%20Fundamentals/Lessons/assets/SQL.innerJoin.jpg)

By default, a `JOIN` in a query is an **`INNER JOIN`**. This `JOIN` limits the data returned to records that have results in both tables.

A new project called "King Burgers Shop" has been added to the _projects_ table (`SELECT` to view). The following query is designed to show each project's name and a count of the number of job orders that have been placed for that project:

```sql
SELECT name,
       COUNT(jo.id)
FROM   projects p
       INNER JOIN job_orders jo
               ON p.id = jo.project_id
GROUP  BY 1; 
```

However, the new project is not shown! This is because there are not job orders for it yet. As shown in the diagram above, only the data that has records in both tables will be returned

## `LEFT JOIN`

> DEV: TODO diagram

To include all the data from the **left** table (_projects_) regardless of whether or not it has records in the **right** table (*job_orders*) a `LEFT JOIN` can be used:

```sql
SELECT name,
       COUNT(jo.id)
FROM   projects p
       LEFT JOIN job_orders jo
              ON p.id = jo.project_id
GROUP  BY 1; 
```

Now, the new project is shown along with its count of job orders.

##`RIGHT JOIN`

>  DEV: TODO diagram

A **`RIGHT JOIN`** is similar to a `LEFT JOIN`, however the right table's data (*job_orders*) is used as the starting point. Here the tables are swapped in the query, but the same result is returned because a `RIGHT JOIN` is used:

```sql
SELECT name,
       COUNT(jo.id)
FROM   job_orders jo
       RIGHT JOIN projects p
               ON p.id = jo.project_id
GROUP  BY 1; 
```

### `FULL JOIN`
A **`FULL JOIN`** returns records for both tables, regardless of whether not a relationship exists between them. However, MySQL does not support `FULL JOIN`s, so instead this is covered in more depth in the next section on `UNION`s.

This is the equivelant query in MySQL using a `UNION ALL`:

```sql
SELECT *
FROM   projects p
       LEFT JOIN job_orders jo
              ON p.id = jo.project_id
UNION ALL
SELECT *
FROM   projects p
       RIGHT JOIN job_orders jo
               ON p.id = jo.project_id
WHERE  p.id IS NULL 
```
