In the previous step you showed that there are four tables in your database, *employees*, *job_orders*, *projects*, and *project_employees*. Often, you will need to create new tables to store different types of data. To create a table, you first need to plan its structure. This is best done by answering the following questions:

1. What type of data do you want to store in the table?
2. What are the attributes of each record?
3. What data type should be used for each attribute?
4. How does the table relate to other tables in the database?

Let's take a look at how the *projects* table was created to better understand how these questions can be used to create a table! The below shows the structure of the *projects* table:

| Question      | *projects* table                                             |
| ------------- | ------------------------------------------------------------ |
| Type of data  | Construction projects                                        |
| Attributes    | ID, name, value, start date, and end date                    |
| Data type     | `INT`, `VARCHAR`, `FLOAT`, `DATE`, and `DATE`                |
| Relationships | 1. Projects have multiple job orders<br />2. Projects have many employees |

Using the answers to the four questions, we are able to write the following snippet to create the table:

```sql
CREATE TABLE projects
  (
     id         INT(6) auto_increment PRIMARY KEY,
     name       VARCHAR(300),
     value      FLOAT(8, 2),
     start_date DATE,
     end_date   DATE
  );
```

Each of the five attributes specified in the table structure is a column in the table, and each attribute is defined by a data type. We will learn about data types in more detail in the next lesson, but for now all you need to know is that the name of each column is followed by the column's data type when creating a table.

Note that the *id* column has the keywords `auto_increment` and `PRIMARY KEY` following the data type. These are called **column constraints.**

The`auto_increment` keyword is used to automatically generate a unique number when a new record is created in the table. In this case, every time data for a new project is recorded in the table, this `auto_increment` keyword will create a new unique project ID for the project. By default, the increment is by 1.

Since we specified that projects have a 1:M relationship with job orders and project employees, we would like the project ID to be easily referenced by the *job_orders* and *project_employees* tables.Therefore we use the `PRIMARY KEY` keyword to turn the ID column into a PK.

Now that you have seen how tables are created, it's your turn! 

DEV ins: Create a table called "customers" by following this structure:

| Question      | *customers* table                        |
| ------------- | ---------------------------------------- |
| Type of data  | Customer information                     |
| Attributes    | ID, company_name, industry               |
| Data types    | `INT(6)`, `VARCHAR(300)`, `VARCHAR(300)` |
| Relationships | Customers can have many projects.        |

Answer: CREATE TABLE customers (id INT(6) auto_increment PRIMARY KEY, company_name VARCHAR(300), industry VARCHAR(300));

info> Your *customers* table currently has no data but we will learn to insert data into table in the Modifying Data lesson! 