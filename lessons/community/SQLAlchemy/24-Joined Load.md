The other automatic eager loading function is more well known and is called [`orm.joinedload()`](http://docs.sqlalchemy.org/loading_relationships.html#sqlalchemy.orm.joinedload "sqlalchemy.orm.joinedload"). This style of loading emits a JOIN, by default a LEFT OUTER JOIN, so that the lead object as well as the related object or collection is loaded in one step. We illustrate loading the same `addresses` collection in this way - note that even though the `User.addresses` collection on `jack` is actually populated right now, the query will emit the extra join regardless:
    
```sql    
>>> from sqlalchemy.orm import joinedload

[sql][28]>>> jack = session.query(User).
...                        options(joinedload(User.addresses)).
...                        filter_by(name='jack').one()
>>> jack


>>> jack.addresses
[, ]
```

> Note: that even though the OUTER JOIN resulted in two rows, we still only got one instance of `User` back. This is because [`Query`](http://docs.sqlalchemy.org/query.html#sqlalchemy.orm.query.Query "sqlalchemy.orm.query.Query") applies a "uniquing" strategy, based on object identity, to the returned entities. This is specifically so that joined eager loading can be applied without affecting the query results.

While [`joinedload()`](http://docs.sqlalchemy.org/loading_relationships.html#sqlalchemy.orm.joinedload "sqlalchemy.orm.joinedload") has been around for a long time, [`subqueryload()`](http://docs.sqlalchemy.org/loading_relationships.html#sqlalchemy.orm.subqueryload "sqlalchemy.orm.subqueryload") is a newer form of eager loading. [`subqueryload()`](http://docs.sqlalchemy.org/loading_relationships.html#sqlalchemy.orm.subqueryload "sqlalchemy.orm.subqueryload") tends to be more appropriate for loading related collections while [`joinedload()`](http://docs.sqlalchemy.org/loading_relationships.html#sqlalchemy.orm.joinedload "sqlalchemy.orm.joinedload") tends to be better suited for many-to-one relationships, due to the fact that only one row is loaded for both the lead and the related object.

`joinedload()` is not a replacement for `join()`

The join created by [`joinedload()`](http://docs.sqlalchemy.org/loading_relationships.html#sqlalchemy.orm.joinedload "sqlalchemy.orm.joinedload") is anonymously aliased such that it **does not affect the query results**. An [`Query.order_by()`](http://docs.sqlalchemy.org/query.html#sqlalchemy.orm.query.Query.order_by "sqlalchemy.orm.query.Query.order_by") or [`Query.filter()`](http://docs.sqlalchemy.org/query.html#sqlalchemy.orm.query.Query.filter "sqlalchemy.orm.query.Query.filter") call **cannot** reference these aliased tables - so-called "user space" joins are constructed using [`Query.join()`](http://docs.sqlalchemy.org/query.html#sqlalchemy.orm.query.Query.join "sqlalchemy.orm.query.Query.join"). The rationale for this is that [`joinedload()`](http://docs.sqlalchemy.org/loading_relationships.html#sqlalchemy.orm.joinedload "sqlalchemy.orm.joinedload") is only applied in order to affect how related objects or collections are loaded as an optimizing detail - it can be added or removed with no impact on actual results. See the section [The Zen of Joined Eager Loading](http://docs.sqlalchemy.org/loading_relationships.html#zen-of-eager-loading) for a detailed description of how this is used.
