To persist our `User` object, we `[add()`][26] it to our `[Session`][23]:
    
```    
>>> ed_user = User(name='ed', fullname='Ed Jones', password='edspassword')
>>> session.add(ed_user)
```

At this point, we say that the instance is **pending**; no SQL has yet been issued and the object is not yet represented by a row in the database. The `[Session`][23] will issue the SQL to persist `Ed Jones` as soon as is needed, using a process known as a **flush**. If we query the database for `Ed Jones`, all pending information will first be flushed, and the query is issued immediately thereafter.

For example, below we create a new `[Query`][27] object which loads instances of `User`. We "filter by" the `name` attribute of `ed`, and indicate that we'd like only the first result in the full list of rows. A `User` instance is returned which is equivalent to that which we've added:
    
```    
[sql][28]>>> our_user = session.query(User).filter_by(name='ed').first() 
>>> our_user
```    

In fact, the `[Session`][23] has identified that the row returned is the **same** row as one already represented within its internal map of objects, so we actually got back the identical instance as that which we just added:
    
```    
>>> ed_user is our_user
True
```

The ORM concept at work here is known as an [identity map][29] and ensures that all operations upon a particular row within a `[Session`][23] operate upon the same set of data. Once an object with a particular primary key is present in the `[Session`][23], all SQL queries on that `[Session`][23] will always return the same Python object for that particular primary key; it also will raise an error if an attempt is made to place a second, already-persisted object with the same primary key within the session.

We can add more `User` objects at once using `[add_all()`][30]:
    
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

The `[Session`][23] is paying attention. It knows, for example, that `Ed Jones` has been modified:
    
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

We tell the `[Session`][23] that we'd like to issue all remaining changes to the database and commit the transaction, which has been in progress throughout. We do this via `[commit()`][31]. The `[Session`][23] emits the `UPDATE` statement for the password change on "ed", as well as `INSERT` statements for the three new `User` objects we've added:

`[commit()`][31] flushes the remaining changes to the database, and commits the transaction. The connection resources referenced by the session are now returned to the connection pool. Subsequent operations with this session will occur in a **new** transaction, which will again re-acquire connection resources when first needed.

If we look at Ed's `id` attribute, which earlier was `None`, it now has a value:

After the `[Session`][23] inserts new rows in the database, all newly generated identifiers and database-generated defaults become available on the instance, either immediately or via load-on-first-access. In this case, the entire row was re-loaded on access because a new transaction was begun after we issued `[commit()`][31]. SQLAlchemy by default refreshes data from a previous transaction the first time it's accessed within a new transaction, so that the most recent state is available. The level of reloading is configurable as is described in [Using the Session][32].

Session Object States

As our `User` object moved from being outside the `[Session`][23], to inside the `[Session`][23] without a primary key, to actually being inserted, it moved between three out of four available "object states" - **transient**, **pending**, and **persistent**. Being aware of these states and what they mean is always a good idea - be sure to read [Quickie Intro to Object States][33] for a quick overview.
