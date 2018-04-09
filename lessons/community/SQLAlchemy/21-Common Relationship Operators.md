Here's all the operators which build on relationships - each one is linked to its API documentation which includes full details on usage and behavior:

* [`__eq__()`](http://docs.sqlalchemy.org/internals.html#sqlalchemy.orm.properties.RelationshipProperty.Comparator.__eq__ "sqlalchemy.orm.properties.RelationshipProperty.Comparator.__eq__") (many-to-one "equals" comparison):

```sql
query.filter(Address.user == someuser)
```

* [`__ne__()`](http://docs.sqlalchemy.org/internals.html#sqlalchemy.orm.properties.RelationshipProperty.Comparator.__ne__ "sqlalchemy.orm.properties.RelationshipProperty.Comparator.__ne__") (many-to-one "not equals" comparison):

```sql
query.filter(Address.user != someuser)
```

* IS NULL (many-to-one comparison, also uses [`__eq__()`](http://docs.sqlalchemy.org/internals.html#sqlalchemy.orm.properties.RelationshipProperty.Comparator.__eq__ "sqlalchemy.orm.properties.RelationshipProperty.Comparator.__eq__")):

```sql    
query.filter(Address.user == None)
```

* [`contains()`](http://docs.sqlalchemy.org/internals.html#sqlalchemy.orm.properties.RelationshipProperty.Comparator.contains "sqlalchemy.orm.properties.RelationshipProperty.Comparator.contains") (used for one-to-many collections):

```sql
query.filter(User.addresses.contains(someaddress))
```

* [`any()`](http://docs.sqlalchemy.org/internals.html#sqlalchemy.orm.properties.RelationshipProperty.Comparator.any "sqlalchemy.orm.properties.RelationshipProperty.Comparator.any") (used for collections):

```sql    
    query.filter(User.addresses.any(Address.email_address == 'bar'))

# also takes keyword arguments:
query.filter(User.addresses.any(email_address='bar'))
```

* [`has()`](http://docs.sqlalchemy.org/internals.html#sqlalchemy.orm.properties.RelationshipProperty.Comparator.has "sqlalchemy.orm.properties.RelationshipProperty.Comparator.has") (used for scalar references):

```sql
query.filter(Address.user.has(name='ed'))
```

* [`Query.with_parent()`](http://docs.sqlalchemy.org/query.html#sqlalchemy.orm.query.Query.with_parent "sqlalchemy.orm.query.Query.with_parent") (used for any relationship):

```sql
session.query(Address).with_parent(someuser, 'addresses')
```
