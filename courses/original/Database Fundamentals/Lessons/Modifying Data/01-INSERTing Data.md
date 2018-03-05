New records can be added to a table using an **`INSERT`** statement, which has the following structure:

```sql
INSERT INTO table_name (column1, column2...) VALUES (value1, value2, ...);
```

Consider the following data for a new record in the _employees_ table:

| first_name | last_name | hourly_wage | hire_date  |
| ---------- | --------- | ----------- | ---------- |
| Samuel     | Jones     | 21.50       | 2018-01-13 |

To insert this data, the following would be used:

```sql
INSERT INTO employees (first_name, last_name, hourly_wage, hire_date)
VALUES      ('Samuel', 'Jones', 21.50, '2018-01-13');
```

After inserting this data, try selecting the data from the table to verify it has been added:

```sql
SELECT *
FROM   employees
ORDER  BY id DESC;
```

Note the value of the _id_ column. This did not need to be provided due to the `auto_increment` facet of the column, which will assign the next number in a sequence to each record as it is inserted.

The column order does not matter either:

```sql
INSERT INTO employees (hourly_wage, hire_date, last_name, first_name)
VALUES      (23.00, '2018-02-04', 'Adams', 'Vicky'); 
```

However, the following would not work, as the *hire_date* column has no default value:

```sql
INSERT INTO employees (first_name, last_name, hourly_wage)
VALUES      ('James', 'Bright', 30.25); 
```

Multiple records can easily be inserted at once, provided they are all inserting data into the same columns in a table:

```sql
INSERT INTO employees (first_name, last_name, hourly_wage, hire_date)
VALUES      ('Katy', 'Brown', 19.50, '2017-05-12'),
            ('John', 'Mac', 14.00, '2017-11-24'); 
```


