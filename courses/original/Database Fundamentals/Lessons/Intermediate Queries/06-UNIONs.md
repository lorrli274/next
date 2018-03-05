When working with multiple similar datasets it is sometimes useful to combine them temporarily. This can be accomplished with the **`UNION`** operator.

Take for example two tables: _employees_ and _contractors_. These tables are used to store similar records but need to be separated per the business requirements of the construction company.

When running queries across these two tables, it's possible to combine them using `UNION` :

```sql
SELECT first_name,
       last_name
FROM   employees
UNION
SELECT first_name,
       last_name
FROM   contractors; 
```

This will display a list of the names of all the employees and contractors.

The only requirement of a `UNION` is that the same number of rows are returned. It would be just as valid (although not useful) to write a query like:

```sql
SELECT id,
       hire_date
FROM   employees
UNION
SELECT first_name,
       last_name
FROM   contractors; 
```

However, the following would not work because only 1 column is `SELECT`ed from _contractors_:

```sql
SELECT first_name,
       last_name
FROM   employees
UNION
SELECT first_name
FROM   contractors; 
```

By default, a `UNION` is actually a `UNION DISTINCT`, which merges duplicate values. Using a subquery, it's possible to see this illustrated below:

```sql
SELECT COUNT(1) AS "Employee Count"
FROM   employees;

SELECT COUNT(1) AS "Contractor Count"
FROM   contractors;

SELECT COUNT(1) AS "Employee and Contrator Count"
FROM   (SELECT id
        FROM   employees
        UNION
        SELECT id
        FROM   contractors) AS sub;
```

These numbers don't add up! If you were to do a line by line comparison, you'd find that there are 3 employees are also listed as contractors.

To return all the data, a `UNION ALL` is needed:

```sql
SELECT first_name,
       last_name
FROM   employees
UNION ALL
SELECT first_name,
       last_name
FROM   contractors; 
```

You can verify that this is the case using another subquery:

```sql
SELECT COUNT(1) AS "Employee and Contrator Count"
FROM   (SELECT id
        FROM   employees
        UNION ALL
        SELECT id
        FROM   contractors) AS sub; 
```

info> `UNION`s are different from a `JOIN` clause but often confused. The difference is simply that a `UNION` combines records vertically, whereas a `JOIN` combines them horizontally.
