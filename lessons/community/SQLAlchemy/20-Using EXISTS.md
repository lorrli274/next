The EXISTS keyword in SQL is a boolean operator which returns True if the given expression contains any rows. It may be used in many scenarios in place of joins, and is also useful for locating rows which do not have a corresponding row in a related table.

There is an explicit EXISTS construct, which looks like this:
    
```    
>>> from sqlalchemy.sql import exists
>>> stmt = exists().where(Address.user_id==User.id)
[sql][28]>>> for name, in session.query(User.name).filter(stmt):
...     print(name)
jack
```

The `[Query`][27] features several operators which make usage of EXISTS automatically. Above, the statement can be expressed along the `User.addresses` relationship using `[any()`][79]:
    
```    
[sql][28]>>> for name, in session.query(User.name).
...         filter(User.addresses.any()):
...     print(name)
jack
```

`[any()`][79] takes criterion as well, to limit the rows matched:
    
```    
[sql][28]>>> for name, in session.query(User.name).
...     filter(User.addresses.any(Address.email_address.like('%google%'))):
...     print(name)
jack
```

`[has()`][80] is the same operator as `[any()`][79] for many-to-one relationships (note the `~` operator here too, which means "NOT"):
    
```    
[sql][28]>>> session.query(Address).
...         filter(~Address.user.has(User.name=='jack')).all()
[]
```
