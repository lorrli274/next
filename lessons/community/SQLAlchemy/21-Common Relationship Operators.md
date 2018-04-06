Here's all the operators which build on relationships - each one is linked to its API documentation which includes full details on usage and behavior:

* `[__eq__()`][81] (many-to-one "equals" comparison):

```
query.filter(Address.user == someuser)
```

* `[__ne__()`][82] (many-to-one "not equals" comparison):

```
query.filter(Address.user != someuser)
```

* IS NULL (many-to-one comparison, also uses `[__eq__()`][81]):

```    
query.filter(Address.user == None)
```

* `[contains()`][83] (used for one-to-many collections):

```
query.filter(User.addresses.contains(someaddress))
```

* `[any()`][79] (used for collections):

```    
    query.filter(User.addresses.any(Address.email_address == 'bar'))

# also takes keyword arguments:
query.filter(User.addresses.any(email_address='bar'))
```

* `[has()`][80] (used for scalar references):

```
query.filter(Address.user.has(name='ed'))
```

* `[Query.with_parent()`][84] (used for any relationship):

```
session.query(Address).with_parent(someuser, 'addresses')
```
