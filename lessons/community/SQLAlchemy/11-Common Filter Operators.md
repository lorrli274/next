Here's a rundown of some of the most common operators used in [`filter()`](http://docs.sqlalchemy.org/query.html#sqlalchemy.orm.query.Query.filter "sqlalchemy.orm.query.Query.filter"):

* [`equals`](http://docs.sqlalchemy.org/core/sqlelement.html#sqlalchemy.sql.operators.ColumnOperators.__eq__ "sqlalchemy.sql.operators.ColumnOperators.__eq__"):

```python
query.filter(User.name == 'ed')
```

* [`not equals`](http://docs.sqlalchemy.org/core/sqlelement.html#sqlalchemy.sql.operators.ColumnOperators.__ne__ "sqlalchemy.sql.operators.ColumnOperators.__ne__"):

```python
query.filter(User.name != 'ed')
```

* [`LIKE`](http://docs.sqlalchemy.org/core/sqlelement.html#sqlalchemy.sql.operators.ColumnOperators.like "sqlalchemy.sql.operators.ColumnOperators.like"):

```python
query.filter(User.name.like('%ed%'))
```

info> Note: `ColumnOperators.like()` renders the `LIKE` operator, which is case insensitive on some backends, and case sensitive on others. For guaranteed case-insensitive comparisons, use `ColumnOperators.ilike()`.

* `ILIKE` (case-insensitive LIKE):

```python
query.filter(User.name.ilike('%ed%'))
```

info> Note: Most backends don't support `ILIKE` directly. For those, the [`ColumnOperators.ilike()`](http://docs.sqlalchemy.org/core/sqlelement.html#sqlalchemy.sql.operators.ColumnOperators.ilike "sqlalchemy.sql.operators.ColumnOperators.ilike") operator renders an expression combining `LIKE` with the `LOWER SQL` function applied to each operand.

* [`IN`](http://docs.sqlalchemy.org/core/sqlelement.html#sqlalchemy.sql.operators.ColumnOperators.in_ "sqlalchemy.sql.operators.ColumnOperators.in_"):

```python
query.filter(User.name.in_(['ed', 'wendy', 'jack']))

# works with query objects too:
query.filter(User.name.in_(
    session.query(User.name).filter(User.name.like('%ed%'))
))
```

* [`NOT IN`](http://docs.sqlalchemy.org/core/sqlelement.html#sqlalchemy.sql.operators.ColumnOperators.notin_ "sqlalchemy.sql.operators.ColumnOperators.notin_"):

```python
query.filter(~User.name.in_(['ed', 'wendy', 'jack']))
```

* [`IS NULL`](http://docs.sqlalchemy.org/core/sqlelement.html#sqlalchemy.sql.operators.ColumnOperators.is_ "sqlalchemy.sql.operators.ColumnOperators.is_"):

```python
query.filter(User.name == None)

# alternatively, if pep8/linters are a concern
query.filter(User.name.is_(None))
```
* [`IS NOT NULL`](http://docs.sqlalchemy.org/core/sqlelement.html#sqlalchemy.sql.operators.ColumnOperators.isnot "sqlalchemy.sql.operators.ColumnOperators.isnot"):

```python
query.filter(User.name != None)

# alternatively, if pep8/linters are a concern
query.filter(User.name.isnot(None))
```

* [`AND`](http://docs.sqlalchemy.org/core/sqlelement.html#sqlalchemy.sql.expression.and_ "sqlalchemy.sql.expression.and_"):

```python
# use and_()
from sqlalchemy import and_
query.filter(and_(User.name == 'ed', User.fullname == 'Ed Jones'))

# or send multiple expressions to .filter()
query.filter(User.name == 'ed', User.fullname == 'Ed Jones')

# or chain multiple filter()/filter_by() calls
query.filter(User.name == 'ed').filter(User.fullname == 'Ed Jones')
```

info> Note: Make sure you use [`and_()`](http://docs.sqlalchemy.org/core/sqlelement.html#sqlalchemy.sql.expression.and_ "sqlalchemy.sql.expression.and_") and not the Python `and` operator!

* [`OR`](http://docs.sqlalchemy.org/core/sqlelement.html#sqlalchemy.sql.expression.or_ "sqlalchemy.sql.expression.or_"):

```python
from sqlalchemy import or_
query.filter(or_(User.name == 'ed', User.name == 'wendy'))
```

> Note: Make sure you use [`or_()`](http://docs.sqlalchemy.org/core/sqlelement.html#sqlalchemy.sql.expression.or_ "sqlalchemy.sql.expression.or_") and not the Python `or` operator!

* [`MATCH`](http://docs.sqlalchemy.org/core/sqlelement.html#sqlalchemy.sql.operators.ColumnOperators.match "sqlalchemy.sql.operators.ColumnOperators.match"):

```python
query.filter(User.name.match('wendy'))
```

info> Note: [`match()`](http://docs.sqlalchemy.org/core/sqlelement.html#sqlalchemy.sql.operators.ColumnOperators.match "sqlalchemy.sql.operators.ColumnOperators.match") uses a database-specific `MATCH` or `CONTAINS` function; its behavior will vary by backend and is not available on some backends such as SQLite.
