The **`NOT`** condition can be applied to many other operators to negate the values they return.

For example, the `IN` clause can be combined with the `NOT` operator:

```sql
SELECT *
FROM   employees
WHERE  last_name NOT IN ( 'Hamill', 'Langworth', 'Sauer' ); 
```

It can also be used with the `LIKE` clause, for example to return all the employees whose first names do not start with "S".:

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
