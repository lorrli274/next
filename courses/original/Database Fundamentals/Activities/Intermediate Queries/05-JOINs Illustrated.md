> DEV: TODO step script for this step:

```sh
#!/bin/bash
mysql < "REPLACE INTO projects (id, name, value, start_date, end_date) VALUES (6, 'King Burgers Shop', 80000, '2018-03-15', '2018-12-01');"
```

So far, we’ve only used `JOIN` to join our tables...however, all `JOIN`s are not created equal! The differences between each type are illustrated below using the _projects_ and *job_orders* tables.

## `INNER JOIN`

![](https://raw.githubusercontent.com/Codevolve/next/master/courses/original/Database%20Fundamentals/Lessons/assets/SQL.innerJoin.jpg)

By default, a `JOIN` in a query is an **`INNER JOIN`** (so everything we’ve done up to now has been an inner join). This `JOIN` limits the data returned to records that have results in both tables.

A new project called "King Burgers Shop" has been added to the _projects_ table (`SELECT` to view). The following query is designed to show each project's name and a count of the number of job orders that have been placed for that project:

```sql
SELECT name,
       COUNT(jo.id)
FROM   projects p
       INNER JOIN job_orders jo
               ON p.id = jo.project_id
GROUP  BY 1; 
```

However, the new project is not shown! This is because there are no job orders for it yet. As shown in the diagram above, only the data that has records in both tables will be returned

## `LEFT JOIN`

![](https://raw.githubusercontent.com/Codevolve/next/master/courses/original/Database%20Fundamentals/Lessons/assets/SQL.leftJoin.jpg)

To include all the data from the **left** table (_projects_) regardless of whether or not it has records in the **right** table (*job_orders*) a `LEFT JOIN` can be used:

```sql
SELECT name,
       COUNT(jo.id)
FROM   projects p
       LEFT JOIN job_orders jo
              ON p.id = jo.project_id
GROUP  BY 1; 
```

Now, the new project is shown along with its count of job orders (zero).

## `RIGHT JOIN`

![](https://raw.githubusercontent.com/Codevolve/next/master/courses/original/Database%20Fundamentals/Lessons/assets/SQL.rightJoin.jpg)

A **`RIGHT JOIN`** is similar to a `LEFT JOIN`, however the right table's data (*job_orders*) is used as the starting point. If we used a `RIGHT JOIN`, King Burgers Shop does not shown.

```sql
SELECT name,
       COUNT(jo.id)
FROM   projects p
       RIGHT JOIN job_orders jo
               ON p.id = jo.project_id
GROUP  BY 1; 
```

However, if we swap the order of the tables in the query, King Burgers Shop is returned with the `RIGHT JOIN`! 

```sql
SELECT name,
       COUNT(jo.id)
FROM   job_orders jo
       RIGHT JOIN projects p
               ON p.id = jo.project_id
GROUP  BY 1; 
```

### `FULL JOIN`
![](https://raw.githubusercontent.com/Codevolve/next/master/courses/original/Database%20Fundamentals/Lessons/assets/SQL.fullOuterJoin.jpg)

A **`FULL JOIN`** returns records for both tables, regardless of whether not a relationship exists between them. However, MySQL does not support `FULL JOIN`s, so instead this is covered in more depth in the next section on `UNION`s.

This is the equivalent query in MySQL using a `UNION ALL`:

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

DEV: Macie Kautzer (ID 3), Lillie Donnelly (ID 5), and Agnes Zulauf (ID 6) do not have any reported hours in the *project_employees* table. You can confirm this by running this:

```SQL
SELECT * 
FROM project_employees
WHERE employee_id IN (3, 5, 6);
```

1. For ALL employees, write a query with a `RIGHT JOIN` that returns their ID, first name, last name, and sum of hours (this column should show ‘0.00’ for the three employees with zero hours).

   ```SQL
   SELECT e.id, e.first_name, e.last_name, coalesce(SUM(pe.hours), 0)
   FROM project_employees pe
   RIGHT JOIN employees e ON e.id = pe.employee_id
   GROUP BY 1, 2, 3;
   ```

2. For ALL employees, write a query with a `LEFT JOIN` that returns their ID, first name, last name, and sum of hours (this column should show ‘0.00’ for the three employees with zero hours).

   ```SQL
   SELECT e.id, e.first_name, e.last_name, coalesce(SUM(pe.hours), 0)
   FROM employees e
   LEFT JOIN project_employees pe ON e.id = pe.employee_id
   GROUP BY 1, 2, 3;
   ```

3. For only employees with hours, write a query with a `RIGHT JOIN` that returns their ID, first name, last name, and sum of hours. 

   ```sql
   SELECT e.id, e.first_name, e.last_name, SUM(pe.hours)
   FROM employees e 
   RIGHT JOIN project_employees pe ON e.id = pe.employee_id
   GROUP BY 1, 2, 3
   ORDER BY 1;
   ```

4. For only employees with hours, write a query with a `LEFT JOIN` that returns their ID, first name, last name, and sum of hours. 

   ```SQL
   SELECT e.id, e.first_name, e.last_name, SUM(pe.hours)
   FROM project_employees pe
   LEFT JOIN employees e ON e.id = pe.employee_id
   GROUP BY 1, 2, 3
   ORDER BY 1;
   ```

