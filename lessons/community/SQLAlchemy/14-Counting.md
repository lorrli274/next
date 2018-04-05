`[Query`][27] includes a convenience method for counting called `[count()`][62]:
    
    
    [sql][28]>>> session.query(User).filter(User.name.like('%ed')).count()
    2

The `[count()`][62] method is used to determine how many rows the SQL statement would return. Looking at the generated SQL above, SQLAlchemy always places whatever it is we are querying into a subquery, then counts the rows from that. In some cases this can be reduced to a simpler `SELECT count(*) FROM table`, however modern versions of SQLAlchemy don't try to guess when this is appropriate, as the exact SQL can be emitted using more explicit means.

For situations where the "thing to be counted" needs to be indicated specifically, we can specify the "count" function directly using the expression `func.count()`, available from the `[func`][63] construct. Below we use it to return the count of each distinct user name:
    
    
    >>> from sqlalchemy import func
    [sql][28]>>> session.query(func.count(User.name), User.name).group_by(User.name).all()
    [(1, u'ed'), (1, u'fred'), (1, u'mary'), (1, u'wendy')]

To achieve our simple `SELECT count(*) FROM table`, we can apply it as:
    
    
    [sql][28]>>> session.query(func.count('*')).select_from(User).scalar()
    4

The usage of `[select_from()`][64] can be removed if we express the count in terms of the `User` primary key directly:
    
    
    [sql][28]>>> session.query(func.count(User.id)).scalar()
    4
