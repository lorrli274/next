Each table contains:

* Columns, which store specific data of a specific type for each record.
* A primary key, which allows other tables to reference the table.
* Foreign key(s), which reference other tables' primary keys.
* Indexes, which speed up data retrieval from the table.

Take a look at the tables currently in your database:

```sql
SHOW TABLES;
```

Now inspect the columns, keys, and indexes of some of them:

```sql
DESCRIBE employees;
```

```sql
DESCRIBE project_employees;
```

