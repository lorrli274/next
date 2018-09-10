For a database to be in third normal form, it must first satisfy all the criteria for 2NF.

Then, each column must be **non-transitively dependent** on the table's primary key. This means that all columns in a table should rely on the primary key (i.e. criteria for 2NF) and no other column. If Column A relies on PK and also on Column B then Column A is transitively dependent on PK so the table does not satisfy 3NF. 

Our table currently has transitively dependent columns. The transitively dependent relationship is between *city* and *zip*. The city in which a customer is located relies on the customer, so this satisfies 2NF; however, the city relies on zip code. If a customer relocates, there may be a chance we update one column but not the other. Because this relationship exists, the database is not in 3NF.

| *id*   | *name*            | *industry*   | *contact_id* | *address*          | *city*       | *zip* |
| ------ | ----------------- | ------------ | ------------ | ------------------ | ------------ | ----- |
| 000001 | Next University   | Education    | 000001       | 1 Coding Lane      | Next         | 99999 |
| 000002 | XYZ Health Center | Healthcare   | 000002       | 88 Hospital Avenue | Healersville | 55555 |
| 000003 | ArchiTECHS        | Architecture | 000003       | 77 Tower Street    | Gridlock     | 12345 |

Dev: Based on how we modified the table in the last lesson, see if you can work out how to fix the table to satisfy 3NF. If you get stuck, Codey is more than happy to help! 

ANSWER: CREATE TABLE customers (id INT(6) auto_increment primary key, name VARCHAR(255), industry VARCHAR(255), address VARCHAR(255), zip VARCHAR(5));

CREATE TABLE zips (zip VARCHAR(5) primary key, city VARCHAR(255))

info> A database is considered normal if it follows these three normal forms. If you'd like to know more about the other normal forms beyond 3NF, here is a quick summary from https://www.calebcurry.com/blogs/database-design/introduction-to-database-normalization.

| Normal Form                       | Summary                                                      |
| --------------------------------- | ------------------------------------------------------------ |
| Elementary Key Normal Form (EKNF) | Elementary Key Normal Form	Every non-trivial functional dependency in the table is either the dependency of an elementary key attribute or a dependency on a superkey |
| Boyce-Codd Normal Form (BCNF)     | Every non-trivial functional dependency in the table is a dependency on a superkey |
| Fourth Normal Form (4NF)          | Every non-trivial multivalued dependency in the table is a dependency on a superkey |
| Fifth Normal Form (5NF)           | Every non-trivial join dependency in the table is implied by the superkeys of the table |
| Domain/Key Normal Form (DKNF)     | Every constraint on the table is a logical consequence of the table’s domain constraints and key constraints |
| Sixth Normal Form (6NF)           | Table features no non-trivial join dependencies at all (with reference to generalized join operator) |