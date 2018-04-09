Above, we just selected a result that included a column from a subquery. What if we wanted our subquery to map to an entity? For this we use `aliased()` to associate an "alias" of a mapped class to a subquery:
    
```sql    
>>> stmt = session.query(Address).
...                 filter(Address.email_address != 'j25@yahoo.com').
...                 subquery()
>>> adalias = aliased(Address, stmt)
>>> for user, address in session.query(User, adalias).
...         join(adalias, User.addresses):
...     print(user)
...     print(address)
```    
    
