The ability to connect multiple tables via their relationships is one of the most powerful facets of a database because it enables complex questions to be answered easily. In SQL, this is accomplished via a **`JOIN`**.

Consider a construction company with a database laid out as follows:

> DEV TODO diagram

With a `JOIN` you can answer questions such as:

* What project has cost the most so far?
* What are the names of all the employees working on a project?
* What employee spent the least on a specific project?
* How many hours have been spent by all employees on a project?

A `JOIN` relies on the relationship between two tables, namely, their primary and foreign key columns. `JOIN`s can be performed on other columns as well, but this can result in unexpected results if it doesn't fall under the designed use of the database.

Here's an example of a simple `JOIN` between the _projects_ and _job_orders_ tables:

```sql
SELECT description, quanitity, price, name FROM projects JOIN job_orders ON projects.id = job_orders.project_id ORDER BY name;
```

The result of this query is a list of all the jobs orders placed alongside the name of the project they were placed for. These two tables have been connected via a primary key (_projects.id_) and a foreign key (*job_orders.project_id*)


ids conflict
aliases

