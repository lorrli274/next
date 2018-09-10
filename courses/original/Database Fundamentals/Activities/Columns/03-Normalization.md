In the next steps you'll learn how to create and modify the columns of a table. However, before jumping into that, it's important to have an understanding of database **normalization**.

Normalization is a technique of organizing data in a database to minimize redundancy and to ensure only related data are stored in each table. The stages of organization are called **normal forms**. There are six levels of normalization; however, the third normal form is considered the highest level necessary for most applications so we will only be discussing the first three forms in this lesson.

The rules to satisfy the three normal forms are: 

- **First Normal Form (1NF)**:
  - Data is stored in tables with rows uniquely identified by a primary key
  - Data within each table is stored in individual columns in its most reduced form
  - There are no repeating groups
- **Second Normal Form (2NF)**:
  - Everything from 1NF
  - Only data that relates to a tables primary key is stored in each table
- **Third Normal Form (3NF)**:
  - Everything from 2NF
  - There are no in-table dependencies between the columns in each table

This was a lot to take in, so let's jump into some examples to break it down!
