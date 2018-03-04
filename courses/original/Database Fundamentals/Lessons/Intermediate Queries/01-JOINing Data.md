The ability to connect multiple tables via their relationships is one of the most powerful facets of a database because it enables complex questions to be answered easily. In SQL, this is accomplished via a **`JOIN`**.

Consider a construction company with a database laid out as follows:

> DEV TODO diagram from earlier

With a `JOIN` you can answer questions such as:

* What project has cost the most so far?
* What are the names of all the employees working on a project?
* What employee spent the least on a specific project?
* How many hours have been spent by all employees on a project?

A `JOIN` relies on the relationship between two tables, namely, their primary and foreign key columns. `JOIN`s can be performed on other columns as well, but this can result in unexpected results if it doesn't fall under the designed use of the database.

This is the basic structure of a query using a `JOIN`:

```sql
SELECT column1, column2
FROM table1 JOIN table2 ON table1.id = table2.table1_id;
```

Here's an example of a simple `JOIN` between the _projects_ and _job_orders_ tables:

```sql
SELECT name, description, quanitity, price FROM projects JOIN job_orders ON projects.id = job_orders.project_id ORDER BY name;
```

The result of this query is a list of all the jobs orders placed alongside the name of the project they were placed for. These two tables have been connected via a primary key (_projects.id_) and a foreign key (*job_orders.project_id*)

It's common for some column names to overlap, which leads to ambiguity that the database cannot handle. Consider the following query, which orders by _id_:

```sql
SELECT name, description, quanitity, price FROM projects JOIN job_orders ON projects.id = job_orders.project_id ORDER BY id;
```

Both the _projects_ and *job_orders* tables have an _id_ column, so this query will fail.

To resolve this, the table must be declared explicitly:

```sql
SELECT name, description, quanitity, price FROM projects JOIN job_orders ON projects.id = job_orders.project_id ORDER BY job_orders.id;
```

Writing out full table names can get old fast, so you can alias the tables names instead:

```sql
SELECT name, description, quanitity, price FROM projects p JOIN job_orders jo ON p.id = jo.project_id ORDER BY jo.id;
```

Here the _projects_ and *job_orders* tables have been aliased to _p_ and _jo_, respectively.