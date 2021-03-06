There are a number of commands you can use to explore the schema of your database. Below are some of these commands, and then a list of  tasks for you to complete.

The command to show the names of the databases you currently have access to is below:

```sql
SHOW DATABASES;
```
Try typing that code into your query editor and clicking **Run Query**. It will return a list of the databases you have access to, which should look like this:

| Database            |
| ------------------- |
| information_schema  |
| codeys_construction |
| mysql               |
| performance_schema  |
| sys                 |

Typically, the next step would be to specify what database you would like to interact with using a command like this:

```sql
USE codeys_construction;
```

However, this environment is already configured to use the *codeys_construction* database, so you don't need to do this!

To explore the schema of the database you are using, first list the tables in your database:

```sql
SHOW TABLES;
```

Then you can view the structure of a specific table:

```sql
DESCRIBE employees;
```

Now let's try some of these commands!

DEV ins: show the tables in your database 

- SHOW TABLES

DEV ins: view the structure of the *projects* table

- DESCRIBE projects