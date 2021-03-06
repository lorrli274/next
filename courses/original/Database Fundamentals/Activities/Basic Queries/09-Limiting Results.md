Sometimes it's not necessary to return a full set of data, especially when working with large datasets. This may occur when you just want to check the existence of a single record that matches a query's conditions or when designing a product that returns the records in **pages** (chunks) of say 50 at a time.

A Google search for _mysql_ returns (as of right now) "About 128,000,000 results". To display all 128MM in a single page wouldn't work, in fact Google hasn't even found all of the results yet. Instead, they've returned the first 10.

This is achieved using a **`LIMIT`** statement. Here's a query to check if a single employee who makes more than $50 an hour exists:

```sql
SELECT *
FROM   employees
WHERE  hourly_wage > 50
LIMIT  1; 
```

`LIMIT` can be extremely effective when combined with an `ORDER BY` clause, for example to return the 5 highest paid employees in the company:

```sql
SELECT *
FROM   employees
ORDER  BY hourly_wage DESC
LIMIT  5;
```

DEV: 

1. Write a query to return the names of Codey’s Construction’s three earliest projects.

ANSWER: SELECT name FROM projects ORDER BY start_date LIMIT 3;

2. You want to know whether any employees have worked over 500 hours on a project. Write a query to find out.

ANSWER: SELECT * FROM project_employees WHERE hours > 500 LIMIT 1;

 