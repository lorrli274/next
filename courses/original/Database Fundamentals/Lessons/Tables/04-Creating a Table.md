To create a table, you first need to plan its structure. This is best done by answering the following questions:

| Question                                 | Example                                  |
| ---------------------------------------- | ---------------------------------------- |
| What type of data do you want to store in the table? | Construction Projects                    |
| What are the attributes of each record?  | Name, value, start date, and end date    |
| What data type should be used for each attribute? | `VARCHAR`, `FLOAT`, `TIMESTAMP`, and `TIMESTAMP` |
| How does the table relate to other tables in the database? | 1. Projects have multiple job orders<br />2. Projects have many employees |

The snippet below will create a table based on our example above:

```sql
CREATE TABLE projects
  (
     id         INT(6) UNSIGNED auto_increment PRIMARY KEY,
     name       VARCHAR(300) NOT NULL,
     value      FLOAT(10, 2) NOT NULL,
     start_date TIMESTAMP NOT NULL,
     end_date   TIMESTAMP NOT NULL
  );
```

