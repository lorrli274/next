In a database, a **query** is a set of structured statements designed to extract specific records from a database. They can be used to answer a wide range of questions and power dynamic websites.

Queries will all use a **`SELECT`** statement to indicate that data is to be retrieved and displayed. There are a variaty of ways that the data returned can be filtered, grouped, aggregated, and merged to make the returned data more useful.

In a database used by a construction company, a query might be used to:

* Find a list of employees who are working on a specific project
* Determine the total costs of a particular project
* Find out which projects are running over budget
* See which items are costing the company the most

At it's most basic form, a query simply returns all the data from a table:

```sql
SELECT * FROM employees;
```

The `*` indicates that all columns should be returned (in the order they appear in the table).

To limit the columns returned, the column names can be specified:

```sql
SELECT id, first_name, last_name FROM employees; 
```

Specifying the column names results in only data only for specific columns being returned.

Columns can also be **aliased** to make the output cleaner or to handle merged data that have the same columns names:

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
