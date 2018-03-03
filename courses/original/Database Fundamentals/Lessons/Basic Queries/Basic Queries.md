In a database, a **query** is a set of structured statements designed to extract specific records from a database. They can be used to answer a wide range of questions and power dynamic websites.

Queries will all use a `SELECT` statement to indicate that data is to be retrieved and displayed. There are a variaty of ways that the data returned can be filtered, grouped, aggregated, and merged to make the returned data more useful.

In a database used by a construction company, a query might be used to:

* Find a list of employees who are working on a specific project
* Determine the total costs of a particular project
* Find out which projects are running over budget
* See which items are costing the company the most

At it's most basic form, a query simply returns all the data from a table:

```sql
SELECT * FROM employees;
```

This will return all the data on all employees:

| id   | first_name | last_name | hourly_wage | hire_date  |
| ---- | ---------- | --------- | ----------- | ---------- |
| 1    | Zechariah  | Langosh   | 56.00       | 2016-10-04 |
| 2    | Elmer      | Barton    | 60.00       | 2014-11-16 |
| 3    | Macie      | Kautzer   | 59.10       | 2016-10-18 |
| 4    | Janice     | Mills     | 54.00       | 2012-05-21 |
| 5    | Lillie     | Donnelly  | 48.50       | 2012-05-03 |

The `*` indicates that all columns should be returned (in the order they appear in the table).

To limit the columns returned, the column names can be specified:

```sql
SELECT id, first_name, last_name FROM employees;
```

This results in a subset of data being returned:

| id   | first_name | last_name |
| ---- | ---------- | --------- |
| 1    | Zechariah  | Langosh   |
| 2    | Elmer      | Barton    |
| 3    | Macie      | Kautzer   |
| 4    | Janice     | Mills     |
| 5    | Lillie     | Donnelly  |

