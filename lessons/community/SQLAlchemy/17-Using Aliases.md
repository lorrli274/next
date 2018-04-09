When querying across multiple tables, if the same table needs to be referenced more than once, SQL typically requires that the table be **aliased** with another name, so that it can be distinguished against other occurrences of that table. The [`Query`](http://docs.sqlalchemy.org/query.html#sqlalchemy.orm.query.Query "sqlalchemy.orm.query.Query") supports this most explicitly using the [`aliased`](http://docs.sqlalchemy.org/query.html#sqlalchemy.orm.aliased "sqlalchemy.orm.aliased") construct. Below we join to the `Address` entity twice, to locate a user who has two distinct email addresses at the same time:
    
```sql    
>>> from sqlalchemy.orm import aliased
>>> adalias1 = aliased(Address)
>>> adalias2 = aliased(Address)
>>> for username, email1, email2 in 
...     session.query(User.name, adalias1.email_address, adalias2.email_address).
...     join(adalias1, User.addresses).
...     join(adalias2, User.addresses).
...     filter(adalias1.email_address=='jack@google.com').
...     filter(adalias2.email_address=='j25@yahoo.com'):
...     print(username, email1, email2)
jack jack@google.com j25@yahoo.com
```
