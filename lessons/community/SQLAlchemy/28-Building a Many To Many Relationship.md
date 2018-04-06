We're moving into the bonus round here, but lets show off a many-to-many relationship. We'll sneak in some other features too, just to take a tour. We'll make our application a blog application, where users can write `BlogPost` items, which have `Keyword` items associated with them.

For a plain many-to-many, we need to create an un-mapped `[Table`][15] construct to serve as the association table. This looks like the following:
    
```    
>>> from sqlalchemy import Table, Text
>>> # association table
>>> post_keywords = Table('post_keywords', Base.metadata,
...     Column('post_id', ForeignKey('posts.id'), primary_key=True),
...     Column('keyword_id', ForeignKey('keywords.id'), primary_key=True)
... )
```

Above, we can see declaring a `[Table`][15] directly is a little different than declaring a mapped class. `[Table`][15] is a constructor function, so each individual `[Column`][11] argument is separated by a comma. The `[Column`][11] object is also given its name explicitly, rather than it being taken from an assigned attribute name.

Next we define `BlogPost` and `Keyword`, using complementary `[relationship()`][67] constructs, each referring to the `post_keywords` table as an association table:
    
```    
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

Note

The above class declarations illustrate explicit `__init__()` methods. Remember, when using Declarative, it's optional!

Above, the many-to-many relationship is `BlogPost.keywords`. The defining feature of a many-to-many relationship is the `secondary` keyword argument which references a `[Table`][15] object representing the association table. This table only contains columns which reference the two sides of the relationship; if it has _any_ other columns, such as its own primary key, or foreign keys to other tables, SQLAlchemy requires a different usage pattern called the "association object", described at [Association Object][95].

We would also like our `BlogPost` class to have an `author` field. We will add this as another bidirectional relationship, except one issue we'll have is that a single user might have lots of blog posts. When we access `User.posts`, we'd like to be able to filter results further so as not to load the entire collection. For this we use a setting accepted by `[relationship()`][67] called `lazy='dynamic'`, which configures an alternate **loader strategy** on the attribute:
    
```    
>>> BlogPost.author = relationship(User, back_populates="posts")
>>> User.posts = relationship(BlogPost, back_populates="author", lazy="dynamic")
```

Create new tables:
    
```    
[sql][28]>>> Base.metadata.create_all(engine)
```    

Usage is not too different from what we've been doing. Let's give Wendy some blog posts:
    
```    
[sql][28]>>> wendy = session.query(User).
...                 filter_by(name='wendy').
...                 one()
>>> post = BlogPost("Wendy's Blog Post", "This is a test", wendy)
>>> session.add(post)
```

We're storing keywords uniquely in the database, but we know that we don't have any yet, so we can just create them:
    
```    
>>> post.keywords.append(Keyword('wendy'))
>>> post.keywords.append(Keyword('firstpost'))
```

We can now look up all blog posts with the keyword 'firstpost'. We'll use the `any` operator to locate "blog posts where any of its keywords has the keyword string 'firstpost'":
    
```    
[sql][28]>>> session.query(BlogPost).
...             filter(BlogPost.keywords.any(keyword='firstpost')).
...             all()
[BlogPost("Wendy's Blog Post", 'This is a test', )]
```

If we want to look up posts owned by the user `wendy`, we can tell the query to narrow down to that `User` object as a parent:
    
```    
[sql][28]>>> session.query(BlogPost).
...             filter(BlogPost.author==wendy).
...             filter(BlogPost.keywords.any(keyword='firstpost')).
...             all()
[BlogPost("Wendy's Blog Post", 'This is a test', )]
```

Or we can use Wendy's own `posts` relationship, which is a "dynamic" relationship, to query straight from there:
    
```    
[sql][28]>>> wendy.posts.
...         filter(BlogPost.keywords.any(keyword='firstpost')).
...         all()
[BlogPost("Wendy's Blog Post", 'This is a test', )]
```    
