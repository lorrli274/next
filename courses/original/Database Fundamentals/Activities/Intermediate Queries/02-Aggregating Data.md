Another powerful facet of querying is the ability to aggregate data on the fly to answer questions without having to manually do the calculations. There are a number of different built-in aggregation functions, a complete list of which can be found [here](https://dev.mysql.com/doc/refman/5.7/en/group-by-functions.html). The common ones are explained below!

## `COUNT`

The **`COUNT`** function allows you to, unsurprisingly, count the values provided:

```sql
SELECT COUNT(id) FROM job_orders;
```

This counts the number of job orders in total. This returns the correct result because all the values of _id_ are unique, but what if *project_id* was counted instead:

```sql
SELECT COUNT(project_id) FROM job_orders;
```

The numbers match, which doesn't seem right, because you would expect that each project would have multiple job orders placed for it. This is because each project ID appears multiple times in the *job_orders* table. To count only the number of unique project IDs, the **`DISTINCT`** keyword is used:

```sql
SELECT COUNT(DISTINCT project_id) FROM job_orders;
```

## `SUM`

The **`SUM`** function adds up any provided values. It works with constants:

```sql
SELECT SUM(1000);
```

As well as column values:

```sql
SELECT SUM(value) FROM projects;
```

It can also be provided an expression:

```sql
SELECT SUM(value * 0.8) FROM projects;
```

Or used in one:

```sql
SELECT SUM(value) * 0.8 FROM projects;
```

## `AVG`

The **`AVG`** function will determine the average value in the provided column:

```sql
SELECT AVG(value) FROM projects;
```

## `MIN` / `MAX`

The **`MIN`** and **`MAX`** functions find the minimum and maximum value in the provided column, respectively:

```sql
SELECT MIN(value) FROM projects;
```

```sql
SELECT MAX(value) FROM projects;
```

DEV: Let’s practice each of these!

1. Find the number of employees who have an hourly wage of greater than or equal to $50.00/hr 

   SELECT COUNT(*) FROM employees WHERE hourly_wage > 50;

2. Find the sum of the price of all job_orders placed after 2018-01-01 00:00:00.

   SELECT SUM(price) FROM job_orders WHERE order_datetime > '2018-01-01 00:00:00';

3. Find the average number of hours worked on the Washington Avenue Barber project (you will need to use a join for this one!).

   SELECT avg(hours) FROM projects p JOIN project_employees pe ON p.id = pe.project_id WHERE name = "Washington Avenue Barber";

4.  When was Codey’s Construction’s first employee hired?

   SELECT min(hire_date) FROM employees;

5. When was Codey’s Construction’s latest employee hired?

   SELECT max(hire_date) FROM employees;