When working with multiple similar datasets it is sometimes useful to combine them temporarily. This can be accomplished with the **`UNION`** operator.

Take for example two tables: _employees_ and _contractors_. These tables are used to store similar records but need to be separated per the business requirements of the construction company.

When running queries across these two tables, it's possible to combine them using `UNION` :

```sql
select first_name, last_name from employees union select first_name, last_name from contractors;
```

This will display a list of the names of all the employees and contractors.

The only requirement of a `UNION` is that the same number of rows are returned. It would be just as valid (although not useful) to write a query like:

```sql
select id, hire_date from employees union select first_name, last_name from contractors;
```

However, the following would not work because only 1 column is `SELECT`ed from _contractors_:

```sql
select first_name, last_name from employees union select first_name from contractors;
```

By default, a `UNION` is actually a `UNION DISTINCT`, which merges duplicate values. Using a subquery, it's possible to see this illustrated below:

```sql
select count(1) as "Employee Count" from employees;
select count(1) as "Contractor Count" from contractors;
select count(1) as "Employee and Contrator Count" from (select id from employees UNION select id from contractors) as sub;
```

These numbers don't add up! If you were to do a line by line comparison, you'd find that there are 3 employees are also listed as contractors.

To return all the data, a `UNION ALL` is needed:

```sql
select first_name, last_name from employees UNION ALL select first_name, last_name
from contractors;
```

You can verify that this is the case using another subquery:

```sql
select count(1) as "Employee and Contrator Count" from (select id from employees UNION ALL select id from contractors) as sub;
```

info> `UNION`s are different from a `JOIN` clause but often confused. The difference is simply that a `UNION` combines records vertically, whereas a `JOIN` combines them horizontally.