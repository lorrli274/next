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

DEV: Write a query to pull all the records from the *job_orders* table where quantity is between 100 and 200, price is between $1,000.00 and \$1,500.00, and the description contains the word “drill”.

ANSWER: 

SELECT * 
FROM job_orders
WHERE quantity BETWEEN 100 AND 200
AND price BETWEEN 1000 AND 1500
AND lower(description) LIKE '%drill%';