Let's consider how a second table, related to `User`, can be mapped and queried. Users in our system can store any number of email addresses associated with their username. This implies a basic one to many association from the `users` to a new table which stores email addresses, which we will call `addresses`. Using declarative, we define this table along with its mapped class, `Address`:
    
```    
>>> from sqlalchemy import ForeignKey
>>> from sqlalchemy.orm import relationship

>>> class Address(Base):
...     __tablename__ = 'addresses'
...     id = Column(Integer, primary_key=True)
...     email_address = Column(String, nullable=False)
...     user_id = Column(Integer, ForeignKey('users.id'))
...
...     user = relationship("User", back_populates="addresses")
...
...     def __repr__(self):
...         return "" % self.email_address

>>> User.addresses = relationship(
...     "Address", order_by=Address.id, back_populates="user")
```

The above class introduces the `[ForeignKey`][65] construct, which is a directive applied to `[Column`][11] that indicates that values in this column should be [constrained][66] to be values present in the named remote column. This is a core feature of relational databases, and is the "glue" that transforms an otherwise unconnected collection of tables to have rich overlapping relationships. The `[ForeignKey`][65] above expresses that values in the `addresses.user_id` column should be constrained to those values in the `users.id` column, i.e. its primary key.

A second directive, known as `[relationship()`][67], tells the ORM that the `Address` class itself should be linked to the `User` class, using the attribute `Address.user`. `[relationship()`][67] uses the foreign key relationships between the two tables to determine the nature of this linkage, determining that `Address.user` will be [many to one][68]. An additional `[relationship()`][67] directive is placed on the `User` mapped class under the attribute `User.addresses`. In both `[relationship()`][67] directives, the parameter `[relationship.back_populates`][69] is assigned to refer to the complementary attribute names; by doing so, each `[relationship()`][67] can make intelligent decision about the same relationship as expressed in reverse; on one side, `Address.user` refers to a `User` instance, and on the other side, `User.addresses` refers to a list of `Address` instances.

The reverse side of a many-to-one relationship is always [one to many][70]. A full catalog of available `[relationship()`][67] configurations is at [Basic Relationship Patterns][71].

The two complementing relationships `Address.user` and `User.addresses` are referred to as a [bidirectional relationship][72], and is a key feature of the SQLAlchemy ORM. The section [Linking Relationships with Backref][73] discusses the "backref" feature in detail.

Arguments to `[relationship()`][67] which concern the remote class can be specified using strings, assuming the Declarative system is in use. Once all mappings are complete, these strings are evaluated as Python expressions in order to produce the actual argument, in the above case the `User` class. The names which are allowed during this evaluation include, among other things, the names of all classes which have been created in terms of the declared base.

See the docstring for `[relationship()`][67] for more detail on argument style.

Did you know ?

* a FOREIGN KEY constraint in most (though not all) relational databases can only link to a primary key column, or a column that has a UNIQUE constraint.

* a FOREIGN KEY constraint that refers to a multiple column primary key, and itself has multiple columns, is known as a "composite foreign key". It can also reference a subset of those columns.

* FOREIGN KEY columns can automatically update themselves, in response to a change in the referenced column or row. This is known as the CASCADE _referential action_, and is a built in function of the relational database.

* FOREIGN KEY can refer to its own table. This is referred to as a "self-referential" foreign key.

* Read more about foreign keys at [Foreign Key - Wikipedia][74].

We'll need to create the `addresses` table in the database, so we will issue another CREATE from our metadata, which will skip over tables which have already been created:
    
```    
[sql][28]>>> Base.metadata.create_all(engine)
```    
