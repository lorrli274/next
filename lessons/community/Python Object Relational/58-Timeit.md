The new `[Timer.autorange()`][256] convenience method has been added to call `[Timer.timeit()`][257] repeatedly so that the total run time is greater or equal to 200 milliseconds. (Contributed by Steven D'Aprano in [bpo-6422][258].)

`[timeit`][259] now warns when there is substantial (4x) variance between best and worst times. (Contributed by Serhiy Storchaka in [bpo-23552][260].)
