The new [`Collection`](https://docs.python.org/3/library/collections.abc.html#collections.abc.Collection) abstract base class has been added to represent sized iterable container classes. (Contributed by Ivan Levkivskyi, docs by Neil Girdhar in [bpo-27598][134].)

The new [`Reversible`](https://docs.python.org/3/library/collections.abc.html#collections.abc.Reversible) abstract base class represents iterable classes that also provide the `[__reversed__()`][136] method. (Contributed by Ivan Levkivskyi in [bpo-25987][137].)

The new [`AsyncGenerator`](https://docs.python.org/3/library/collections.abc.html#collections.abc.AsyncGenerator) abstract base class represents asynchronous generators. (Contributed by Yury Selivanov in [bpo-28720][139].)

The [`namedtuple()`](https://docs.python.org/3/library/collections.html#collections.namedtuple) function now accepts an optional keyword argument _module_, which, when specified, is used for the `__module__` attribute of the returned named tuple class. (Contributed by Raymond Hettinger in [bpo-17941][141].)

The _verbose_ and _rename_ arguments for [`namedtuple()`](https://docs.python.org/3/library/collections.html#collections.namedtuple) are now keyword-only. (Contributed by Raymond Hettinger in [bpo-25628][142].)

Recursive [`collections.deque`](https://docs.python.org/3/library/collections.html#collections.deque) instances can now be pickled. (Contributed by Serhiy Storchaka in [bpo-26482][144].)
