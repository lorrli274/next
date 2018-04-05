With mappings complete, let's now create and inspect a `User` object:
    
```    
>>> ed_user = User(name='ed', fullname='Ed Jones', password='edspassword')
>>> ed_user.name
'ed'
>>> ed_user.password
'edspassword'
>>> str(ed_user.id)
'None'
```

Even though we didn't specify it in the constructor, the `id` attribute still produces a value of `None` when we access it (as opposed to Python's usual behavior of raising `AttributeError` for an undefined attribute). SQLAlchemy's [instrumentation][14] normally produces this default value for column-mapped attributes when first accessed. For those attributes where we've actually assigned a value, the instrumentation system is tracking those assignments for use within an eventual INSERT statement to be emitted to the database.
