In this case we'd like to indicate that `User.addresses` should load eagerly. A good choice for loading a set of objects as well as their related collections is the [`orm.subqueryload()`](http://docs.sqlalchemy.org/loading_relationships.html#sqlalchemy.orm.subqueryload "sqlalchemy.orm.subqueryload") option, which emits a second `SELECT` statement that fully loads the collections associated with the results just loaded. The name "subquery" originates from the fact that the `SELECT` statement constructed directly via the [`Query`](http://docs.sqlalchemy.org/query.html#sqlalchemy.orm.query.Query "sqlalchemy.orm.query.Query") is re-used, embedded as a subquery into a `SELECT` against the related table. This is a little elaborate but very easy to use:
    
```python    
>>> from sqlalchemy.orm import subqueryload
>>> jack = session.query(User).\
...                 options(subqueryload(User.addresses)).\
...                 filter_by(name='jack').one()
>>> jack
<User(name='jack', fullname='Jack Bean', password='gjffdd')>

>>> jack.addresses
[<Address(email_address='jack@google.com')>, <Address(email_address='j25@yahoo.com')>]
```

info> `subqueryload()` when used in conjunction with limiting such as `Query.first()`, `Query.limit()` or `Query.offset()` should also include `Query.order_by()` on a unique column in order to ensure correct results.
