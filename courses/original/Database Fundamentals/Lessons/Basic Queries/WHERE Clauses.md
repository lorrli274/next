Oftentimes only specific subset data in a table is of value when writing a query. For example, when trying to find all the orders made by a specific employee in a table with thousands of project job orders it would be unreasonable to `SELECT` all the data and then manually scan through it for the relevant records.

Instead, a **`WHERE`** clause is used to filter the data.

### Query
```sql
SELECT * FROM job_orders WHERE employee_id = 1;
```
### Result
| id   | employee_id | project_id | description                              | order_datetime      | quantity | price  |
| ---- | ----------- | ---------- | ---------------------------------------- | ------------------- | -------- | ------ |
| 1102 | 1           | 4          | Dewalt Tools Dwtdc385k Hd Srp 18v Cordless Reciprocating Saw Kit | 2017-01-23 12:40:00 | 244      | 144.02 |
| 1151 | 1           | 4          | Black & Decker Lithium-ion Smartdriver With Exclusive Magnetic Screw-holder | 2017-12-27 02:40:04 | 178      | 613.33 |


`WHERE` indicates that one or more conditions to be applied to the data will be given. 

You can also provide multiple conditions using the boolean logic keywords (or **operators**) **`AND`** and **`OR`**:

### Query

```sql
SELECT * FROM job_orders WHERE employee_id = 1 AND price > 500;
```
### Result
> DEV: TODO

### Query
```sql
SELECT * FROM job_orders WHERE employee_id = 1 OR project_id = 4;
```
### Result
> DEV: TODO

These conditions can also be combined:

### Query
```sql
SELECT * FROM job_orders WHERE (employee_id = 1 OR project_id = 4) AND price > 500;
```
### Result
> DEV: TODO

Note the use of the parentheses to indicate the operator presendence of the operators. A detailed list of the default presesence is available [here](https://dev.mysql.com/doc/refman/5.7/en/operator-precedence.html).


* `LIKE`
* `IN`
* `NOT`
* `IS NULL`
* `IS NOT NULL`
* `BETWEEN`