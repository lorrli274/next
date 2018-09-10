To achieve second normal form, a database must first satisfy all the conditions for 1NF. After this, satisfying 2NF requires that all data in each table relates to the record that the primary key of the table identifies. 

The *customers* table we worked on above should now look like this: 

| *id* | *name*            | *industry*   | *contact_person* | *contact_persons_role*      | *phone_number* | *address*          | *city*       | *zip* |
| ---- | ----------------- | ------------ | ---------------- | --------------------------- | -------------- | ------------------ | ------------ | ----- |
| 1    | Next University   | Education    | Mai Nguyen       | Head of Operations          | 555-555-5555   | 1 Coding Lane      | Next         | 99999 |
| 2    | XYZ Health Center | Healthcare   | Fox Torres       | Construction Committee Head | 123-456-7890   | 88 Hospital Avenue | Healersville | 55555 |
| 3    | ArchiTECHS        | Architecture | Bernadette Laux  | Project Manager             | 111-222-3333   | 77 Tower Street    | Gridlock     | 12345 |

We are in violation of 2NF because the *contact_person*, *contact_persons_role* and *phone_number* columns track data that relate to the contact person, not the customer. If, for some reason, the contact person for a customer changes, we would have to edit all of these columns. This opens up a risk that we will change the values in one of the columns but forget to change another. 

To fix this, these columns should be moved to a table containing data on the contact person. Let's give it a go!

Dev: We will now fix our table to satisfy 2NF. 

1. First, remove *contact_person*, *contact_persons_role* and *phone_number* from the *customers* table, and create a new table *contact_persons* with columns *name*, *role*, and *phone_number* to store this data. Remember to add a unique identifier for each contact person. This table should refer back to *customers* table. 
2. Next, create a column in our *customers* table to store *contact_person_id*. This will refer to our new *contact_persons* table

ANSWER: CREATE TABLE customers (id INT(6) auto_increment primary key, name VARCHAR(255), industry VARCHAR(255), address VARCHAR(255), city VARCHAR(255), zip VARCHAR(5));

CREATE TABLE contact_persons (id INT(6) auto_increment primary key, name TEXT, role TEXT, phone_number VARCHAR(12), customer_id INT(6));

Great work! Now, if the contact person for a customer changes, we just have to insert a record into our *contact_persons* table and change the *contact_person_id* in our *customers* table. Let's move on to 3NF! 