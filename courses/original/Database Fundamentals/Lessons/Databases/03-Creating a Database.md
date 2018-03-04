The command to create a database named _a\_database_ is:

```sql
CREATE DATABASE construct_co;
```

If the database already exists the above command will fail. You can check that the database does not exist before creating it:

```sql
CREATE DATABASE IF NOT EXISTS construct_co;
```

