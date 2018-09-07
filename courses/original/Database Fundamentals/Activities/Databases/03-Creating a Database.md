Now that you know how to view the schema of a database, let's try creating a new database!

The command to create a database named *a_database* is:

```sql
CREATE DATABASE a_database;
```

If the database already exists the above command will fail. You can check that the database does not exist before creating it:

```sql
CREATE DATABASE IF NOT EXISTS a_database;
```

Now you try!

DEV ins: Create a database named "a_new_database".

- CREATE DATABASE a_new_database

DEV ins: Try to create another database named "a_new_database" and see what happens. 

- CREATE DATABASE a_new_database
- should see “ERROR 1007 (HY000)” at line 1: Can’t create database ‘a_new_database’; database exists”