A number of methods on [`Query`](http://docs.sqlalchemy.org/query.html#sqlalchemy.orm.query.Query "sqlalchemy.orm.query.Query") immediately issue SQL and return a value containing loaded database results. Here's a brief tour:

* [`all()`](http://docs.sqlalchemy.org/query.html#sqlalchemy.orm.query.Query.all "sqlalchemy.orm.query.Query.all") returns a list:

```sql
    >>> query = session.query(User).filter(User.name.like('%ed')).order_by(User.id)
[sql][28]>>> query.all()
[,
      ]
```

* [`first()`](http://docs.sqlalchemy.org/query.html#sqlalchemy.orm.query.Query.first "sqlalchemy.orm.query.Query.first") applies a limit of one and returns the first result as a scalar:

```sql
[sql][28]>>> query.first()
```    

* [`one()`](http://docs.sqlalchemy.org/query.html#sqlalchemy.orm.query.Query.one "sqlalchemy.orm.query.Query.one") fully fetches all rows, and if not exactly one object identity or composite row is present in the result, raises an error. With multiple rows found:

```sql
    >>> user = query.one()
Traceback (most recent call last):
...
MultipleResultsFound: Multiple rows were found for one()
```

With no rows found:

```sql    
    >>> user = query.filter(User.id == 99).one()
Traceback (most recent call last):
...
NoResultFound: No row was found for one()
```

The [`one()`](http://docs.sqlalchemy.org/query.html#sqlalchemy.orm.query.Query.one "sqlalchemy.orm.query.Query.one") method is great for systems that expect to handle "no items found" versus "multiple items found" differently; such as a RESTful web service, which may want to raise a "404 not found" when no results are found, but raise an application error when multiple results are found.

* [`one_or_none()`](http://docs.sqlalchemy.org/query.html#sqlalchemy.orm.query.Query.one_or_none "sqlalchemy.orm.query.Query.one_or_none") is like [`one()`](http://docs.sqlalchemy.org/query.html#sqlalchemy.orm.query.Query.one "sqlalchemy.orm.query.Query.one"), except that if no results are found, it doesn't raise an error; it just returns `None`. Like [`one()`](http://docs.sqlalchemy.org/query.html#sqlalchemy.orm.query.Query.one "sqlalchemy.orm.query.Query.one"), however, it does raise an error if multiple results are found.

* [`scalar()`](http://docs.sqlalchemy.org/query.html#sqlalchemy.orm.query.Query.scalar "sqlalchemy.orm.query.Query.scalar") invokes the [`one()`](http://docs.sqlalchemy.org/query.html#sqlalchemy.orm.query.Query.one "sqlalchemy.orm.query.Query.one") method, and upon success returns the first column of the row:

```sql
    >>> query = session.query(User.id).filter(User.name == 'ed').
...    order_by(User.id)
[sql][28]>>> query.scalar()
1
```
