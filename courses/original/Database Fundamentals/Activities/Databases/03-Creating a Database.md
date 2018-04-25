The command to create a database named *a_database* is:

```sql
CREATE DATABASE a_database;
```

If the database already exists the above command will fail. You can check that the database does not exist before creating it:

```sql
CREATE DATABASE IF NOT EXISTS a_database;
```

