The **`LIKE`** operator can be used to compare text using wildcards:

```sql
SELECT NAME,
       value
FROM   projects
WHERE  NAME LIKE '%Office%'; 
```

The `%` indicates a wildcard that will match any amount of characters. For example, `%Library` would match the following values:
* "Library"
* "A Library"
* "East Ave Library"

However, it would not match a value like "The Library Project" because a `%` was not provided at the end of the line.

`LIKE` is also case sensitived. For a case insensitive query, use `ILIKE`:

```sql
SELECT NAME,
       value
FROM   projects
WHERE  NAME ilike '%bank%';
```
