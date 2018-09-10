First normal form relates to the duplication and over-grouping of data in tables and columns. Take, for example, the following table *customers*:

| *name*            | *industry*   | *project1_id* | *project1_feedback*                                          | *project2_id* | *project2_feedback*                                          | *contact_person_and_role*               | *phone_number* | *address*          | *city*       | *zip* |
| ----------------- | ------------ | ------------- | ------------------------------------------------------------ | ------------- | ------------------------------------------------------------ | --------------------------------------- | -------------- | ------------------ | ------------ | ----- |
| Next University   | Education    | 063395        | Amazing work! Our new classroom looks great.                 |               |                                                              | Mai Nguyen, Head of Operations          | 555-555-5555   | 1 Coding Lane      | Next         | 99999 |
| XYZ Health Center | Healthcare   | 081925        | Always a pleasure working with the Codey's team.             | 035791        | Codey's Construction did an incredible job repairing our C Wing. | Fox Torres, Construction Committee Head | 123-456-7890   | 88 Hospital Avenue | Healersville | 55555 |
| ArchiTECHS        | Architecture | 002051        | Codey's helped us carry out our vision perfectly and within budget! |               |                                                              | Bernadette Laux, Project Manager        | 111-222-3333   | 77 Tower Street    | Gridlock     | 12345 |

This table violates all three rules of 1NF. 

1. There is no primary key! So a user of the database would be forced to look up companies by their name, which is not guaranteed to be unique (since names are registered on a state-by-state basis).
2. The data is not in its most reduced form. The column *contact_person_and_role* can be further divided into two columns. 
3. There are two repeating groups of columns - (*project1_id*, *project1_feedback*) and (*project2_id*, *project2_feeback*).

Let's redesign our original table to satisfy 1NF! 

Dev: The following snippet creates the original table *customers*. 

```sql
CREATE TABLE customers
	(
        name 						VARCHAR(255), 
        industry					VARCHAR(255), 
        project1_id					INT(6),
        project1_feedback			TEXT,
        project2_id					INT(6),
        project2_feedback			TEXT,
        contact_person_and_role		TEXT,
        phone_number				VARCHAR(12),
        address						VARCHAR(255),
        city						VARCHAR(255),
        zip							VARCHAR(5)
    );
```

1. First, copy the above snippet into your code editor. 
2. To satisfy the first condition, create a primary key column called ‘id’ which increments automatically.
3. To satisfy the second condition, split the *contact_person_and_role* column into two separate columns, *contact_person* and *contact_persons_role*.
4. To satisfy the third condition, we need to create a new table *project_feedbacks*. Move the columns containing project ID data and project feedback data to this new table. This table should also contain a *customer_id* column that refers back to the _customers_ table.

Answer: 

CREATE TABLE customers (id INT(6) auto_increment primary key, name VARCHAR(255), industry VARCHAR(255), contact_person TEXT, contact_persons_role TEXT, phone_number VARCHAR(12), address VARCHAR(255), city VARCHAR(255), zip VARCHAR(5));

CREATE TABLE project_feedbacks (project_id INT(6), project_feedback TEXT, customer_id INT(6));

In the next two lessons, we will continue to modify this table until it satisfies all rules of 3NF. 