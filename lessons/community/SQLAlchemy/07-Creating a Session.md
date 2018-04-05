We're now ready to start talking to the database. The ORM's "handle" to the database is the `[Session`][23]. When we first set up the application, at the same level as our `[create_engine()`][4] statement, we define a `[Session`][23] class which will serve as a factory for new `[Session`][23] objects:
    
```    
>>> from sqlalchemy.orm import sessionmaker
>>> Session = sessionmaker(bind=engine)
```

In the case where your application does not yet have an `[Engine`][5] when you define your module-level objects, just set it up like this:
    
```    
>>> Session = sessionmaker()
```

Later, when you create your engine with `[create_engine()`][4], connect it to the `[Session`][23] using `[configure()`][24]:
    
```    
>>> Session.configure(bind=engine)  # once engine is available
```

This custom-made `[Session`][23] class will create new `[Session`][23] objects which are bound to our database. Other transactional characteristics may be defined when calling `[sessionmaker`][25] as well; these are described in a later chapter. Then, whenever you need to have a conversation with the database, you instantiate a `[Session`][23]:

The above `[Session`][23] is associated with our SQLite-enabled `[Engine`][5], but it hasn't opened any connections yet. When it's first used, it retrieves a connection from a pool of connections maintained by the `[Engine`][5], and holds onto it until we commit all changes and/or close the session object.

> Note: Session Lifecycle Patterns. The question of when to make a Session depends a lot on what kind of application is being built. Keep in mind, the Session is just a workspace for your objects, local to a particular database connection - if you think of an application thread as a guest at a dinner party, the Session is the guest’s plate and the objects it holds are the food (and the database…the kitchen?)! More on this topic available at When do I construct a Session, when do I commit it, and when do I close it?.
