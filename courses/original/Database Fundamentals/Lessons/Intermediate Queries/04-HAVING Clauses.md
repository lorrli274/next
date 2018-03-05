A useful feature of some databases is the **`HAVING`** clause. It is similar to a `WHERE` clause, but it allows the results to be filtered on a column that has already been selected.

For example, the following query will not work:

```sql
SELECT p.name,
       Sum(pe.hours) AS project_hours
FROM   project_employees pe
       JOIN projects p
         ON p.id = pe.project_id
WHERE  project_hours > 4000
GROUP  BY 1
ORDER  BY 2 DESC; 
```

This is because the column _project_hours_ doesn't actually exist until the query is run. To handle this, a `HAVING` clause is used after the `GROUP BY` statement:

```sql
SELECT p.name,
       Sum(pe.hours) AS project_hours
FROM   project_employees pe
       JOIN projects p
         ON p.id = pe.project_id
GROUP  BY 1
HAVING project_hours > 4000
ORDER  BY 2 DESC; 
```

Here's an example of a query using a `SELECT`, `JOIN`, `WHERE`, `GROUP BY`, `HAVING`, `ORDER BY`, and `LIMIT`:

```sql
SELECT p.name,
       Sum(pe.hours) AS project_hours
FROM   project_employees pe
       JOIN projects p
         ON p.id = pe.project_id
WHERE  p.name LIKE '%Ave%'
GROUP  BY 1
HAVING project_hours > 3000
ORDER  BY 2 DESC
LIMIT  1; 
```

