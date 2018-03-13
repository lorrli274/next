In the next steps you'll learn how to create and modify the columns of a table. However, before jumping into that, it's important to have an understanding of database **normalization**.

There are three levels of normalization:

* **First Normal Form (1NF)**:
  * Data is stored in tables with columns uniquely identified by a primary key
  * Data within each table is stored in individual columns in its most reduced form
  * There are no repeating columns
* **Second Normal Form (2NF)**:
  * Everything from 1NF
  * Only data that relates to a tables primary key is stored in each table
* **Third Normal Form (3NF)**:
  * Everything from 2NF
  * There are no in-table dependencies between the columns in each table

This was a lot to take in, so let's jump into some examples to break it down!



## First Normal Form

1NF relates to the duplication and over grouping of data in tables and columns. Take for example the following table:

| **contractors** |
| --------------- |
| first_name      |
| last_name       |
| hourly_wage     |
| project1_name   |
| project1_hours  |
| project2_name   |
| project2_hours  |

There are a number of reasons this table violates 1NF. First, there is no primary key! So a user of the database would be forced to look up contractors by their name, which is not guaranteed to be unique.

Next, there's data in the table for 2 different projects (their names and hours). This is in violation because of the repetition of similar columns. Adding a *project_names* column and adding all the projects' names to the column (maybe one per line) would also violate 1NF.

To address this, we would need to:

1. Add a primary key to the table
2. Move the project data to a separate table that has a foreign key pointing to the associated _contractor_ record

## Second Normal Form

To achieve 2NF, a database must first satisfy all the conditions for 1NF.

After this, satisfying 2NF requires that all data in each table relates to the record that the primary key of the table identifies. For example, the following table violates 2NF:

| job_orders  |
| ----------- |
| product_id  |
| quantity    |
| order_total |
| in_stock    |

The *in_stock* column is designed to track the number of the products still left in stock, but it's what causes the issue. This  data relates to the product itself, while the *job_orders* table should only contain data related to each order.

To fix this, the *in_stock* column should be moved to the table containing data on each product.

## Third Normal Form

For a database to be in 3NF, it must first satisfy all the criteria for 2NF.

Then, each column must be **non-transitively dependent** on the table's primary key. This means that each column should relate directly to the table's primary key and not to the other columns within the table.

Here's an example of a table with transitively dependent columns:

| materials |
| --------- |
| id        |
| vendor    |
| name      |

This is a table designed to track job materials offered by a specific vendor. The transitively dependent relationship is between _vendor_ and _name_ because a vendor produces products with names.

Because this relationship exists, the database is not in 3NF.

To address this, a second table must be created to store vendors. The _vendor_ column in the _materials_ table would then be changed to a foreign key (*vendor_id*) that references the new table.

## Normalization

If a database satisfies all the requirements above, then it is considered to be normalized.