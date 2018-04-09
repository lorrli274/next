Since the [`Session`](http://docs.sqlalchemy.org/session_api.html#sqlalchemy.orm.session.Session "sqlalchemy.orm.session.Session") works within a transaction, we can roll back changes made too. Let's make two changes that we'll revert; `ed_user`'s user name gets set to `Edwardo`:
    
```sql    
>>> ed_user.name = 'Edwardo'
```

and we'll add another erroneous user, `fake_user`:
    
```sql    
>>> fake_user = User(name='fakeuser', fullname='Invalid', password='12345')
>>> session.add(fake_user)
```

Querying the session, we can see that they're flushed into the current transaction:
    
```sql    
>>> session.query(User).filter(User.name.in_(['Edwardo', 'fakeuser'])).all()
[, ]
```

Rolling back, we can see that `ed_user`'s name is back to `ed`, and `fake_user` has been kicked out of the session:
    
```sql    
>>> session.rollback()

>>> ed_user.name
u'ed'
>>> fake_user in session
False
```

issuing a SELECT illustrates the changes made to the database:
    
```sql    
>>> session.query(User).filter(User.name.in_(['ed', 'fakeuser'])).all()
[]
```
