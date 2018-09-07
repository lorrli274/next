The type of data stored in each column varies from column to column. Databases allow you to pick from a number of different types when designing your database.

The commonly used ones are:

| Type                | Stores                                                       | Maximum                    |
| ------------------- | ------------------------------------------------------------ | -------------------------- |
| `INT`               | An integer between -2,147,483,648 and  2,147,483,647.        | 10 digits                  |
| `TINYINT`           | An integer between -128 and 127                              | 3 digits                   |
| ``FLOAT(M,D)``      | A floating-point number with *M* total digits and up to *D* decimal places. | 7 decimal places           |
| ``DOUBLE(M,D)``     | A floating-point number with *M* total digits and up to *D* decimal places (but double the size of a `FLOAT`) | 15 decimal places          |
| `CHAR(M)`           | A fixed-length string *M* characters long. Uses all *M* characters, padding the string with ending spaces. | 255 characters             |
| `VARCHAR(M)`        | A variable-length string of up to *M* characters. Only stores the characters provided and does not pad the string. An *M* value of greater than 255 will automatically convert to `TEXT` type. | M characters               |
| `BLOB` or `TEXT`    | A large storage type for text or other data (e.g. JSON). `BLOB`s are case sensitive when extracting data while `TEXT`s are not. | 65535 characters           |
| `DATE`              | A date formatted as _YYYY-MM-DD_.                            | 9999-12-31                 |
| `DATETIME`          | A date and time formatted as _YYYY-MM-DD HH:MM:SS[.FRACTION]_. | 9999-12-31 23:59:59.999999 |
| `BOOLEAN` or `BOOL` | An alias of `TINYINT(1)` used to store boolean (`TRUE`/`FALSE`) values. `TRUE` evaluates to 1 and `FALSE` evaluates to 0. | 1                          |

Here are some examples of some data types that might be used in a construction company's database:

* `INT`: All primary and foreign keys, or to track quantities
* `FLOAT`: Wages, hours, and anything else relating to money
* `CHAR`: Material safety labels
* `VARCHAR`: Names, emails, addresses, phone numbers, and social security numbers
* `TEXT`: Project job descriptions and employee evaluations
* `DATE`: Project start / end dates and employee hire dates
* `DATETIME`: Employee timecards
* `BOOL`: Whether or not an employee has a certified drivers license (CDL)

DEV INS: match the following to their respective data types

- Price of item = **FLOAT**
- Employee termination date = **DATE**
- Whether employee enrolled in medical health benefits = **BOOL** 
- Customer feedback = **TEXT** 