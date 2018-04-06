With our `User` class constructed via the Declarative system, we have defined information about our table, known as table metadata. The object used by SQLAlchemy to represent this information for a specific table is called the [`Table`](http://docs.sqlalchemy.org/core/metadata.html#sqlalchemy.schema.Table "sqlalchemy.schema.Table") object, and here Declarative has made one for us. We can see this object by inspecting the `__table__` attribute:
    
```sql    
>>> User.__table__ 
Table('users', MetaData(bind=None),
            Column('id', Integer(), table=, primary_key=True, nullable=False),
            Column('name', String(), table=),
            Column('fullname', String(), table=),
            Column('password', String(), table=), schema=None)
```

When we declared our class, Declarative used a Python metaclass in order to perform additional activities once the class declaration was complete; within this phase, it then created a [`Table`](http://docs.sqlalchemy.org/core/metadata.html#sqlalchemy.schema.Table "sqlalchemy.schema.Table") object according to our specifications, and associated it with the class by constructing a [`Mapper`](http://docs.sqlalchemy.org/mapping_api.html#sqlalchemy.orm.mapper.Mapper "sqlalchemy.orm.mapper.Mapper") object. This object is a behind-the-scenes object we normally don't need to deal with directly (though it can provide plenty of information about our mapping when we need it).

The [`Table`](http://docs.sqlalchemy.org/core/metadata.html#sqlalchemy.schema.Table "sqlalchemy.schema.Table") object is a member of a larger collection known as [`MetaData`](http://docs.sqlalchemy.org/core/metadata.html#sqlalchemy.schema.MetaData "sqlalchemy.schema.MetaData"). When using Declarative, this object is available using the `.metadata` attribute of our declarative base class.

The [`MetaData`][17] is a registry which includes the ability to emit a limited set of schema generation commands to the database. As our SQLite database does not actually have a `users` table present, we can use `[MetaData`](http://docs.sqlalchemy.org/core/metadata.html#sqlalchemy.schema.MetaData "sqlalchemy.schema.MetaData") to issue CREATE TABLE statements to the database for all tables that don't yet exist. Below, we call the `[MetaData.create_all()`](http://docs.sqlalchemy.org/core/metadata.html#sqlalchemy.schema.MetaData.create_all "sqlalchemy.schema.MetaData.create_all") method, passing in our `[Engine`](http://docs.sqlalchemy.org/core/connections.html#sqlalchemy.engine.Engine "sqlalchemy.engine.Engine") as a source of database connectivity. We will see that special commands are first emitted to check for the presence of the `users` table, and following that the actual `CREATE TABLE` statement:
    
```sql    
>>> Base.metadata.create_all(engine)
SELECT ...
PRAGMA table_info("users")
()
CREATE TABLE users (
    id INTEGER NOT NULL, name VARCHAR,
    fullname VARCHAR,
    password VARCHAR,
    PRIMARY KEY (id)
)
()
COMMIT
```

Minimal Table Descriptions vs. Full Descriptions

Users familiar with the syntax of CREATE TABLE may notice that the VARCHAR columns were generated without a length; on SQLite and PostgreSQL, this is a valid datatype, but on others, it's not allowed. So if running this tutorial on one of those databases, and you wish to use SQLAlchemy to issue CREATE TABLE, a "length" may be provided to the `[String`](http://docs.sqlalchemy.org/core/type_basics.html#sqlalchemy.types.String "sqlalchemy.types.String") type as below:

```sql
Column(String(50))
```

The length field on `[String`](http://docs.sqlalchemy.org/core/type_basics.html#sqlalchemy.types.String "sqlalchemy.types.String"), as well as similar precision/scale fields available on `[Integer`](http://docs.sqlalchemy.org/core/type_basics.html#sqlalchemy.types.Integer "sqlalchemy.types.Integer"), `[Numeric`](http://docs.sqlalchemy.org/core/type_basics.html#sqlalchemy.types.Numeric "sqlalchemy.types.Numeric"), etc. are not referenced by SQLAlchemy other than when creating tables.

Additionally, Firebird and Oracle require sequences to generate new primary key identifiers, and SQLAlchemy doesn't generate or assume these without being instructed. For that, you use the `[Sequence`](http://docs.sqlalchemy.org/core/defaults.html#sqlalchemy.schema.Sequence "sqlalchemy.schema.Sequence") construct:
    
```sql    
from sqlalchemy import Sequence
Column(Integer, Sequence('user_id_seq'), primary_key=True)
```

A full, foolproof `[Table`](http://docs.sqlalchemy.org/core/metadata.html#sqlalchemy.schema.Table "sqlalchemy.schema.Table") generated via our declarative mapping is therefore:
    
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

We include this more verbose table definition separately to highlight the difference between a minimal construct geared primarily towards in-Python usage only, versus one that will be used to emit CREATE TABLE statements on a particular set of backends with more stringent requirements.
