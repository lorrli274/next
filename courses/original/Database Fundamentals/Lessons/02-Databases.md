# Databases

A database management system or **database** is a collection of tables, columns, and rows (or records). Together, these allow you to store various types of information and easily extract it when necessary.

When you interact with a website or app, the software is most likely backed by a database. Databases allow software developers to persist data so that when you return to the website your work, scores, and other interactions are still there.

In addition to persisting your data, databases allow for meaningful questions to be answered. This is accomplished using a **structured query language**, or **SQL**. For example, a developer may want to show you your average scores across all the games you played on their app, or the number of games, or all the games where you scored more than 300 points. Databases make that easy.

Many databases are **relational**, which means that the data in the database relates to one another. For example, a database could contain information for a construction company. It can track the company's projects, employees, and who is working on what project. A relational database is very structured, but there are also other less structured databases, such as graph databases.

The structure or **schema** of a database is extremely important. A messy schema will result in a difficult that is difficult to make changes to, store data in, and request data from. When building a database the majority of time is often spent diagramming the schema versus actually implementing it (which might only take a few minutes!).

The example construction company database would have the following schema:

> DEV: Create diagram of database

# Basic Commands

>  DEV: Use this content: https://www.codevolve.com/contents/f4e55617-0557-4836-9d0e-706e06aec1e1/edit

Run the snippet below to show the name of the database you currently have access to:

```sql
SHOW DATABASES;
```

To indicate which database you'd like to use, you would run the command `USE my_database;`. However, we've already setup your environment, so you do not need to do this.

To explore the database's schema, you first list the tables in your database:

```sql
SHOW TABLES;
```

Then you can view the structure of a specific table:

```sql
DESCRIBE employees;
```

# Creating a Database

The command to create a database named _a\_database_ is:

```sql
CREATE DATABASE construct_co;
```

If the database already exists the above command will fail. You can check that the database does not exist before creating it:

```sql
CREATE DATABASE IF NOT EXISTS construct_co;
```

# Deleting a Database

Deleting a database is permanent, so you should be _absolutely_ certain you're deleting the right one before you run your command!

You delete a database using the `DROP` keyword:

```sql
DROP DATABASE construct_co;
```
