When using the ORM, the configurational process starts by describing the database tables we'll be dealing with, and then by defining our own classes which will be mapped to those tables. In modern SQLAlchemy, these two tasks are usually performed together, using a system known as [Declarative](http://docs.sqlalchemy.org/extensions/declarative/index.html), which allows us to create classes that include directives to describe the actual database table they will be mapped to.

Classes mapped using the Declarative system are defined in terms of a base class which maintains a catalog of classes and tables relative to that base - this is known as the **declarative base class**. Our application will usually have just one instance of this base in a commonly imported module. We create the base class using the [`declarative_base()`](http://docs.sqlalchemy.org/extensions/declarative/api.html#sqlalchemy.ext.declarative.declarative_base "sqlalchemy.ext.declarative.declarative_base") function, as follows:
    
```python    
>>> from sqlalchemy.ext.declarative import declarative_base

>>> Base = declarative_base()
```

Now that we have a "base", we can define any number of mapped classes in terms of it. We will start with just a single table called `users`, which will store records for the end-users using our application. A new class called `User` will be the class to which we map this table. Within the class, we define details about the table to which we'll be mapping, primarily the table name, and names and datatypes of columns:
    
```python    
>>> from sqlalchemy import Column, Integer, String
>>> class User(Base):
...     __tablename__ = 'users'
...
...     id = Column(Integer, primary_key=True)
...     name = Column(String)
...     fullname = Column(String)
...     password = Column(String)
...
...     def __repr__(self):
...        return "<User(name='%s', fullname='%s', password='%s')>" % (
...                             self.name, self.fullname, self.password)
```

A class using Declarative at a minimum needs a `__tablename__` attribute, and at least one [`Column`](http://docs.sqlalchemy.org/core/metadata.html#sqlalchemy.schema.Column "sqlalchemy.schema.Column") which is part of a primary key. SQLAlchemy never makes any assumptions by itself about the table to which a class refers, including that it has no built-in conventions for names, datatypes, or constraints. But this doesn't mean boilerplate is required; instead, you're encouraged to create your own automated conventions using helper functions and mixin classes, which is described in detail at [Mixin and Custom Base Classes](http://docs.sqlalchemy.org/extensions/declarative/mixins.html#declarative-mixins).

>Tip:
The [`User`] class defines a [`__repr__()`] method, but note that is optional; we only implement it in this tutorial so that our examples show nicely formatted User objects.

When our class is constructed, Declarative replaces all the [`Column`](http://docs.sqlalchemy.org/core/metadata.html#sqlalchemy.schema.Column "sqlalchemy.schema.Column") objects with special Python accessors known as [descriptors](http://docs.sqlalchemy.org/glossary.html#term-descriptors); this is a process known as [instrumentation](http://docs.sqlalchemy.org/glossary.html#term-instrumentation). The "instrumented" mapped class will provide us with the means to refer to our table in a SQL context as well as to persist and load the values of columns from the database.

Outside of what the mapping process does to our class, the class remains otherwise mostly a normal Python class, to which we can define any number of ordinary attributes and methods needed by our application.
