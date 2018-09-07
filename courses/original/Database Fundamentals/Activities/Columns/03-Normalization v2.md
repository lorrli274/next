In the next steps you'll learn how to create and modify the columns of a table. However, before jumping into that, it's important to have an understanding of database **normalization**.

Normalization is a technique of organizing data in a database to minimize redundancy and to ensure only related data are stored in each table. The stages of organization are called **normal forms**. There are six levels of normalization; however, the third normal form is considered the highest level necessary for most applications so we will only be discussing the first three forms in this lesson.

The rules to satisfy the three normal forms are: 

- **First Normal Form (1NF)**:
  - Data is stored in tables with rows uniquely identified by a primary key
  - Data within each table is stored in individual columns in its most reduced form
  - There are no repeating columns
- **Second Normal Form (2NF)**:
  - Everything from 1NF
  - Only data that relates to a tables primary key is stored in each table
- **Third Normal Form (3NF)**:
  - Everything from 2NF
  - There are no in-table dependencies between the columns in each table

This was a lot to take in, so let's jump into some examples to break it down!



## First Normal Form

1NF relates to the duplication and over-grouping of data in tables and columns. Take, for example, the following table *customers*:

| *name*          | *industry* | *project1_name_and_startdate* | *project2_name_and_startdate* | *projects* | *total_invoiced* | *phone_number* | *address*     | *city*  | *zip* |
| --------------- | ---------- | ----------------------------- | ----------------------------- | ---------- | ---------------- | -------------- | ------------- | ------- | ----- |
| Next University | Education  | Gymnasium 06/19/2016          | Classroom 08/21/2018          | 2          | 800,000          | 555-111-0000   | 1 Coding Lane | Oakland | 99999 |
|                 |            |                               |                               |            |                  |                |               |         |       |
|                 |            |                               |                               |            |                  |                |               |         |       |

This table violates all three rules of 1NF. 

1. There is no primary key! So a user of the database would be forced to look up companies by their name, which is not guaranteed to be unique (since names are registered on a state-by-state basis).
2. The data is not in its most reduced form. The columns *project1_name_and_startdate* and *project2_name_and_startdate* contain data that can be subdivided into separate columns.
3. There's data in the table for 2 different projects. This is in violation because of the repetition of similar columns.

Let's redesign our original table to satisfy 1NF! 

Dev: The following snippet creates the original table *customers*. We will use this snippet as our base to create a table  that satisfies the rules of 1NF. 

```sql
CREATE TABLE customers
	(
        name 						VARCHAR(255), 
        industry					VARCHAR(255), 
        project1_name_and_startdate VARCHAR(255),
        project2_name_and_startdate	VARCHAR(255),
        projects					INT,
        total_invoiced				DOUBLE(10, 2),
        phone_number				VARCHAR(12),
        address						VARCHAR(255),
        city						VARCHAR(255),
        zip							VARCHAR(5)
    );
```

1. First, copy the above snippet into your code editor. Rename the table *contractors_normalized*. 
2. To satisfy 1NF: create a primary key column called ‘id’ which auto-increments. 
3. To satisfy 2NF: split the project data into separate columns i.e. *project1_name_and_startdate* should be divided into two columns *project1_name*, and *project1_startdate*.
4. To satisfy 3NF: Move the project data to a separate table that has a foreign key pointing to the associated _contractor_ record.

Note that this table should not have any project data (we will be creating a table to store this in the next task!)

Dev: We will also have to create a table for each of the projects to satisfy the third rule. For this activity, we will only create a table for project 1 called  *project1_contractors*. The tables should contain the project's name, the contractors who work on this project, and the hours they worked. It should follow this structure:

| project_id    | int     | PK, FK |
| ------------- | ------- | ------ |
| project_name  | varchar |        |
| contractor_id | varchar | FK     |
| hours         | double  |        |



## Second Normal Form

To achieve 2NF, a database must first satisfy all the conditions for 1NF. 

After this, satisfying 2NF requires that all data in each table relates to the record that the primary key of the table identifies. For example, the following table *job_order* violates 2NF:

| *job_order* | *product_id* | *quantity* | *order_total* | *in_stock* |
| ----------- | ------------ | ---------- | ------------- | ---------- |
| 1           | 10001        | 17         | $384.92       | 65         |
| 2           | 10002        | 5          | $140.07       | 39         |

The *in_stock* column is designed to track the number of the products still left in stock, but it's what causes the issue. This data relates to the product itself, while the *job_orders* table should only contain data related to the job order.

To fix this, the *in_stock* column should be moved to the table containing data on each product. 

Dev: The below snippet creates the table *job_orders*. Rewrite the snippet to create a *job_orders_normalized* table which satisfies 2NF. Note that you will also have to create another table *products* to store product data (product ID as a primary and foreign key, and how many items are in stock).  

```sql
CREATE TABLE job_orders	
	(
        job_order		INT PRIMARY KEY,
        product_id		INT,
        quantity		INT,
        order_total		DOUBLE,
        in_stock		INT
    );
```



## Third Normal Form

For a database to be in 3NF, it must first satisfy all the criteria for 2NF.

Then, each column must be **non-transitively dependent** on the table's primary key. This means that all columns in a table should rely on the primary key (i.e. criteria for 2NF) and no other column. If Column A relies on PK and also on Column B then Column A is transitively dependent on PK so the table does not satisfy 3NF. 

Here's an example of a table with transitively dependent columns:

| id   | employee_firstname | employee_lastname | employee_address   | employee_city | employee_zip |
| ---- | ------------------ | ----------------- | ------------------ | ------------- | ------------ |
| 1    | Chuck              | Brown             | 46 Snoop Street    | San Francisco | 94103        |
| 2    | Patty              | Pepper            | 117A Peanut Avenue | New York City | 10001        |

This table, *employee_addresses*, is designed to store employee location data. The transitively dependent relationship is between *employee_city* and *employee_zip* because zip codes are dependent on cities. 

Because this relationship exists, the database is not in 3NF.

To address this, we can remove the *employee_city* column, and store it in a second table that shows the relationship between zip codes and city names. The _employee_zip_ column in the *employee_addresses* table would then be changed to a foreign key that references the new table.

Dev: Below is the snippet used to create the *employee_addresses* table. Rewrite this snippet to create a table *employee_addresses_normalized*, and create a second table *zipcodes* to store the zip code which has *city* as it's only column. 





info> A database is considered normal if it follows these three normal forms. If you'd like to know more about the other normal forms beyond 3NF, here is a quick summary from https://www.calebcurry.com/blogs/database-design/introduction-to-database-normalization.

| Normal Form                       | Summary                                                      |
| --------------------------------- | ------------------------------------------------------------ |
| Elementary Key Normal Form (EKNF) | Elementary Key Normal Form	Every non-trivial functional dependency in the table is either the dependency of an elementary key attribute or a dependency on a superkey |
| Boyce-Codd Normal Form (BCNF)     | Every non-trivial functional dependency in the table is a dependency on a superkey |
| Fourth Normal Form (4NF)          | Every non-trivial multivalued dependency in the table is a dependency on a superkey |
| Fifth Normal Form (5NF)           | Every non-trivial join dependency in the table is implied by the superkeys of the table |
| Domain/Key Normal Form (DKNF)     | Every constraint on the table is a logical consequence of the table’s domain constraints and key constraints |
| Sixth Normal Form (6NF)           | Table features no non-trivial join dependencies at all (with reference to generalized join operator) |