A third style of eager loading is when we are constructing a JOIN explicitly in order to locate the primary rows, and would like to additionally apply the extra table to a related object or collection on the primary object. This feature is supplied via the [`orm.contains_eager()`](http://docs.sqlalchemy.org/loading_relationships.html#sqlalchemy.orm.contains_eager "sqlalchemy.orm.contains_eager") function, and is most typically useful for pre-loading the many-to-one object on a query that needs to filter on that same object. Below we illustrate loading an `Address` row as well as the related `User` object, filtering on the `User` named "jack" and using [`orm.contains_eager()`](http://docs.sqlalchemy.org/loading_relationships.html#sqlalchemy.orm.contains_eager "sqlalchemy.orm.contains_eager") to apply the "user" columns to the `Address.user` attribute:
    
```python    
>>> from sqlalchemy.orm import contains_eager
>>> jacks_addresses = session.query(Address).\
...                             join(Address.user).\
...                             filter(User.name=='jack').\
...                             options(contains_eager(Address.user)).\
...                             all()
>>> jacks_addresses
[<Address(email_address='jack@google.com')>, <Address(email_address='j25@yahoo.com')>]

>>> jacks_addresses[0].user
<User(name='jack', fullname='Jack Bean', password='gjffdd')>
```    
