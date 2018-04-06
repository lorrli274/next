The `[datetime`][61] and `[time`][62] classes have the new `fold` attribute used to disambiguate local time when necessary. Many functions in the `[datetime`][10] have been updated to support local time disambiguation. See [Local Time Disambiguation][11] section for more information. (Contributed by Alexander Belopolsky in [bpo-24773][150].)

The `[datetime.strftime()`][151] and `[date.strftime()`][152] methods now support ISO 8601 date directives `%G`, `%u` and `%V`. (Contributed by Ashley Anderson in [bpo-12006][153].)

The `[datetime.isoformat()`][154] function now accepts an optional _timespec_ argument that specifies the number of additional components of the time value to include. (Contributed by Alessandro Cucci and Alexander Belopolsky in [bpo-19475][155].)

The `[datetime.combine()`][156] now accepts an optional _tzinfo_ argument. (Contributed by Alexander Belopolsky in [bpo-27661][157].)
