Sometimes when writing a query you may want to return only a portion of the data in a table. For example, when trying to find all the job orders made by a specific employee in a table with thousands of job orders it would be unreasonable to `SELECT` all the data and then manually scan through it for the relevant records.

Instead, a **`WHERE`** clause is used to filter the data:

```sql
SELECT *
FROM   job_orders
WHERE  employee_id = 1; 
```

`WHERE` indicates that one or more **conditions** to be applied to the data will be given. The result of this query would be the _employee_ record with an ID of 1. 

You can also provide multiple conditions using the boolean logic keywords (or **operators**) **`AND`** and **`OR`**:

```sql
SELECT *
FROM   job_orders
WHERE  employee_id = 1
       AND price > 500; 
```

```sql
SELECT *
FROM   job_orders
WHERE  employee_id = 1
        OR project_id = 4; 
```

These conditions can also be combined:

```sql
SELECT *
FROM   job_orders
WHERE  ( employee_id = 1
          OR project_id = 4 )
       AND price > 500; 
```

Note the use of the parentheses to indicate the operator precedence. A detailed list of the default precedence is available [here](https://dev.mysql.com/doc/refman/5.7/en/operator-precedence.html).

All other basic **comparison** operators are supported as well: `=`, `!=`, `<`, `>`, `<=`, and `>=`. There are also a number of other built-in conditions that can be used, such as `LIKE`, `IN`, and `BETWEEN`, whcih are covered in the next few steps.
