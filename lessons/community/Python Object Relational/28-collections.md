The new `[Collection`][133] abstract base class has been added to represent sized iterable container classes. (Contributed by Ivan Levkivskyi, docs by Neil Girdhar in [bpo-27598][134].)

The new `[Reversible`][135] abstract base class represents iterable classes that also provide the `[__reversed__()`][136] method. (Contributed by Ivan Levkivskyi in [bpo-25987][137].)

The new `[AsyncGenerator`][138] abstract base class represents asynchronous generators. (Contributed by Yury Selivanov in [bpo-28720][139].)

The `[namedtuple()`][140] function now accepts an optional keyword argument _module_, which, when specified, is used for the `__module__` attribute of the returned named tuple class. (Contributed by Raymond Hettinger in [bpo-17941][141].)

The _verbose_ and _rename_ arguments for `[namedtuple()`][140] are now keyword-only. (Contributed by Raymond Hettinger in [bpo-25628][142].)

Recursive `[collections.deque`][143] instances can now be pickled. (Contributed by Serhiy Storchaka in [bpo-26482][144].)
