By default, the results of a query are returned without an specific order. When working with small, untouched tables it may appear that they are all ordered by their primary key (e.g. _id_), but this cannot be relied on. As tables grow and records are mutated, this order becomes increasingly random.

The **`ORDER BY`** statement addresses this. It allows you to force the order the results are returned in based on a value of your choosing.

Here's a query using `ORDER BY` to return the employees by the date they were hired:


```sql
SELECT *
FROM   employees
ORDER  BY hire_date;
```

This returns the oldest hire first and the latest one last. This can be reversed by specifying the **direction** to order the results in:

```sql
SELECT *
FROM   employees
ORDER  BY hire_date DESC;
```

Here, **`DESC`** has been used to sort the results in descending order. The default is ascending (**`ASC`**) order.

Multiple `ORDER BY`s can be provided as well:


```sql
SELECT *
FROM   employees
ORDER  BY hire_date DESC,
          hourly_wage;
```


One of the most useful ways to write an `ORDER BY` statement is using an **alias**. The query below will return the employees ordered by their last name and then first name:


```sql
SELECT last_name,
       first_name
FROM   employees
ORDER  BY 1,
          2;
```

The `1` and `2` correspond to the position of the columns in the `SELECT` portion of the query. In other words:

* `1` = `last_name`
* `2` = `first_name`

It doesn't matter what order the aliases are provided in. `ORDER BY 2, 1` would be valid (if you wanted to order by *first_name*, then *last_name*), as would be `ORDER BY hire_date, 1, 2`.

`ORDER BY` aliases become especially useful when grouping and aggregating data, as it prevents you from having to spell out strange column names exactly.

DEV:  Your boss has asked to see data for all job orders created on or before 2016-01-01 with a quantity greater than or equal to 100 but less than or equal to 200. She requested that the results be ordered first by the project ID in ascending order, then the employee ID in ascending order, then the quantity in descending order. Let’s give it a go!

ANSWER: 

```sql
SELECT * 
FROM job_orders
WHERE order_datetime <= '2016-01-01' AND quantity BETWEEN 100 AND 200
ORDER BY 3, 2, 6 DESC;
```

