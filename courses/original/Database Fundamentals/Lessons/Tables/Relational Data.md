The superpower of databases is in the relationships between unique types of data. Organizing data in a **relational** manner allows complex questions to be answered easily and while providing a clean and fast way to organize different types of data.

When describing a database, it's comming to say things like:

* "A project has many employees."
* "A job order has one project."
* "Many job orders belong to one employee."
* "Many employees have many projects."

In these examples you would be describing a 1-to-many (1:M), 1-to-1 (1:1), many-to-1 (M:1), and many-to-many (M:N) relationships, respectively.

These are diagrammed as follows:

> DEV: Diagram the above relationships

info> Note the three prongs at the "many" side of each relationship.

Deciding what the relationships are in your database requires you to answer questions about the structure of your application, such as:

* Can a job order be placed by more than one employee?
* Can an employee work on multiple projects at once?

and so on.

Anytime a relationship is created between tables, there are two types of keys involved:

## Primary Keys

A **primary key** or **PK** is a unique identifier for each record in a table. A PK is referenced by other tables via their foreign keys, allowing for relationships between data to be created.

Each table can only have one primary key, but it can consist of multiple columns (called a **composite primary key**). 

## Foreign Keys

A **foreign key** or **FK** references a primary key in another table. When a tables references another table, it is said the be a "child" of that table, making the table it is referencing its "parent".

A table may contain more than one foreign keys, making it the child of more than one other table.

info> In the diagrams above, the keys are marked with _PK_ and _FK_.

> DEV: Make sure that is correct ^

# 