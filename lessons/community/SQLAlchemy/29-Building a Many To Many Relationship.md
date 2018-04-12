We're moving into the bonus round here, but lets show off a **many-to-many** relationship. We'll sneak in some other features too, just to take a tour. We'll make our application a blog application, where users can write `BlogPost` items, which have `Keyword` items associated with them.

For a plain many-to-many, we need to create an un-mapped [`Table`](http://docs.sqlalchemy.org/core/metadata.html#sqlalchemy.schema.Table "sqlalchemy.schema.Table") construct to serve as the association table. This looks like the following:
    
```python    
>>> from sqlalchemy import Table, Text
>>> # association table
>>> post_keywords = Table('post_keywords', Base.metadata,
...     Column('post_id', ForeignKey('posts.id'), primary_key=True),
...     Column('keyword_id', ForeignKey('keywords.id'), primary_key=True)
... )
```

Above, we can see declaring a [`Table`](http://docs.sqlalchemy.org/core/metadata.html#sqlalchemy.schema.Table "sqlalchemy.schema.Table") directly is a little different than declaring a mapped class. [`Table`](http://docs.sqlalchemy.org/core/metadata.html#sqlalchemy.schema.Table "sqlalchemy.schema.Table") is a constructor function, so each individual [`Column`](http://docs.sqlalchemy.org/core/metadata.html#sqlalchemy.schema.Column "sqlalchemy.schema.Column") argument is separated by a comma. The [`Column`](http://docs.sqlalchemy.org/core/metadata.html#sqlalchemy.schema.Column "sqlalchemy.schema.Column") object is also given its name explicitly, rather than it being taken from an assigned attribute name.

Next we define `BlogPost` and `Keyword`, using complementary [`relationship()`](http://docs.sqlalchemy.org/relationship_api.html#sqlalchemy.orm.relationship "sqlalchemy.orm.relationship") constructs, each referring to the `post_keywords` table as an association table:
    
```python    
>>> class BlogPost(Base):
...     __tablename__ = 'posts'
...
...     id = Column(Integer, primary_key=True)
...     user_id = Column(Integer, ForeignKey('users.id'))
...     headline = Column(String(255), nullable=False)
...     body = Column(Text)
...
...     # many to many BlogPost<->Keyword
...     keywords = relationship('Keyword',
...                             secondary=post_keywords,
...                             back_populates='posts')
...
...     def __init__(self, headline, body, author):
...         self.author = author
...         self.headline = headline
...         self.body = body
...
...     def __repr__(self):
...         return "BlogPost(%r, %r, %r)" % (self.headline, self.body, self.author)


>>> class Keyword(Base):
...     __tablename__ = 'keywords'
...
...     id = Column(Integer, primary_key=True)
...     keyword = Column(String(50), nullable=False, unique=True)
...     posts = relationship('BlogPost',
...                          secondary=post_keywords,
...                          back_populates='keywords')
...
...     def __init__(self, keyword):
...         self.keyword = keyword
```

info> Note: The above class declarations illustrate explicit `__init__()` methods. Remember, when using Declarative, it's optional!

Above, the many-to-many relationship is `BlogPost.keywords`. The defining feature of a many-to-many relationship is the `secondary` keyword argument which references a [`Table`](http://docs.sqlalchemy.org/core/metadata.html#sqlalchemy.schema.Table "sqlalchemy.schema.Table") object representing the association table. This table only contains columns which reference the two sides of the relationship; if it has _any_ other columns, such as its own primary key, or foreign keys to other tables, SQLAlchemy requires a different usage pattern called the "association object", described at [Association Object](http://docs.sqlalchemy.org/basic_relationships.html#association-pattern).

We would also like our `BlogPost` class to have an `author` field. We will add this as another bidirectional relationship, except one issue we'll have is that a single user might have lots of blog posts. When we access `User.posts`, we'd like to be able to filter results further so as not to load the entire collection. For this we use a setting accepted by [`relationship()`](http://docs.sqlalchemy.org/relationship_api.html#sqlalchemy.orm.relationship "sqlalchemy.orm.relationship") called `lazy='dynamic'`, which configures an alternate **loader strategy** on the attribute:
    
```python    
>>> BlogPost.author = relationship(User, back_populates="posts")
>>> User.posts = relationship(BlogPost, back_populates="author", lazy="dynamic")
```

Create new tables:
    
```python    
>>> Base.metadata.create_all(engine)
```    

Usage is not too different from what we've been doing. Let's give Wendy some blog posts:
    
```python    
>>> wendy = session.query(User).\
...                 filter_by(name='wendy').\
...                 one()
>>> post = BlogPost("Wendy's Blog Post", "This is a test", wendy)
>>> session.add(post)
```

We're storing keywords uniquely in the database, but we know that we don't have any yet, so we can just create them:
    
```python    
>>> post.keywords.append(Keyword('wendy'))
>>> post.keywords.append(Keyword('firstpost'))
```

We can now look up all blog posts with the keyword 'firstpost'. We'll use the `any` operator to locate "blog posts where any of its keywords has the keyword string 'firstpost'":
    
```python    
>>> session.query(BlogPost).\
...             filter(BlogPost.keywords.any(keyword='firstpost')).\
...             all()
[BlogPost("Wendy's Blog Post", 'This is a test', <User(name='wendy', fullname='Wendy Williams', password='foobar')>)]
```

If we want to look up posts owned by the user `wendy`, we can tell the query to narrow down to that `User` object as a parent:
    
```python    
>>> session.query(BlogPost).\
...             filter(BlogPost.author==wendy).\
...             filter(BlogPost.keywords.any(keyword='firstpost')).\
...             all()
[BlogPost("Wendy's Blog Post", 'This is a test', <User(name='wendy', fullname='Wendy Williams', password='foobar')>)]
```

Or we can use Wendy's own `posts` relationship, which is a "dynamic" relationship, to query straight from there:
    
```python    
>>> wendy.posts.\
...         filter(BlogPost.keywords.any(keyword='firstpost')).\
...         all()
[BlogPost("Wendy's Blog Post", 'This is a test', <User(name='wendy', fullname='Wendy Williams', password='foobar')>)]
```    
