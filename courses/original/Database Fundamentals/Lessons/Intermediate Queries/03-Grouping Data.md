Grouping data in a query allows for aggregations to be run within a specific scope. A **`GROUP BY`** expression can be used to define these scopes.

For example, determining the total number of hours worked by all employees on a project requires a `GROUP BY`. Without it could result in a query like:

```sql
SELECT SUM(pe.hours) FROM project_employees pe JOIN projects p on p.id = pe.project_id;
```

This returns the number of hours for all projects and doesn't display which project had how many hours. This will:

```sql
SELECT p.name, SUM(pe.hours) FROM project_employees pe JOIN projects p on p.id = pe.project_id GROUP BY p.name;
```

Like an `ORDER BY`, a `GROUP BY` can use a column alias instead of a column name:

```sql
SELECT p.name, SUM(pe.hours) FROM project_employees pe JOIN projects p on p.id = pe.project_id GROUP BY 1 ORDER BY 2 DESC;
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