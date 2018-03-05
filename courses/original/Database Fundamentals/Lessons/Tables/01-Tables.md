![](https://storage.googleapis.com/codevolve-assets/internal/courses/Database%20Fundamentals/employees-table.png)

<div class="caption">A database table for storing data on employees.</div>

Each **table** in a database stores a single type of data. Conceptually, it's a 2D combination of the typical columns and rows you might find in a program like Excel. Here's what a table storing data on employees might look like:

| id   | first_name | last_name |
| ---- | ---------- | --------- |
| 1    | Samantha   | Lindset   |
| 2    | Devin      | Patel     |
| 3    | Kylah      | Whitney   |
| 4    | Ali        | Chandler  |
| 5    | Lathan     | England   |

In this table, the columns are _id_, *first_name*, and *last_name*, and it contains 5 **records** (or **rows**). A record is a single entry in a database table. Typically a table will contain many records ― sometimes tens of millions or more! Here's an example record from a table storing employee data:

| id   | first_name | last_name |
| ---- | ---------- | --------- |
| 1    | Samantha   | Lindset   |

Many databases are **relational**, which means that tables in the database may relate to one another. For example, a database could contain information on employees and the orders they've placed for a job. Each employee can place many orders, and a database can help us keep track of that.

Naming tables is an important part of database development. Oftentimes table names will be the plural form of the type of data being stored. For example, a table storing cars would be named _cars_ (not _car_), one storing people would be called _people_, and so on.

A database will typically contain multiple tables, many of which will relate to one another to form the **schema** of the database.

info> **Fun Fact:** A relational database is very structured, but there are also other less structured databases, such as graph databases, for example [Neo4j](https://neo4j.com/).
