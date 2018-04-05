Literal strings can be used flexibly with `[Query`][27], by specifying their use with the `[text()`][57] construct, which is accepted by most applicable methods. For example, `[filter()`][40] and `[order_by()`][58]:
    
```    
>>> from sqlalchemy import text
[sql][28]>>> for user in session.query(User).
...             filter(text("id<224")).
...             order_by(text("id")).all():
...     print(user.name)
ed
wendy
mary
fred
```

Bind parameters can be specified with string-based SQL, using a colon. To specify the values, use the `[params()`][59] method:
    
```    
[sql][28]>>> session.query(User).filter(text("id<:value and name=:name")).
...     params(value=224, name='fred').order_by(User.id).one()
```    

To use an entirely string-based statement, a `[text()`][57] construct representing a complete statement can be passed to `[from_statement()`][60]. Without additional specifiers, the columns in the string SQL are matched to the model columns based on name, such as below where we use just an asterisk to represent loading all columns:
    
```    
[sql][28]>>> session.query(User).from_statement(
...                     text("SELECT * FROM users where name=:name")).
...                     params(name='ed').all()
[]
```

Matching columns on name works for simple cases but can become unwieldy when dealing with complex statements that contain duplicate column names or when using anonymized ORM constructs that don't easily match to specific names. Additionally, there is typing behavior present in our mapped columns that we might find necessary when handling result rows. For these cases, the `[text()`][57] construct allows us to link its textual SQL to Core or ORM-mapped column expressions positionally; we can achieve this by passing column expressions as positional arguments to the `[TextClause.columns()`][61] method:
    
```    
>>> stmt = text("SELECT name, id, fullname, password "
...             "FROM users where name=:name")
>>> stmt = stmt.columns(User.name, User.id, User.fullname, User.password)
[sql][28]>>> session.query(User).from_statement(stmt).params(name='ed').all()
[]
```
New in version 1.1: The `[TextClause.columns()`][61] method now accepts column expressions which will be matched positionally to a plain text SQL result set, eliminating the need for column names to match or even be unique in the SQL statement.

When selecting from a `[text()`][57] construct, the `[Query`][27] may still specify what columns and entities are to be returned; instead of `query(User)` we can also ask for the columns individually, as in any other case:
    
```    
>>> stmt = text("SELECT name, id FROM users where name=:name")
>>> stmt = stmt.columns(User.name, User.id)
[sql][28]>>> session.query(User.id, User.name).
...          from_statement(stmt).params(name='ed').all()
[(1, u'ed')]
```    