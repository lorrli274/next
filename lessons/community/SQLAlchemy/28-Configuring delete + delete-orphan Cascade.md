We will configure **cascade** options on the `User.addresses` relationship to change the behavior. While SQLAlchemy allows you to add new attributes and relationships to mappings at any point in time, in this case the existing relationship needs to be removed, so we need to tear down the mappings completely and start again - we'll close the [`Session`](http://docs.sqlalchemy.org/session_api.html#sqlalchemy.orm.session.Session "sqlalchemy.orm.session.Session"):
    
```python    
>>> session.close()
ROLLBACK
```

and use a new [`declarative_base()`](http://docs.sqlalchemy.org/extensions/declarative/api.html#sqlalchemy.ext.declarative.declarative_base "sqlalchemy.ext.declarative.declarative_base"):
    
```python    
>>> Base = declarative_base()
```

Next we'll declare the `User` class, adding in the `addresses` relationship including the cascade configuration (we'll leave the constructor out too):
    
```python    
>>> class User(Base):
...     __tablename__ = 'users'
...
...     id = Column(Integer, primary_key=True)
...     name = Column(String)
...     fullname = Column(String)
...     password = Column(String)
...
...     addresses = relationship("Address", back_populates='user',
...                     cascade="all, delete, delete-orphan")
...
...     def __repr__(self):
...        return "<User(name='%s', fullname='%s', password='%s')>" % (
...                                self.name, self.fullname, self.password)
```

Then we recreate `Address`, noting that in this case we've created the `Address.user` relationship via the `User` class already:
    
```python    
>>> class Address(Base):
...     __tablename__ = 'addresses'
...     id = Column(Integer, primary_key=True)
...     email_address = Column(String, nullable=False)
...     user_id = Column(Integer, ForeignKey('users.id'))
...     user = relationship("User", back_populates="addresses")
...
...     def __repr__(self):
...         return "" % self.email_address
```

Then we recreate `Address`, noting that in this case we’ve created the `Address.user` relationship via the User class already:

```python
>>> class Address(Base):
...     __tablename__ = 'addresses'
...     id = Column(Integer, primary_key=True)
...     email_address = Column(String, nullable=False)
...     user_id = Column(Integer, ForeignKey('users.id'))
...     user = relationship("User", back_populates="addresses")
...
...     def __repr__(self):
...         return "<Address(email_address='%s')>" % self.email_address
```

Now when we load the user `jack` (below using [`get()`](http://docs.sqlalchemy.org/query.html#sqlalchemy.orm.query.Query.get "sqlalchemy.orm.query.Query.get"), which loads by primary key), removing an address from the corresponding `addresses` collection will result in that `Address` being deleted:
    
```python    
# load Jack by primary key
>>> jack = session.query(User).get(5)

# remove one Address (lazy load fires off)
>>> del jack.addresses[1]

# only one address remains
>>> session.query(Address).filter(
...     Address.email_address.in_(['jack@google.com', 'j25@yahoo.com'])
... ).count()
1
```

Deleting Jack will delete both Jack and the remaining `Address` associated with the user:
    
```python    
>>> session.delete(jack)

>>> session.query(User).filter_by(name='jack').count()
0

>>> session.query(Address).filter(
...    Address.email_address.in_(['jack@google.com', 'j25@yahoo.com'])
... ).count()
0
```

info> More on Cascades:
Further detail on configuration of cascades is at [Cascades]. The cascade functionality can also integrate smoothly with the ON DELETE CASCADE functionality of the relational database.
