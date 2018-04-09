The **EXISTS** keyword in SQL is a boolean operator which returns True if the given expression contains any rows. It may be used in many scenarios in place of joins, and is also useful for locating rows which do not have a corresponding row in a related table.

There is an explicit EXISTS construct, which looks like this:
    
```sql    
>>> from sqlalchemy.sql import exists
>>> stmt = exists().where(Address.user_id==User.id)
>>> for name, in session.query(User.name).filter(stmt):
...     print(name)
jack
```

The [`Query`](http://docs.sqlalchemy.org/query.html#sqlalchemy.orm.query.Query "sqlalchemy.orm.query.Query") features several operators which make usage of EXISTS automatically. Above, the statement can be expressed along the `User.addresses` relationship using [`any()`](http://docs.sqlalchemy.org/internals.html#sqlalchemy.orm.properties.RelationshipProperty.Comparator.any "sqlalchemy.orm.properties.RelationshipProperty.Comparator.any"):
    
```sql    
>>> for name, in session.query(User.name).
...         filter(User.addresses.any()):
...     print(name)
jack
```

[`any()`](http://docs.sqlalchemy.org/internals.html#sqlalchemy.orm.properties.RelationshipProperty.Comparator.any "sqlalchemy.orm.properties.RelationshipProperty.Comparator.any") takes criterion as well, to limit the rows matched:
    
```sql    
>>> for name, in session.query(User.name).
...     filter(User.addresses.any(Address.email_address.like('%google%'))):
...     print(name)
jack
```

[`has()`](http://docs.sqlalchemy.org/internals.html#sqlalchemy.orm.properties.RelationshipProperty.Comparator.has "sqlalchemy.orm.properties.RelationshipProperty.Comparator.has") is the same operator as [`any()`](http://docs.sqlalchemy.org/internals.html#sqlalchemy.orm.properties.RelationshipProperty.Comparator.any "sqlalchemy.orm.properties.RelationshipProperty.Comparator.any") for many-to-one relationships (note the `~` operator here too, which means "NOT"):
    
```sql    
>>> session.query(Address).
...         filter(~Address.user.has(User.name=='jack')).all()
[]
```
