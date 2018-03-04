Each **column** of a table stores a specific attribute about a row. A table can have as many columns as you'd like, but tables with too many columns are good candidates for splitting into multiple tables.

In a table storing information about employees, _first\_name_ is a potential column:

| first_name |
| ---------- |
| Samantha   |
| Devin      |
| Kylah      |
| Ali        |
| Lathan     |

A column should only ever store data for one attribute. For example, you would never want to sometimes store an employee's last name in a column called _first\_name_.

Deciding what to store in each column is important. You may find yourself asking these questions:

* Should I store the first and last name in a column called _name_, or separately?
* Should I store an entire address in one column, or break it up into _street_, _city_, _state_, _zip_, etc.?
* Should I store a employee's age or their date of birth?

The answers to these questions can be found the requirements of your application. The respective answers might be:

* Yes, because I only ever use a employee's full name, not their first or last name.
* No, because I will want to be able to find all employees in a specific zip code.
* No, because I can calculate their age from their date of birth at any time.

When in doubt, it's best to store data in as much detail as possible, and to avoid storing data that can be inferred from other data (e.g. store a employee's date of birth instead of their age).
