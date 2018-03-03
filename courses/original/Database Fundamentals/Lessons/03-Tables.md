# Tables

Each **table** in a database stores a single type of data. Conceptually, it's a 2D combination of the typical columns and rows you might find in a program like Excel. Here's what a table storing data on employees might look like:

| id   | first_name | last_name |
| ---- | ---------- | --------- |
| 1    | Samantha   | Lindset   |
| 2    | Devin      | Patel     |
| 3    | Kylah      | Whitney   |
| 4    | Ali        | Chandler  |
| 5    | Lathan     | England   |

In this table, the columns are _id_, _first\_name_, and _last\_name_, and it contains 5 **records** (or **rows**). A record is a single entry in a database table. Typically a table will contain many records ― sometimes tens of millions or more! Here's an example record from a table storing employee data:

| id   | first_name | last_name |
| ---- | ---------- | --------- |
| 1    | Samantha   | Lindset   |

Many databases are **relational**, which means that the data in the database relates to one another. For example, a database could contain information on employees and the orders they've placed for a job. Each employee can place many orders, and a database can help us keep track of that. A relational database is very structured, but there are also other less structured databases, such as graph databases.

Naming tables is an important part of database development. Oftentimes table names will be the plural form of the type of data being stored. For example, a table storing cars would be named _cars_ (not _car_), one storing people would be called _people_, and so on.

A database will typically contain multiple tables, many of which will relate to one another to form the **schema** of the database.

# Relational Data

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

# Table Basics

Each table contains:

* Columns, which store specific data of a specific type for each record.
* A primary key(s), which allows other tables to reference the table.
* Foreign key(s), which reference other tables' primary keys.
* Indexes, which speed up data retrieval from the table.

Take a look at the tables currently in your database:

```sql
SHOW TABLES;
```

Now inspect the columns, keys, and indexes of each:

```sql
DESCRIBE employees;
```

```sql
DESCRIBE projects;
```

# Creating a Table

To create a table, you first need to plan its structure. This is best done by answering the following questions:

| Question                                 | Example                                  |
| ---------------------------------------- | ---------------------------------------- |
| What type of data do you want to store in the table? | Construction Projects                    |
| What are the attributes of each record?  | Name, value, start date, and end date    |
| What data type should be used for each attribute? | `VARCHAR`, `FLOAT`, `TIMESTAMP`, and `TIMESTAMP` |
| How does the table relate to other tables in the database? | 1. Projects have multiple job orders<br />2. Projects have many employees |

The snippet below will create a table based on our example above:

```sql
create table projects (
  id INT(6) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(300) NOT NULL,
  value FLOAT(10, 2) NOT NULL,
  start_date TIMESTAMP NOT NULL,
  end_date TIMESTAMP NOT NULL
);
```

# Deleting a Table

It's not possible to undo deleting a table, so make sure you're absolutely certain about your command before you run it!

Tables can be deleted using the `DROP` command:

```sql
DROP TABLE employees;
```

To prevent an error if the table does not exist, you can use the `IF EXISTS` condition:

```sql
DROP TABLE IF EXISTS employees;
```

You cannot drop a table that is referenced by another table. The `employees` table is used by the `job_orders` and `project_employees` tables, so dropping it will generate an error:

```sql
DROP TABLE employees;
```

