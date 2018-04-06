In this case we'd like to indicate that `User.addresses` should load eagerly. A good choice for loading a set of objects as well as their related collections is the `[orm.subqueryload()`][87] option, which emits a second SELECT statement that fully loads the collections associated with the results just loaded. The name "subquery" originates from the fact that the SELECT statement constructed directly via the `[Query`][27] is re-used, embedded as a subquery into a SELECT against the related table. This is a little elaborate but very easy to use:
    
```    
>>> from sqlalchemy.orm import subqueryload
[sql][28]>>> jack = session.query(User).
...                 options(subqueryload(User.addresses)).
...                 filter_by(name='jack').one()
>>> jack


>>> jack.addresses
[, ]
```
