> DEV: TODO step script for this step

```sh
#!/bin/bash
mysql < "REPLACE INTO projects (id, name, value, start_date, end_date) VALUES (6, 'King Burgers Shop', 80000, '2018-03-15', '2018-12-01')"
```

All `JOIN`s are not created equal! The differences between each type are illustrated below using the _projects_ and *job_orders* tables.

## `INNER JOIN`

> DEV: TODO diagram

By default, a `JOIN` in a query is an **`INNER JOIN`**. This `JOIN` limits the data returned to records that appear in both tables.

## `LEFT JOIN`

> DEV: TODO diagram

##`RIGHT JOIN`

>  DEV: TODO diagram

##`FULL OUTER JOIN` 

> DEV: TODO diagram

