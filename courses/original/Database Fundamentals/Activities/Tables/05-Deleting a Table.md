You've learned how to create a table...now let's learn how to delete a table! It's not possible to undo deleting a table, so make sure you're absolutely certain about your command before you run it!

Tables can be deleted using the `DROP` command:

```sql
DROP TABLE project_employees;
```

To prevent an error if the table does not exist, you can use the `IF EXISTS` condition:

```sql
DROP TABLE IF EXISTS project_employees;
```

Note that you cannot drop a table that is referenced by another table. Attempting to do so will generate an error. 



DEV ins: Delete the *customers* table you created in the previous lesson. 

DEV ins: Try to delete the *customers* table again to see what happens when you attempt to delete a table that does not exist. 

DEV ins: The *employees* table is referenced by the *job_orders* and *project_employees* tables. Try to delete the *employees* table. 