Once a database has been designed and implemented, it's time to fill it with data! This can come from a variety of sources, such as:

* A form on a web page, sent via a web server
* An import from another database or a CSV file
* Manually entering records directly into the database

To manually add data to a table an **`INSERT`** statement is used, which has the following structure:

```sql
INSERT INTO table_name (column1, column2...) VALUES (value1, value2, ...);
```

Consider the following data for a new record in the _employees_ table:

| first_name | last_name | hourly_wage | hire_date  |
| ---------- | --------- | ----------- | ---------- |
| Samuel     | Jones     | 21.50       | 2018-01-13 |

To insert this data, you would write the following:

```sql
INSERT INTO employees (first_name, last_name, hourly_wage, hire_date)
VALUES      ('Samuel', 'Jones', 21.50, '2018-01-13');
```

After inserting this data, try `SELECT`ing the data from the table to verify it has been added:

```sql
SELECT *
FROM employees
ORDER BY id DESC;
```

Note the value of the _id_ column. This did not need to be provided due to the `auto_increment` property of the column, which will assign the next number in a sequence to each record as it is inserted.

The column order does not matter either:

```sql
INSERT INTO employees (hourly_wage, hire_date, last_name, first_name)
VALUES      (23.00, '2018-02-04', 'Huang', 'Vicky'); 
```

However, the following would not work, as the *hire_date* column has no default value:

```sql
INSERT INTO employees (first_name, last_name, hourly_wage)
VALUES      ('James', 'Bright', 30.25); 
```

Multiple records can easily be inserted at once, provided they are all inserting data into the same columns in a table:

```sql
INSERT INTO employees (first_name, last_name, hourly_wage, hire_date)
VALUES      ('Eva', 'Gonzalez', 19.50, '2017-05-12'),
            ('John', 'Mac', 14.00, '2017-11-24'); 
```

DEV: In the previous lesson, you helped Codey’s Construction create a  *customers* table to store their customer data. However, the table you created doesn’t have any data in it! You can verify this by running the following `SELECT` query:

```sql
SELECT *
FROM contractors
```

Nothing should show in the results. Let’s add our three customers to the table at once. Remember that the *id* column auto-increments. You can check the structure of the table using a `DESCRIBE` statement.

| *id*   | *name*            | *industry*   | *contact_id* | *address*          | *zip* |
| ------ | ----------------- | ------------ | ------------ | ------------------ | ----- |
| 000001 | Next University   | Education    | 000001       | 1 Coding Lane      | 99999 |
| 000002 | XYZ Health Center | Healthcare   | 000002       | 88 Hospital Avenue | 55555 |
| 000003 | ArchiTECHS        | Architecture | 000003       | 77 Tower Street    | 12345 |

ANSWER:

```sql
INSERT INTO contractors (name, industry, contact_id, address, zip)
VALUES      ('Next University', 'Education', '000001', '1 Coding Lane', '99999'),
            ('XYZ Health Center', 'Healthcare', '000002', '88 Hospital Avenue', '55555'),
            ('ArchiTECHS', 'Architecture', '000003', '77 Tower Street', '12345'); 
```