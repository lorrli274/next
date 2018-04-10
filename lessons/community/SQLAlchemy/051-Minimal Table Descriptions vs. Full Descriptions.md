Users familiar with the syntax of `CREATE TABLE` may notice that the `VARCHAR` columns were generated without a length; on SQLite and PostgreSQL, this is a valid datatype, but on others, it's not allowed. So if running this course on one of those databases, and you wish to use SQLAlchemy to issue `CREATE TABLE`, a "length" may be provided to the [`String`](http://docs.sqlalchemy.org/core/type_basics.html#sqlalchemy.types.String "sqlalchemy.types.String") type as below:

```sql
Column(String(50))
```

The length field on [`String`](http://docs.sqlalchemy.org/core/type_basics.html#sqlalchemy.types.String "sqlalchemy.types.String"), as well as similar precision/scale fields available on [`Integer`](http://docs.sqlalchemy.org/core/type_basics.html#sqlalchemy.types.Integer "sqlalchemy.types.Integer"), [`Numeric`](http://docs.sqlalchemy.org/core/type_basics.html#sqlalchemy.types.Numeric "sqlalchemy.types.Numeric"), etc. are not referenced by SQLAlchemy other than when creating tables.

Additionally, Firebird and Oracle require sequences to generate new primary key identifiers, and SQLAlchemy doesn't generate or assume these without being instructed. For that, you use the [`Sequence`](http://docs.sqlalchemy.org/core/defaults.html#sqlalchemy.schema.Sequence "sqlalchemy.schema.Sequence") construct:
    
```sql    
from sqlalchemy import Sequence
Column(Integer, Sequence('user_id_seq'), primary_key=True)
```

A full, foolproof [`Table`](http://docs.sqlalchemy.org/core/metadata.html#sqlalchemy.schema.Table "sqlalchemy.schema.Table") generated via our declarative mapping is therefore:
    
```sql   
class User(Base):
    __tablename__ = 'users'
    id = Column(Integer, Sequence('user_id_seq'), primary_key=True)
    name = Column(String(50))
    fullname = Column(String(50))
    password = Column(String(12))

    def __repr__(self):
        return "" % (
                                self.name, self.fullname, self.password)
```

We include this more verbose table definition separately to highlight the difference between a minimal construct geared primarily towards in-Python usage only, versus one that will be used to emit `CREATE TABLE` statements on a particular set of backends with more stringent requirements.
