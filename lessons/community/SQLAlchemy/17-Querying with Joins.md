Now that we have two tables, we can show some more features of [`Query`](http://docs.sqlalchemy.org/query.html#sqlalchemy.orm.query.Query "sqlalchemy.orm.query.Query"), specifically how to create queries that deal with both tables at the same time. The [Wikipedia page on SQL JOIN](http://en.wikipedia.org/wiki/Join_%28SQL%29) offers a good introduction to join techniques, several of which we'll illustrate here.

To construct a simple implicit join between `User` and `Address`, we can use [`Query.filter()`](http://docs.sqlalchemy.org/query.html#sqlalchemy.orm.query.Query.filter "sqlalchemy.orm.query.Query.filter") to equate their related columns together. Below we load the `User` and `Address` entities at once using this method:
    
```python    
>>> for u, a in session.query(User, Address).\
...                     filter(User.id==Address.user_id).\
...                     filter(Address.email_address=='jack@google.com').\
...                     all():
...     print(u)
...     print(a)
<User(name='jack', fullname='Jack Bean', password='gjffdd')>
<Address(email_address='jack@google.com')>
```    
    

The actual SQL JOIN syntax, on the other hand, is most easily achieved using the [`Query.join()`](http://docs.sqlalchemy.org/query.html#sqlalchemy.orm.query.Query.join "sqlalchemy.orm.query.Query.join") method:
    
```python    
>>> session.query(User).join(Address).\
...         filter(Address.email_address=='jack@google.com').\
...         all()
[<User(name='jack', fullname='Jack Bean', password='gjffdd')>]
```

[`Query.join()`](http://docs.sqlalchemy.org/query.html#sqlalchemy.orm.query.Query.join "sqlalchemy.orm.query.Query.join") knows how to join between `User` and `Address` because there's only one foreign key between them. If there were no foreign keys, or several, [`Query.join()`](http://docs.sqlalchemy.org/query.html#sqlalchemy.orm.query.Query.join "sqlalchemy.orm.query.Query.join") works better when one of the following forms are used:
    
```python    
query.join(Address, User.id==Address.user_id)    # explicit condition
query.join(User.addresses)                       # specify relationship from left to right
query.join(Address, User.addresses)              # same, with explicit target
query.join('addresses')                          # same, using a string
```

As you would expect, the same idea is used for "outer" joins, using the [`outerjoin()`](http://docs.sqlalchemy.org/query.html#sqlalchemy.orm.query.Query.outerjoin "sqlalchemy.orm.query.Query.outerjoin") function:
    
```python    
query.outerjoin(User.addresses)   # LEFT OUTER JOIN
```

The reference documentation for [`join()`](http://docs.sqlalchemy.org/query.html#sqlalchemy.orm.query.Query.join "sqlalchemy.orm.query.Query.join") contains detailed information and examples of the calling styles accepted by this method; [`join()`](http://docs.sqlalchemy.org/query.html#sqlalchemy.orm.query.Query.join "sqlalchemy.orm.query.Query.join") is an important method at the center of usage for any SQL-fluent application.

info>What does [`Query`](http://docs.sqlalchemy.org/query.html#sqlalchemy.orm.query.Query "sqlalchemy.orm.query.Query") select from if there's multiple entities?
The [`Query.join()`](http://docs.sqlalchemy.org/query.html#sqlalchemy.orm.query.Query.join "sqlalchemy.orm.query.Query.join") method will typically join from the leftmost item in the list of entities, when the `ON` clause is omitted, or if the ON clause is a plain SQL expression. To control the first entity in the list of JOINs, use the [`Query.select_from()`](http://docs.sqlalchemy.org/query.html#sqlalchemy.orm.query.Query.select_from "sqlalchemy.orm.query.Query.select_from") method:    
```python    
query = session.query(User, Address).select_from(Address).join(User)
```
