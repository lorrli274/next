With our `User` class constructed via the Declarative system, we have defined information about our table, known as **table metadata**. The object used by SQLAlchemy to represent this information for a specific table is called the [`Table`](http://docs.sqlalchemy.org/core/metadata.html#sqlalchemy.schema.Table "sqlalchemy.schema.Table") object, and here Declarative has made one for us. We can see this object by inspecting the `__table__` attribute:
    
```python    
>>> User.__table__ 
Table('users', MetaData(bind=None),
            Column('id', Integer(), table=, primary_key=True, nullable=False),
            Column('name', String(), table=),
            Column('fullname', String(), table=),
            Column('password', String(), table=), schema=None)
```

When we declared our class, Declarative used a Python metaclass in order to perform additional activities once the class declaration was complete; within this phase, it then created a [`Table`](http://docs.sqlalchemy.org/core/metadata.html#sqlalchemy.schema.Table "sqlalchemy.schema.Table") object according to our specifications, and associated it with the class by constructing a [`Mapper`](http://docs.sqlalchemy.org/mapping_api.html#sqlalchemy.orm.mapper.Mapper "sqlalchemy.orm.mapper.Mapper") object. This object is a behind-the-scenes object we normally don't need to deal with directly (though it can provide plenty of information about our mapping when we need it).

The [`Table`](http://docs.sqlalchemy.org/core/metadata.html#sqlalchemy.schema.Table "sqlalchemy.schema.Table") object is a member of a larger collection known as [`MetaData`](http://docs.sqlalchemy.org/core/metadata.html#sqlalchemy.schema.MetaData "sqlalchemy.schema.MetaData"). When using Declarative, this object is available using the `.metadata` attribute of our declarative base class.

The [`MetaData`](http://docs.sqlalchemy.org/core/metadata.html#sqlalchemy.schema.MetaData "sqlalchemy.schema.MetaData") is a registry which includes the ability to emit a limited set of schema generation commands to the database. As our SQLite database does not actually have a `users` table present, we can use [`MetaData`](http://docs.sqlalchemy.org/core/metadata.html#sqlalchemy.schema.MetaData "sqlalchemy.schema.MetaData") to issue CREATE TABLE statements to the database for all tables that don't yet exist. Below, we call the [`MetaData.create_all()`](http://docs.sqlalchemy.org/core/metadata.html#sqlalchemy.schema.MetaData.create_all "sqlalchemy.schema.MetaData.create_all") method, passing in our [`Engine`](http://docs.sqlalchemy.org/core/connections.html#sqlalchemy.engine.Engine "sqlalchemy.engine.Engine") as a source of database connectivity. We will see that special commands are first emitted to check for the presence of the `users` table, and following that the actual `CREATE TABLE` statement:
    
```python    
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
