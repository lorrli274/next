The `COUNT`, `SUM`, `AVG`, `MAX`, and `MIN` aggregations we just learned aggregate over the entire table. However you can run aggregations over specific scopes by **grouping** data. A **`GROUP BY`** expression is used to define these scopes.

For example, determining the total number of hours worked by all employees on a project requires a `GROUP BY`. The following snippet shows a query without a `GROUP BY`. 

```sql
SELECT SUM(pe.hours)
FROM   project_employees pe
       JOIN projects p
         ON p.id = pe.project_id; 
```

It returns the number of hours for all projects and doesn't display which project had how many hours. However, this query will:

```sql
SELECT p.name,
       SUM(pe.hours)
FROM   project_employees pe
       JOIN projects p
         ON p.id = pe.project_id
GROUP  BY p.name; 
```

Like `ORDER BY`, `GROUP BY` can use a column alias instead of a column name:

```sql
SELECT p.name,
       SUM(pe.hours)
FROM   project_employees pe
       JOIN projects p
         ON p.id = pe.project_id
GROUP  BY 1
ORDER  BY 2 DESC; 
```

Multiple `GROUP BY`s can also be used, for example to display the amount spent by each employee on each project:

```sql
SELECT p.name,
       e.first_name,
       e.last_name,
       SUM(jo.price)
FROM projects p
JOIN job_orders jo ON p.id = jo.project_id
JOIN employees e ON e.id = jo.employee_id
GROUP BY 1,
         2,
         3
ORDER BY 1,
         4 DESC;
```

This displays each project ordered by name A-Z and then the employees who have spent the most on that project.

DEV: You would like to find out the cost of all job orders by project name. Write a query to return project name, sum of quantity, sum of price, and cost. To create the *cost* column, you can use the arithmetic operator “*“ to multiply the sum of quantity and sum of price. You should order your results by the highest to lowest cost.

ANSWER: 

```sql
SELECT p.name AS "Project Name", 
       sum(jo.quantity) AS "Quantity",
       sum(jo.price) AS "Price",
       sum(jo.quantity) * sum(jo.price) AS "Cost"
FROM job_orders jo
JOIN projects p ON jo.project_id = p.id
GROUP BY 1
ORDER BY 4 DESC;
```

