The other automatic eager loading function is more well known and is called `[orm.joinedload()`][88]. This style of loading emits a JOIN, by default a LEFT OUTER JOIN, so that the lead object as well as the related object or collection is loaded in one step. We illustrate loading the same `addresses` collection in this way - note that even though the `User.addresses` collection on `jack` is actually populated right now, the query will emit the extra join regardless:
    
```    
>>> from sqlalchemy.orm import joinedload

[sql][28]>>> jack = session.query(User).
...                        options(joinedload(User.addresses)).
...                        filter_by(name='jack').one()
>>> jack


>>> jack.addresses
[, ]
```

Note that even though the OUTER JOIN resulted in two rows, we still only got one instance of `User` back. This is because `[Query`][27] applies a "uniquing" strategy, based on object identity, to the returned entities. This is specifically so that joined eager loading can be applied without affecting the query results.

While `[joinedload()`][88] has been around for a long time, `[subqueryload()`][87] is a newer form of eager loading. `[subqueryload()`][87] tends to be more appropriate for loading related collections while `[joinedload()`][88] tends to be better suited for many-to-one relationships, due to the fact that only one row is loaded for both the lead and the related object.

`joinedload()` is not a replacement for `join()`

The join created by `[joinedload()`][88] is anonymously aliased such that it **does not affect the query results**. An `[Query.order_by()`][58] or `[Query.filter()`][40] call **cannot** reference these aliased tables - so-called "user space" joins are constructed using `[Query.join()`][76]. The rationale for this is that `[joinedload()`][88] is only applied in order to affect how related objects or collections are loaded as an optimizing detail - it can be added or removed with no impact on actual results. See the section [The Zen of Joined Eager Loading][89] for a detailed description of how this is used.
