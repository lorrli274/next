Since the `[Session`][23] works within a transaction, we can roll back changes made too. Let's make two changes that we'll revert; `ed_user`'s user name gets set to `Edwardo`:
    
```    
>>> ed_user.name = 'Edwardo'
```

and we'll add another erroneous user, `fake_user`:
    
```    
>>> fake_user = User(name='fakeuser', fullname='Invalid', password='12345')
>>> session.add(fake_user)
```

Querying the session, we can see that they're flushed into the current transaction:
    
```    
[sql][28]>>> session.query(User).filter(User.name.in_(['Edwardo', 'fakeuser'])).all()
[, ]
```

Rolling back, we can see that `ed_user`'s name is back to `ed`, and `fake_user` has been kicked out of the session:
    
```    
[sql][28]>>> session.rollback()

[sql][28]>>> ed_user.name
u'ed'
>>> fake_user in session
False
```

issuing a SELECT illustrates the changes made to the database:
    
```    
[sql][28]>>> session.query(User).filter(User.name.in_(['ed', 'fakeuser'])).all()
[]
```