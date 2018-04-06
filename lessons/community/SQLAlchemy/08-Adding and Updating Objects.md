To persist our `User` object, we [`add()`](http://docs.sqlalchemy.org/session_api.html#sqlalchemy.orm.session.Session.add "sqlalchemy.orm.session.Session.add") it to our [`Session`](http://docs.sqlalchemy.org/session_api.html#sqlalchemy.orm.session.Session "sqlalchemy.orm.session.Session"):
    
```    
>>> ed_user = User(name='ed', fullname='Ed Jones', password='edspassword')
>>> session.add(ed_user)
```

At this point, we say that the instance is **pending**; no SQL has yet been issued and the object is not yet represented by a row in the database. The [`Session`](http://docs.sqlalchemy.org/session_api.html#sqlalchemy.orm.session.Session "sqlalchemy.orm.session.Session") will issue the SQL to persist `Ed Jones` as soon as is needed, using a process known as a **flush**. If we query the database for `Ed Jones`, all pending information will first be flushed, and the query is issued immediately thereafter.

For example, below we create a new [`Query`](http://docs.sqlalchemy.org/query.html#sqlalchemy.orm.query.Query "sqlalchemy.orm.query.Query") object which loads instances of `User`. We "filter by" the `name` attribute of `ed`, and indicate that we'd like only the first result in the full list of rows. A `User` instance is returned which is equivalent to that which we've added:
    
```    
[sql][28]>>> our_user = session.query(User).filter_by(name='ed').first() 
>>> our_user
```    

In fact, the [`Session`](http://docs.sqlalchemy.org/session_api.html#sqlalchemy.orm.session.Session "sqlalchemy.orm.session.Session") has identified that the row returned is the **same** row as one already represented within its internal map of objects, so we actually got back the identical instance as that which we just added:
    
```    
>>> ed_user is our_user
True
```

The ORM concept at work here is known as an [identity map](http://docs.sqlalchemy.org/glossary.html#term-identity-map) and ensures that all operations upon a particular row within a [`Session`](http://docs.sqlalchemy.org/session_api.html#sqlalchemy.orm.session.Session "sqlalchemy.orm.session.Session") operate upon the same set of data. Once an object with a particular primary key is present in the [`Session`](http://docs.sqlalchemy.org/session_api.html#sqlalchemy.orm.session.Session "sqlalchemy.orm.session.Session"), all SQL queries on that [`Session`](http://docs.sqlalchemy.org/session_api.html#sqlalchemy.orm.session.Session "sqlalchemy.orm.session.Session") will always return the same Python object for that particular primary key; it also will raise an error if an attempt is made to place a second, already-persisted object with the same primary key within the session.

We can add more `User` objects at once using [`add_all()`](http://docs.sqlalchemy.org/session_api.html#sqlalchemy.orm.session.Session.add_all "sqlalchemy.orm.session.Session.add_all"):
    
```    
>>> session.add_all([
...     User(name='wendy', fullname='Wendy Williams', password='foobar'),
...     User(name='mary', fullname='Mary Contrary', password='xxg527'),
...     User(name='fred', fullname='Fred Flinstone', password='blah')])
```

Also, we've decided the password for Ed isn't too secure, so lets change it:
    
```    
>>> ed_user.password = 'f8s7ccs'
```

The [`Session`](http://docs.sqlalchemy.org/session_api.html#sqlalchemy.orm.session.Session "sqlalchemy.orm.session.Session") is paying attention. It knows, for example, that `Ed Jones` has been modified:
    
```    
>>> session.dirty
IdentitySet([])
```

and that three new `User` objects are pending:
    
```    
>>> session.new  
IdentitySet([,
,
])
```

We tell the [`Session`](http://docs.sqlalchemy.org/session_api.html#sqlalchemy.orm.session.Session "sqlalchemy.orm.session.Session") that we'd like to issue all remaining changes to the database and commit the transaction, which has been in progress throughout. We do this via [`commit()`](http://docs.sqlalchemy.org/session_api.html#sqlalchemy.orm.session.Session.commit "sqlalchemy.orm.session.Session.commit"). The [`Session`](http://docs.sqlalchemy.org/session_api.html#sqlalchemy.orm.session.Session "sqlalchemy.orm.session.Session") emits the `UPDATE` statement for the password change on "ed", as well as `INSERT` statements for the three new `User` objects we've added:

[`commit()`](http://docs.sqlalchemy.org/session_api.html#sqlalchemy.orm.session.Session.commit "sqlalchemy.orm.session.Session.commit") flushes the remaining changes to the database, and commits the transaction. The connection resources referenced by the session are now returned to the connection pool. Subsequent operations with this session will occur in a **new** transaction, which will again re-acquire connection resources when first needed.

If we look at Ed's `id` attribute, which earlier was `None`, it now has a value:

After the [`Session`](http://docs.sqlalchemy.org/session_api.html#sqlalchemy.orm.session.Session "sqlalchemy.orm.session.Session") inserts new rows in the database, all newly generated identifiers and database-generated defaults become available on the instance, either immediately or via load-on-first-access. In this case, the entire row was re-loaded on access because a new transaction was begun after we issued [`commit()`](http://docs.sqlalchemy.org/session_api.html#sqlalchemy.orm.session.Session.commit "sqlalchemy.orm.session.Session.commit"). SQLAlchemy by default refreshes data from a previous transaction the first time it's accessed within a new transaction, so that the most recent state is available. The level of reloading is configurable as is described in [Using the Session](http://docs.sqlalchemy.org/session.html).

Session Object States

As our `User` object moved from being outside the [`Session`](http://docs.sqlalchemy.org/session_api.html#sqlalchemy.orm.session.Session "sqlalchemy.orm.session.Session"), to inside the [`Session`](http://docs.sqlalchemy.org/session_api.html#sqlalchemy.orm.session.Session "sqlalchemy.orm.session.Session") without a primary key, to actually being inserted, it moved between three out of four available "object states" - **transient**, **pending**, and **persistent**. Being aware of these states and what they mean is always a good idea - be sure to read [Quickie Intro to Object States](http://docs.sqlalchemy.org/session_state_management.html#session-object-states) for a quick overview.
