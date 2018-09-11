In the previous lesson, we learned how to query from single tables. But what if you need to extract data from multiple tables at once? 

The ability to connect multiple tables via their relationships is one of the most powerful facets of a relational database. It enables complex questions to be answered easily. In SQL, this is accomplished via a **`JOIN`**.

Here is the schema for Codey’s Construction’s database again:

![](https://storage.googleapis.com/codevolve-assets/internal/courses/Database%20Fundamentals/erd1.png)

With a `JOIN` you can answer questions such as:

* What project has cost the most so far?
* What are the names of all the employees working on a project?
* What employee spent the least on a specific project?
* How many hours have been spent by all employees on a project?

A `JOIN` relies on the relationship between two tables, namely, their primary and foreign key columns. `JOIN`s can be performed on other columns as well, but this can result in unexpected results if it doesn't fall under the designed use of the database (remember normalization?).

This is the basic structure of a query using a `JOIN`:

```sql
SELECT column1,
       column2
FROM   table1
       JOIN table2
         ON table1.id = table2.table1_id; 
```

This is performing the following process:

1. `SELECT` data from _table1_
2. `JOIN` _table2_ to _table1_ using the primary key on _table1_ (_id_) and the foreign key on _table2_ (*table1_id*)
3. The data from _table2_ is now available to be queried

Here's an example of a simple `JOIN` between the _projects_ and _job_orders_ tables:

```sql
SELECT name,
       description,
       quantity,
       price
FROM   projects
       JOIN job_orders
         ON projects.id = job_orders.project_id
ORDER  BY name; 
```

If you take a look at the schema at the start of this step, you may notice that of the columns `SELECT`ed, the _projects_ table only has the _name_ column. The others (_description, quantity_, _price_) are all in the *job_orders* table, but accessible due to the `JOIN`.

In plain English, this query returns the project name next to the description, quantity, and price of all the jobs orders placed for the project. Like the example, these two tables have been connected via a primary key (_projects.id_) and a foreign key (*job_orders.project_id*)

It's common for some column names to overlap, which leads to ambiguity that the database cannot handle. Consider the following query, which orders by _id_:

```sql
SELECT name,
       description,
       quanitity,
       price
FROM   projects
       JOIN job_orders
         ON projects.id = job_orders.project_id
ORDER  BY id; 
```

Both the _projects_ and *job_orders* tables have an _id_ column, so this query will fail.

To resolve this, the table must be declared explicitly:

```sql
SELECT name,
       description,
       quanitity,
       price
FROM   projects
       JOIN job_orders
         ON projects.id = job_orders.project_id
ORDER  BY job_orders.id;
```

Writing out full table names can get old fast, so you can alias the tables names instead:

```sql
SELECT name,
       description,
       quanitity,
       price
FROM   projects AS p
       JOIN job_orders AS jo
         ON p.id = jo.project_id
ORDER  BY jo.id;
```

Here the _projects_ and *job_orders* tables have been aliased to _p_ and _jo_, respectively. You can also write this without the `AS`.

It's also possible to use more than one `JOIN`! Here's an example:

```sql
SELECT name,
       first_name,
       last_name,
       price
FROM   projects p
       JOIN job_orders jo
         ON p.id = jo.project_id
       JOIN employees e
         ON e.id = jo.employee_id
ORDER  BY 1;
```

DEV: In our previous lesson, Basic Queries, you found the hours for two employees, Ubaldo Predovic and Tess Hermiston, to see if they are putting in too few hours. However, you had to perform this in two separate queries (1. querying the *employees* table to figure out what their IDs are, and 2. pulling their hours from the *project_employees* table using their IDs). 

Let’s see if you can write a single query to pull this information! Your result should show the employee’s ID, first name, last name, and hours. You should not need to know exactly what Ubaldo and Tess’s employee IDs are. 

ANSWER: SELECT employee_id, first_name, last_name, hours FROM employees JOIN project_employees ON employees.id = project_employees.employee_id WHERE first_name in ('Ubaldo', 'Tess') AND last_name in ('Predovic', 'Hermiston');