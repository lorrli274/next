The **`BETWEEN`** condition can be used to filter results to values within a range. For example, all employees with a start date between XXXX-XX-XX and YYYY-YY-YY can be returned like so:

```sql
SELECT *
FROM   employees
WHERE  start_date BETWEEN 'XXXX-XX-XX' AND 'YYYY-YY-YY';
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
 


