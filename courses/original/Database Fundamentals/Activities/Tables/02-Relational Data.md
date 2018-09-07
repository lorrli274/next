The superpower of databases is in the relationships between different types of data. Organizing data in a **relational** manner allows complex questions to be answered easily while providing a clean and fast way to organize different types of data.

When describing a database, it's common to say things like:

* "A project has many employees."
* "A job order has one project."
* "Many job orders belong to one employee."
* "Many employees have many projects."

In these examples you would be describing a **1-to-many (1:M)**, **1-to-1 (1:1)**, **many-to-1 (M:1)**, and **many-to-many (M:M) relationships**, respectively.

There are examples of some of these in the diagram below:

![](https://storage.googleapis.com/codevolve-assets/internal/courses/Database%20Fundamentals/erd1.png)

<div class="caption">The relationships between different tables in a database.</div>

In this diagram, there are 4 relationships:

| Type | Parent Table | Child Table         | Explanation                                    |
| ---- | ------------ | ------------------- | ---------------------------------------------- |
| 1:M  | _projects_   | *job_orders*        | One project has many job orders placed for it. |
| 1:M  | _employees_  | *job_orders*        | One employee can place many job orders.        |
| M:M  | _projects_   | *project_employees* | A project can have many employees.             |
| M:M  | _employees_  | *project_employees* | An employee can work on many projects.         |

The *job_orders* and *project_employees* tables are said to "belong to" the *projects* and *employees* tables (or that they are **child tables**). They each have a 1:M relationship with their **parent tables**.

Deciding what the relationships are in your database requires you to answer questions about the structure of your application, such as:

* Can a job order be placed by more than one employee?
* Can an employee work on multiple projects at once?

and so on.

Any time a relationship is created between tables, there are two types of keys involved:

## Primary Keys

A **primary key** or **PK** is a unique identifier for each record in a table. A PK is referenced by other tables via their foreign keys, allowing for relationships between data to be created.

Each table can only have one primary key, but it can consist of multiple columns (called a **composite primary key**).

## Foreign Keys

A **foreign key** or **FK** references a primary key in another table. When a tables references another table, it is said the be a "child" of that table, making the table it is referencing its "parent".

A table may contain more than one foreign keys, making it the child of more than one other table.

In the diagrams above, the keys are marked with *PK* and *FK*.

DEV ins: Say we have two tables, *customers* (which stores customer data) and *projects* (which stores project data). The *projects* table has a column called *customer_id*, which references the *customers* table. Each project can only have one customer.

1. What is the relationship between *customer* and *projects*? 1:1, **1:M**, M:1, M::M 
2. What is the parent table? ***customers***, *projects*
3. What is the child table? *customers*, ***projects***

DEV ins: Say we have a table *contractors*. Below are some of its columns. Check all that would make a good primary key. Remember that a PK must be a unique identifier.

- Name
- Date of birth
- **Social security number**
- Home address
- **Unique contractor ID number**

