![](https://storage.googleapis.com/codevolve-assets/internal/courses/Database%20Fundamentals/erd1.png)

<div class="caption">A complete database schema showing tables, columns, and the relationships between the data types.</div>

A database management system (DBMS) or **database** is a collection of **tables**, **columns**, and **rows** (or **records**). Together, these allow various types of information to be stored and easily extracted when necessary.

![](https://storage.googleapis.com/codevolve-assets/internal/courses/Database%20Fundamentals/Database%20Interaction.png)

<div class="caption">A simplified interaction between a database and a webpage.</div>

When you interact with a dynamic website or app, the software is most likely backed by a database. Databases allow software developers to persist data so that when you return to the website your work, scores, and other interactions are still there.

In addition to persisting your data, databases allow for meaningful questions to be answered. This is accomplished using a **structured query language**, or **SQL**. For example, a developer may want to show you your average scores across all the games you played on their app, or the number of games, or all the games where you scored more than 300 points. Databases make that easy.

Here's an example of a SQL statement:

```sql
SELECT first_name, last_name FROM employees;
```

That SQL statement (also called a **query**) will display the data stored in the *first_name* and *last_name* columns in the table _employees_, for example:

| first_name | last_name |
| ---------- | --------- |
| Ayden      | Morris    |
| Sierra     | Reeves    |
| Christian  | Herman    |

This query could be run from the command line, such as the `mysql` prompt. However, this lesson environment provides you with a simplified way to interact with your database.

![](https://storage.googleapis.com/codevolve-assets/internal/courses/Database%20Fundamentals/simple-erd1.png)

<div class="caption">The relationships between the tables in a database.</div>

Many databases are **relational**, which means that the data in the database relates to one another. For example, a database could contain information for a construction company. It can track the company's projects, employees, and who is working on what project. A relational database is very structured, but there are also other less structured databases, such as graph databases.

The structure or **schema** of a database is extremely important. A messy schema will result in a difficult that is difficult to make changes to, store data in, and request data from. When building a database the majority of time is often spent diagramming the schema versus actually implementing it (which might only take a few minutes!). An example of a schema is shown in the first image above.