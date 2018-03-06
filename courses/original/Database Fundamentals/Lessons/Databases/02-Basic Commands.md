Run the snippet below to show the name of the database you currently have access to:

```sql
SHOW DATABASES;
```

To explore the database's schema, you first list the tables in your database:

```sql
SHOW TABLES;
```

Then you can view the structure of a specific table:

```sql
DESCRIBE employees;
```

info> To indicate which database you'd like to use, you would run the command `USE my_database;`. However, we've already setup your environment to use the *construction_co* database, so you do not need to do this.