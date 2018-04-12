For this course we will use an in-memory-only SQLite database. To connect we use [`create_engine()`](http://docs.sqlalchemy.org/core/engines.html#sqlalchemy.create_engine "sqlalchemy.create_engine"):
    
```python    
>>> from sqlalchemy import create_engine
>>> engine = create_engine('sqlite:///:memory:', echo=True)
```

The `echo` flag is a shortcut to setting up SQLAlchemy logging, which is accomplished via Python's standard `logging` module. With it enabled, we'll see all the generated SQL produced. If you are working through this course and want less output generated, set it to `False`. This course will format the SQL behind a popup window so it doesn't get in our way; just click the "SQL" links to see what's being generated.

The return value of [`create_engine()`](http://docs.sqlalchemy.org/core/engines.html#sqlalchemy.create_engine "sqlalchemy.create_engine") is an instance of [`Engine`](http://docs.sqlalchemy.org/core/connections.html#sqlalchemy.engine.Engine "sqlalchemy.engine.Engine"), and it represents the core interface to the database, adapted through a dialect that handles the details of the database and [DBAPI](http://docs.sqlalchemy.org/glossary.html#term-dbapi) in use. In this case the SQLite dialect will interpret instructions to the Python built-in `sqlite3` module.

The first time a method like [`Engine.execute()`](http://docs.sqlalchemy.org/core/connections.html#sqlalchemy.engine.Engine.execute "sqlalchemy.engine.Engine.execute") or [`Engine.connect()`](http://docs.sqlalchemy.org/core/connections.html#sqlalchemy.engine.Engine.connect "sqlalchemy.engine.Engine.connect") is called, the [`Engine`](http://docs.sqlalchemy.org/core/connections.html#sqlalchemy.engine.Engine "sqlalchemy.engine.Engine") establishes a real [DBAPI](http://docs.sqlalchemy.org/glossary.html#term-dbapi) connection to the database, which is then used to emit the SQL. When using the ORM, we typically don't use the [`Engine`](http://docs.sqlalchemy.org/core/connections.html#sqlalchemy.engine.Engine "sqlalchemy.engine.Engine") directly once created; instead, it's used behind the scenes by the ORM as we'll see shortly.

> Info Lazy Connecting
The [`Engine`](http://docs.sqlalchemy.org/core/connections.html#sqlalchemy.engine.Engine "sqlalchemy.engine.Engine"), when first returned by [`create_engine()`](http://docs.sqlalchemy.org/core/engines.html#sqlalchemy.create_engine "sqlalchemy.create_engine"), has not actually tried to connect to the database yet; that happens only the first time it is asked to perform a task against the database.
