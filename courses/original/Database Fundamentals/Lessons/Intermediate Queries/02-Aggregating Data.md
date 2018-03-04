* `COUNT`
* `SUM`
* `MIN`
* `MAX`
* `AVG`
* `DISTINCT`

A powerful facet of querying is the ability to aggregate data on the fly to answer questions without having to manually do the calculations. There are a number of different built-in aggregation functions, a complete list of which can be found [here](https://dev.mysql.com/doc/refman/5.7/en/group-by-functions.html). The common ones are explained below!

## `COUNT`

The **`COUNT`** function allows you to, unsurprisingly, count the values provided:

```sql
SELECT COUNT(id) FROM job_orders;
```

This counts the number of job_orders in total. This returns the correct result because all the values of _id_ are unique, but what if *project_id* was counted instead:

```sql
SELECT COUNT(project_id) FROM job_orders;
```

The numbers match, which doesn't seem right. This is because each project ID appears multiple times in the *job_orders* table. To count only the number of unique project IDs, the **`DISTINCT`** keyword is used:

```sql
SELECT COUNT(DISTINCT project_id) FROM job_orders;
```

## `SUM`

The **`SUM`** function adds up any provided value. It works with constants:

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

