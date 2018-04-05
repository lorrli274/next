A number of methods on `[Query`][27] immediately issue SQL and return a value containing loaded database results. Here's a brief tour:

* `[all()`][52] returns a list:

```
    >>> query = session.query(User).filter(User.name.like('%ed')).order_by(User.id)
[sql][28]>>> query.all()
[,
      ]
```

* `[first()`][53] applies a limit of one and returns the first result as a scalar:

```
[sql][28]>>> query.first()
```    

* `[one()`][54] fully fetches all rows, and if not exactly one object identity or composite row is present in the result, raises an error. With multiple rows found:

```
    >>> user = query.one()
Traceback (most recent call last):
...
MultipleResultsFound: Multiple rows were found for one()
```

With no rows found:

```    
    >>> user = query.filter(User.id == 99).one()
Traceback (most recent call last):
...
NoResultFound: No row was found for one()
```
`
The `[one()`][54] method is great for systems that expect to handle "no items found" versus "multiple items found" differently; such as a RESTful web service, which may want to raise a "404 not found" when no results are found, but raise an application error when multiple results are found.

* `[one_or_none()`][55] is like `[one()`][54], except that if no results are found, it doesn't raise an error; it just returns `None`. Like `[one()`][54], however, it does raise an error if multiple results are found.

* `[scalar()`][56] invokes the `[one()`][54] method, and upon success returns the first column of the row:

```
    >>> query = session.query(User.id).filter(User.name == 'ed').
...    order_by(User.id)
[sql][28]>>> query.scalar()
1
```
