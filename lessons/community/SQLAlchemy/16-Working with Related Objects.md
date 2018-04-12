Now when we create a `User`, a blank `addresses` collection will be present. Various collection types, such as sets and dictionaries, are possible here (see Customizing Collection Access for details), but by default, the collection is a Python list.

```python
>>> jack = User(name='jack', fullname='Jack Bean', password='gjffdd')
>>> jack.addresses
[]
```

We are free to add `Address` objects on our `User` object. In this case we just assign a full list directly:

```python
>>> jack.addresses = [
...                 Address(email_address='jack@google.com'),
...                 Address(email_address='j25@yahoo.com')]
```

When using a bidirectional relationship, elements added in one direction automatically become visible in the other direction. This behavior occurs based on attribute on-change events and is evaluated in Python, without using any SQL:

```python
>>> jack.addresses[1]
<Address(email_address='j25@yahoo.com')>

>>> jack.addresses[1].user
<User(name='jack', fullname='Jack Bean', password='gjffdd')>
```

Let’s add and commit `Jack Bean` to the database. `jack` as well as the two `Address` members in the corresponding `addresses` collection are both added to the session at once, using a process known as **cascading**:

```python
>>> session.add(jack)
>>> session.commit()
```

Querying for Jack, we get just Jack back. No SQL is yet issued for Jack’s addresses:

```python
>>> jack = session.query(User).\
... filter_by(name='jack').one()
>>> jack
<User(name='jack', fullname='Jack Bean', password='gjffdd')>
```

Let’s look at the `addresses` collection. Watch the SQL:

```python
>>> jack.addresses
[<Address(email_address='jack@google.com')>, <Address(email_address='j25@yahoo.com')>]
```

When we accessed the `addresses` collection, SQL was suddenly issued. This is an example of a lazy loading relationship. The `addresses` collection is now loaded and behaves just like an ordinary list. We’ll cover ways to optimize the loading of this collection in a bit.
