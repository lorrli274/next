A `[Query`][27] object is created using the `[query()`][34] method on `[Session`][23]. This function takes a variable number of arguments, which can be any combination of classes and class-instrumented descriptors. Below, we indicate a `[Query`][27] which loads `User` instances. When evaluated in an iterative context, the list of `User` objects present is returned:
    
```    
[sql][28]>>> for instance in session.query(User).order_by(User.id):
...     print(instance.name, instance.fullname)
ed Ed Jones
wendy Wendy Williams
mary Mary Contrary
fred Fred Flinstone
```

The `[Query`][27] also accepts ORM-instrumented descriptors as arguments. Any time multiple class entities or column-based entities are expressed as arguments to the `[query()`][34] function, the return result is expressed as tuples:
    
```    
[sql][28]>>> for name, fullname in session.query(User.name, User.fullname):
...     print(name, fullname)
ed Ed Jones
wendy Wendy Williams
mary Mary Contrary
fred Fred Flinstone
```

The tuples returned by `[Query`][27] are _named_ tuples, supplied by the `[KeyedTuple`][35] class, and can be treated much like an ordinary Python object. The names are the same as the attribute's name for an attribute, and the class name for a class:
    
```    
[sql][28]>>> for row in session.query(User, User.name).all():
...    print(row.User, row.name)
 ed
 wendy
 mary
 fred
```

You can control the names of individual column expressions using the `[label()`][36] construct, which is available from any `[ColumnElement`][37]-derived object, as well as any class attribute which is mapped to one (such as `User.name`):
    
```    
[sql][28]>>> for row in session.query(User.name.label('name_label')).all():
...    print(row.name_label)
ed
wendy
mary
fred
```

The name given to a full entity such as `User`, assuming that multiple entities are present in the call to `[query()`][34], can be controlled using `[aliased()`][38] :
    
```    
>>> from sqlalchemy.orm import aliased
>>> user_alias = aliased(User, name='user_alias')

[sql][28]>>> for row in session.query(user_alias, user_alias.name).all():
...    print(row.user_alias)
```    

Basic operations with `[Query`][27] include issuing LIMIT and OFFSET, most conveniently using Python array slices and typically in conjunction with ORDER BY:
    
```    
[sql][28]>>> for u in session.query(User).order_by(User.id)[1:3]:
...    print(u)
```    
    
and filtering results, which is accomplished either with `[filter_by()`][39], which uses keyword arguments:
    
```    
[sql][28]>>> for name, in session.query(User.name).
...             filter_by(fullname='Ed Jones'):
...    print(name)
ed
```

…or `[filter()`][40], which uses more flexible SQL expression language constructs. These allow you to use regular Python operators with the class-level attributes on your mapped class:
    
```    
[sql][28]>>> for name, in session.query(User.name).
...             filter(User.fullname=='Ed Jones'):
...    print(name)
ed
```

The `[Query`][27] object is fully **generative**, meaning that most method calls return a new `[Query`][27] object upon which further criteria may be added. For example, to query for users named "ed" with a full name of "Ed Jones", you can call `[filter()`][40] twice, which joins criteria using `AND`:
    
```    
[sql][28]>>> for user in session.query(User).
...          filter(User.name=='ed').
...          filter(User.fullname=='Ed Jones'):
...    print(user)
```    
