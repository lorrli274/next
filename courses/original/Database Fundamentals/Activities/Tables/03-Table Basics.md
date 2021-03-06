Now that you've learned what tables are and what they're used for, it's time to jump into some SQL examples!

In a database, each table typically contains:

* Columns, which store specific data of a specific type for each record.
* A primary key, which allows other tables to reference the table.
* Foreign key(s), which reference other tables' primary keys.
* Indexes, which speed up data retrieval from the table.

Columns and indexes will be covered in the next lesson. For now, take a look at the tables currently in your database and inspect the columns, keys, and indexes of some of them.

DEV ins: show the tables in your database

- SHOW TABLES;

DEV ins: inspect the *employees* table

- DESCRIBE employees;

DEV ins: inspect the *project_employees* table

- DESCRIBE project_employees;

