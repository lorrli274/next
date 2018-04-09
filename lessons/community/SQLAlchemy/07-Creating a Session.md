We're now ready to start talking to the database. The ORM's "handle" to the database is the [`Session`](http://docs.sqlalchemy.org/session_api.html#sqlalchemy.orm.session.Session "sqlalchemy.orm.session.Session"). When we first set up the application, at the same level as our [`create_engine()`](http://docs.sqlalchemy.org/core/engines.html#sqlalchemy.create_engine "sqlalchemy.create_engine") statement, we define a [`Session`](http://docs.sqlalchemy.org/session_api.html#sqlalchemy.orm.session.Session "sqlalchemy.orm.session.Session") class which will serve as a factory for new [`Session`](http://docs.sqlalchemy.org/session_api.html#sqlalchemy.orm.session.Session "sqlalchemy.orm.session.Session") objects:
    
```sql    
>>> from sqlalchemy.orm import sessionmaker
>>> Session = sessionmaker(bind=engine)
```

In the case where your application does not yet have an [`Engine`](http://docs.sqlalchemy.org/core/connections.html#sqlalchemy.engine.Engine "sqlalchemy.engine.Engine") when you define your module-level objects, just set it up like this:
    
```sql    
>>> Session = sessionmaker()
```

Later, when you create your engine with [`create_engine()`](http://docs.sqlalchemy.org/core/engines.html#sqlalchemy.create_engine "sqlalchemy.create_engine"), connect it to the [`Session`](http://docs.sqlalchemy.org/session_api.html#sqlalchemy.orm.session.Session "sqlalchemy.orm.session.Session") using [`configure()`](http://docs.sqlalchemy.org/session_api.html#sqlalchemy.orm.session.Sessionmaker.configure "sqlalchemy.orm.session.sessionmaker.configure"):
    
```sql    
>>> Session.configure(bind=engine)  # once engine is available
```

This custom-made [`Session`](http://docs.sqlalchemy.org/session_api.html#sqlalchemy.orm.session.Session "sqlalchemy.orm.session.Session") class will create new [`Session`](http://docs.sqlalchemy.org/session_api.html#sqlalchemy.orm.session.Session "sqlalchemy.orm.session.Session") objects which are bound to our database. Other transactional characteristics may be defined when calling [`sessionmaker`](http://docs.sqlalchemy.org/session_api.html#sqlalchemy.orm.session.Sessionmaker "sqlalchemy.orm.session.sessionmaker") as well; these are described in a later chapter. Then, whenever you need to have a conversation with the database, you instantiate a [`Session`](http://docs.sqlalchemy.org/session_api.html#sqlalchemy.orm.session.Session "sqlalchemy.orm.session.Session"):

The above [`Session`](http://docs.sqlalchemy.org/session_api.html#sqlalchemy.orm.session.Session "sqlalchemy.orm.session.Session") is associated with our SQLite-enabled [`Engine`](http://docs.sqlalchemy.org/core/connections.html#sqlalchemy.engine.Engine "sqlalchemy.engine.Engine"), but it hasn't opened any connections yet. When it's first used, it retrieves a connection from a pool of connections maintained by the [`Engine`](http://docs.sqlalchemy.org/core/connections.html#sqlalchemy.engine.Engine "sqlalchemy.engine.Engine"), and holds onto it until we commit all changes and/or close the session object.

> Note: Session Lifecycle Patterns. The question of when to make a [`Session`](http://docs.sqlalchemy.org/en/latest/orm/session_api.html#sqlalchemy.orm.session.Session) depends a lot on what kind of application is being built. Keep in mind, the [`Session`](http://docs.sqlalchemy.org/en/latest/orm/session_api.html#sqlalchemy.orm.session.Session) is just a workspace for your objects, local to a particular database connection - if you think of an application thread as a guest at a dinner party, the Session is the guest’s plate and the objects it holds are the food (and the database…the kitchen?)!
