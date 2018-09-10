In a database, a **query** is a set of structured statements designed to extract specific records from a database. They can be used to answer a wide range of questions and power dynamic websites.

We first introduced the `SELECT` statement in the Modifying Data lesson as a way to verify that our modifications were done correctly. However, there are many more ways `SELECT` can be used. 

Queries all use a `SELECT` statement to indicate that data is to be retrieved and displayed. There are a variety of ways that the data returned can be **filtered**, **joined**, **grouped**, and **aggregated** to make the returned data more useful.

In our Codey’s Construction database, a query might be used to:

* Find a list of employees who are working on a specific project
* Determine the total costs of a particular project
* Find out which projects are running over budget
* See which items are costing the company the most

The format for a basic query is:

```sql
SELECT column1, column2
FROM table_name;
```

To start, here's a query that simply returns all the data from the table *employees*:

```sql
SELECT *
FROM employees;
```

The `SELECT` indicates the start of a query, while the `*` is a wildcard which will return data for all columns (in the order they appear in the table).

To limit the columns returned, the column names can be specified:

```sql
SELECT id, first_name, last_name
FROM employees; 
```

Specifying the column name(s) results in only data only for specific columns being returned.

Columns can also be **aliased** to make the output cleaner or to handle joined (merged) data that have the same columns names:

```sql
SELECT id         AS "ID Number",
       first_name AS "First Name",
       last_name  AS "Last Name"
FROM   employees; 
```

Finally, a query doesn't necessarily need to return data in a table. The following query will return the number 150, the string "Databases are fun!", the current UTC date and time, and the current database user:

```sql
SELECT 150, 'Databases are fun!', NOW(), CURRENT_USER; 
```

Let’s give `SELECT`ing a go!

DEV: Your boss wants to know the name and start date of all of Codey’s Construction’s projects. Write a query to pull this information. Give your column names aliases to make your results more readable.

ANSWER: SELECT name AS “Project Name”, start_date AS “Start Date” FROM projects;