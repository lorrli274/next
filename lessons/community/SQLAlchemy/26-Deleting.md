Let's try to delete `jack` and see how that goes. We'll mark the object as deleted in the session, then we'll issue a `count` query to see that no rows remain:
    
```sql    
>>> session.delete(jack)
>>> session.query(User).filter_by(name='jack').count()
0
```

So far, so good. How about Jack's `Address` objects ?
    
```sql    
>>> session.query(Address).filter(
...     Address.email_address.in_(['jack@google.com', 'j25@yahoo.com'])
...  ).count()
2
```

Uh oh, they're still there! Analyzing the flush SQL, we can see that the `user_id` column of each address was set to `NULL`, but the rows weren't deleted. SQLAlchemy doesn't assume that deletes cascade, you have to tell it to do so.
