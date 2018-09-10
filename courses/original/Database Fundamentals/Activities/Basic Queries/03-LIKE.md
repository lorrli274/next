The **`LIKE`** operator can be used to compare text using wildcards:

```sql
SELECT name,
       value
FROM   projects
WHERE  name LIKE '%Office%'; 
```

The `%` is a wildcard that will match any number of characters. For example, `%Library` would match the following values:
* "Library"
* "A Library"
* "East Ave Library"

However, it would not match a value like "The Library Project" because a `%` was not provided at the end of the line.

`LIKE` is also case sensitive. For a case insensitive query, you would need to convert the value to uppercase:

```sql
SELECT name,
       value
FROM   projects
WHERE  upper(name) like '%BANK%';
```

or lowercase:

```sql
SELECT name,
       value
FROM   projects
WHERE  lower(name) like '%bank%';
```

info> This is the standard way to perform case insensitive queries, and will work with all SQL databases including our MySQL database. However, if you are using PostgreSQL, there is a handy keyword, `ILIKE`, that can be used in place of `LIKE` to make the match case insensitive.

DEV: Write a query to pull the names of all employees with a last name beginning with the letter ‘S’ who earn greater than $20.00/hr. 

ANSWER: 

SELECT first_name  AS 'First Name', 
       last_name   AS 'Last Name' 
FROM employees 
WHERE (
  last_name LIKE 'S%'
  AND hourly_wage > 20);