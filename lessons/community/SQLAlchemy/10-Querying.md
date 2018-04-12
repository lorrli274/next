A [`Query`](http://docs.sqlalchemy.org/query.html#sqlalchemy.orm.query.Query "sqlalchemy.orm.query.Query") object is created using the [`query()`](http://docs.sqlalchemy.org/session_api.html#sqlalchemy.orm.session.Session.query "sqlalchemy.orm.session.Session.query") method on [`Session`](http://docs.sqlalchemy.org/session_api.html#sqlalchemy.orm.session.Session "sqlalchemy.orm.session.Session"). This function takes a variable number of arguments, which can be any combination of classes and class-instrumented descriptors. Below, we indicate a [`Query`](http://docs.sqlalchemy.org/query.html#sqlalchemy.orm.query.Query "sqlalchemy.orm.query.Query") which loads `User` instances. When evaluated in an iterative context, the list of `User` objects present is returned:
    
```python    
>>> for instance in session.query(User).order_by(User.id):
...     print(instance.name, instance.fullname)
ed Ed Jones
wendy Wendy Williams
mary Mary Contrary
fred Fred Flinstone
```

The [`Query`](http://docs.sqlalchemy.org/query.html#sqlalchemy.orm.query.Query "sqlalchemy.orm.query.Query") also accepts ORM-instrumented descriptors as arguments. Any time multiple class entities or column-based entities are expressed as arguments to the [`query()`](http://docs.sqlalchemy.org/session_api.html#sqlalchemy.orm.session.Session.query "sqlalchemy.orm.session.Session.query") function, the return result is expressed as tuples:
    
```python    
>>> for name, fullname in session.query(User.name, User.fullname):
...     print(name, fullname)
ed Ed Jones
wendy Wendy Williams
mary Mary Contrary
fred Fred Flinstone
```

The tuples returned by [`Query`](http://docs.sqlalchemy.org/query.html#sqlalchemy.orm.query.Query "sqlalchemy.orm.query.Query") are named tuples, supplied by the [`KeyedTuple`](http://docs.sqlalchemy.org/query.html#sqlalchemy.util.KeyedTuple "sqlalchemy.util.KeyedTuple") class, and can be treated much like an ordinary Python object. The names are the same as the attribute's name for an attribute, and the class name for a class:
    
```python    
>>> for row in session.query(User, User.name).all():
...    print(row.User, row.name)
<User(name='ed', fullname='Ed Jones', password='f8s7ccs')> ed
<User(name='wendy', fullname='Wendy Williams', password='foobar')> wendy
<User(name='mary', fullname='Mary Contrary', password='xxg527')> mary
<User(name='fred', fullname='Fred Flinstone', password='blah')> fred
```

You can control the names of individual column expressions using the [`label()`](http://docs.sqlalchemy.org/core/sqlelement.html#sqlalchemy.sql.expression.ColumnElement.label "sqlalchemy.sql.expression.ColumnElement.label") construct, which is available from any [`ColumnElement`](http://docs.sqlalchemy.org/core/sqlelement.html#sqlalchemy.sql.expression.ColumnElement "sqlalchemy.sql.expression.ColumnElement")-derived object, as well as any class attribute which is mapped to one (such as `User.name`):
    
```python    
>>> for row in session.query(User.name.label('name_label')).all():
...    print(row.name_label)
ed
wendy
mary
fred
```

The name given to a full entity such as `User`, assuming that multiple entities are present in the call to [`query()`](http://docs.sqlalchemy.org/session_api.html#sqlalchemy.orm.session.Session.query "sqlalchemy.orm.session.Session.query"), can be controlled using [`aliased()`](http://docs.sqlalchemy.org/query.html#sqlalchemy.orm.aliased "sqlalchemy.orm.aliased") :
    
```python    
>>> from sqlalchemy.orm import aliased
>>> user_alias = aliased(User, name='user_alias')

>>> for row in session.query(user_alias, user_alias.name).all():
...    print(row.user_alias)
<User(name='ed', fullname='Ed Jones', password='f8s7ccs')>
<User(name='wendy', fullname='Wendy Williams', password='foobar')>
<User(name='mary', fullname='Mary Contrary', password='xxg527')>
<User(name='fred', fullname='Fred Flinstone', password='blah')>
```    

Basic operations with [`Query`](http://docs.sqlalchemy.org/query.html#sqlalchemy.orm.query.Query "sqlalchemy.orm.query.Query") include issuing LIMIT and OFFSET, most conveniently using Python array slices and typically in conjunction with ORDER BY:
    
```python    
>>> for u in session.query(User).order_by(User.id)[1:3]:
...    print(u)
<User(name='wendy', fullname='Wendy Williams', password='foobar')>
<User(name='mary', fullname='Mary Contrary', password='xxg527')>
```    
    
and filtering results, which is accomplished either with [`filter_by()`](http://docs.sqlalchemy.org/query.html#sqlalchemy.orm.query.Query.filter_by "sqlalchemy.orm.query.Query.filter_by"), which uses keyword arguments:
    
```python    
>>> for name, in session.query(User.name).
...             filter_by(fullname='Ed Jones'):
...    print(name)
ed
```

…or [`filter()`](http://docs.sqlalchemy.org/query.html#sqlalchemy.orm.query.Query.filter "sqlalchemy.orm.query.Query.filter"), which uses more flexible SQL expression language constructs. These allow you to use regular Python operators with the class-level attributes on your mapped class:
    
```python    
>>> for name, in session.query(User.name).
...             filter(User.fullname=='Ed Jones'):
...    print(name)
ed
```

The [`Query`](http://docs.sqlalchemy.org/query.html#sqlalchemy.orm.query.Query "sqlalchemy.orm.query.Query") object is fully **generative**, meaning that most method calls return a new [`Query`](http://docs.sqlalchemy.org/query.html#sqlalchemy.orm.query.Query "sqlalchemy.orm.query.Query") object upon which further criteria may be added. For example, to query for users named "ed" with a full name of "Ed Jones", you can call [`filter()`](http://docs.sqlalchemy.org/query.html#sqlalchemy.orm.query.Query.filter "sqlalchemy.orm.query.Query.filter") twice, which joins criteria using `AND`:
    
```python    
>>> for user in session.query(User).\
...          filter(User.name=='ed').\
...          filter(User.fullname=='Ed Jones'):
...    print(user)
<User(name='ed', fullname='Ed Jones', password='f8s7ccs')>
```    
