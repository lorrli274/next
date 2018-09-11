A useful feature of some databases is the **`HAVING`** clause. It is similar to a `WHERE` clause, but it allows the results to be filtered on a aggregated column.

For example, the following query will not work:

```sql
SELECT p.name,
       SUM(pe.hours) AS project_hours
FROM   project_employees pe
       JOIN projects p
         ON p.id = pe.project_id
WHERE  project_hours > 4000
GROUP  BY 1
ORDER  BY 2 DESC; 
```

This is because the column _project_hours_ is an aggregate of the column *hours* - i.e. it doesn't actually exist until the query is run. To handle this, a `HAVING` clause is used after the `GROUP BY` statement:

```sql
SELECT p.name,
       SUM(pe.hours) AS project_hours
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
       SUM(pe.hours) AS project_hours
FROM   project_employees pe
       JOIN projects p
         ON p.id = pe.project_id
WHERE  p.name LIKE '%Ave%'
GROUP  BY 1
HAVING project_hours > 3000
ORDER  BY 2 DESC
LIMIT  1; 
```

DEV: In the previous step, you found the cost per project. Looking at your results, you realize the Central Valley Hospital project and the Big Money Bank project cost much more than you thought it would. Let’s take a look at how much each employee is spending on these two projects - specifically those who are spending over $10,000,000 on either project.

Write a query to return the projects name, employee’s first name, employee’s last name, and cost of their job orders. Remember cost is calculated by multiplying the sum of quantity by sum of price. Order your results by highest cost to lowest. 

Answer: 

```sql
SELECT p.name AS "Project Name", 
       e.first_name AS "First Name", 
       e.last_name AS "Last Name",
       SUM(jo.quantity) * SUM(jo.price) AS "Cost"
FROM employees e
JOIN job_orders jo ON e.id = jo.employee_id
JOIN projects p ON p.id = jo.project_id
WHERE p.name IN ( "Big Money Bank", "Central Valley Hospital")
GROUP BY 1, 2, 3
HAVING Cost > 10000000
ORDER BY 4 DESC;
```

