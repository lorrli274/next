For this tutorial we will use an in-memory-only SQLite database. To connect we use [`create_engine()`][4]:
    
```    
>>> from sqlalchemy import create_engine
>>> engine = create_engine('sqlite:///:memory:', echo=True)
```

The `echo` flag is a shortcut to setting up SQLAlchemy logging, which is accomplished via Python's standard `logging` module. With it enabled, we'll see all the generated SQL produced. If you are working through this tutorial and want less output generated, set it to `False`. This tutorial will format the SQL behind a popup window so it doesn't get in our way; just click the "SQL" links to see what's being generated.

The return value of [`create_engine()`][4] is an instance of [`Engine`][5], and it represents the core interface to the database, adapted through a dialect that handles the details of the database and [DBAPI][6] in use. In this case the SQLite dialect will interpret instructions to the Python built-in `sqlite3` module.

The first time a method like [`Engine.execute()`][7] or [`Engine.connect()`][8] is called, the [`Engine`][5] establishes a real [DBAPI][6] connection to the database, which is then used to emit the SQL. When using the ORM, we typically don't use the [`Engine`][5] directly once created; instead, it's used behind the scenes by the ORM as we'll see shortly.
