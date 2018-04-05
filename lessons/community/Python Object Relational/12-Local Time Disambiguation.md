In most world locations, there have been and will be times when local clocks are moved back. In those times, intervals are introduced in which local clocks show the same time twice in the same day. In these situations, the information displayed on a local clock (or stored in a Python datetime instance) is insufficient to identify a particular moment in time.

**[PEP 495**][60] adds the new _fold_ attribute to instances of `[datetime.datetime`][61] and `[datetime.time`][62] classes to differentiate between two moments in time for which local times are the same:
    
    
    >>> u0 = datetime(2016, 11, 6, 4, tzinfo=timezone.utc)
    >>> for i in range(4):
    ...     u = u0 + i*HOUR
    ...     t = u.astimezone(Eastern)
    ...     print(u.time(), 'UTC =', t.time(), t.tzname(), t.fold)
    ...
    04:00:00 UTC = 00:00:00 EDT 0
    05:00:00 UTC = 01:00:00 EDT 0
    06:00:00 UTC = 01:00:00 EST 1
    07:00:00 UTC = 02:00:00 EST 0
    

The values of the `[fold`][63] attribute have the value `0` for all instances except those that represent the second (chronologically) moment in time in an ambiguous case.

See also

**[PEP 495**][60] – Local Time Disambiguation
: PEP written by Alexander Belopolsky and Tim Peters, implementation by Alexander Belopolsky.
