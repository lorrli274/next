The type of data stored in each column varies from column to column. Database software allow you to pick from a number of different types when designing your database. The commonly used ones are:

| Type             | Stores                                   | Maximum             |
| ---------------- | ---------------------------------------- | ------------------- |
| `INT`            | An integer between -2147483648 and  2147483647. | 11 numbers          |
| ``FLOAT(M,D)``   | A floating-point number with *M* total digits and up to *D* decimal places. | 24 decimal places   |
| ``DOUBLE(M, D)`` | A floating-point number with *M* total digits and up to *D* decimal places (but 2x the size of a `FLOAT`) | 53 decimal places   |
| `CHAR(M)`        | A fixed-length string _M_ characters long. Uses all _M_ characters, padding the string with ending spaces. | 255 characters      |
| `VARCHAR(M)`     | A variable-length string of up to _M_ characters. Only stores the characters provided and does not pad the string. | 255 characters      |
| `BLOB` or `TEXT` | A large storage type for text or other data (e.g. JSON). `BLOB`s are case sensitive when extracting data while `TEXT`s are not. | 65535 characters    |
| `DATE`           | A date formatted as _YYYY-MM-DD_.        | 9999-12-31          |
| `DATETIME`       | A date and time formatted as _YYYY-MM-DD HH:MM:SS_. | 9999-12-31 23:59:59 |

