Here's a rundown of some of the most common operators used in `[filter()`][40]:

* `[equals`][41]:

```
query.filter(User.name == 'ed')
```

* `[not equals`][42]:

```
query.filter(User.name != 'ed')
```

* `[LIKE`][43]:

```
query.filter(User.name.like('%ed%'))
```

> Note: ColumnOperators.like() renders the LIKE operator, which is case insensitive on some backends, and case sensitive on others. For guaranteed case-insensitive comparisons, use ColumnOperators.ilike().

* ILIKE (case-insensitive LIKE):

```
query.filter(User.name.ilike('%ed%'))
```

> Note: most backends don't support ILIKE directly. For those, the `[ColumnOperators.ilike()`][44] operator renders an expression combining LIKE with the LOWER SQL function applied to each operand.

* `[IN`][45]:

```
    query.filter(User.name.in_(['ed', 'wendy', 'jack']))

# works with query objects too:
query.filter(User.name.in_(
    session.query(User.name).filter(User.name.like('%ed%'))
))
```

* `[NOT IN`][46]:

```
query.filter(~User.name.in_(['ed', 'wendy', 'jack']))
```

* `[IS NULL`][47]:

```
    query.filter(User.name == None)

# alternatively, if pep8/linters are a concern
query.filter(User.name.is_(None))
```
* `[IS NOT NULL`][48]:

```
    query.filter(User.name != None)

# alternatively, if pep8/linters are a concern
query.filter(User.name.isnot(None))
```

* `[AND`][49]:

```
    # use and_()
from sqlalchemy import and_
query.filter(and_(User.name == 'ed', User.fullname == 'Ed Jones'))

# or send multiple expressions to .filter()
query.filter(User.name == 'ed', User.fullname == 'Ed Jones')

# or chain multiple filter()/filter_by() calls
query.filter(User.name == 'ed').filter(User.fullname == 'Ed Jones')
```

> Note: Make sure you use `[and_()`][49] and **not** the Python `and` operator!

* `[OR`][50]:

```
    from sqlalchemy import or_
query.filter(or_(User.name == 'ed', User.name == 'wendy'))
```

> Note: Make sure you use `[or_()`][50] and **not** the Python `or` operator!

* `[MATCH`][51]:

```
query.filter(User.name.match('wendy'))
```

> Note: `[match()`][51] uses a database-specific `MATCH` or `CONTAINS` function; its behavior will vary by backend and is not available on some backends such as SQLite.
