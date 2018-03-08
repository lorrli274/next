The **`BETWEEN`** condition can be used to filter results to values within a range. For example, all employees with a start date between 2015-01-01 (January 1st, 2015) and 2017-12-31 (December 31st, 2017) can be returned like so:

```sql
SELECT *
FROM   employees
WHERE  hire_date BETWEEN '2015-01-01' AND '2017-12-31';
```

`BETWEEN` can be applied to numeric ranges as well:

```sql
SELECT *
FROM   projects
WHERE  value BETWEEN 50000 AND 100000; 
```

`BETWEEN` is an **inclusive** range, meaning that in the example above, a project with a value of $50,000 would have been returned. In other words, an equivelant query would be:

```sql
SELECT *
FROM   projects
WHERE  value >= 50000
       AND value <= 100000; 
```



