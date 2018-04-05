The [dict][74] type now uses a "compact" representation based on [a proposal by Raymond Hettinger][75] which was [first implemented by PyPy][76]. The memory usage of the new `[dict()`][77] is between 20% and 25% smaller compared to Python 3.5.

The order-preserving aspect of this new implementation is considered an implementation detail and should not be relied upon (this may change in the future, but it is desired to have this new dict implementation in the language for a few releases before changing the language spec to mandate order-preserving semantics for all current and future Python implementations; this also helps preserve backwards-compatibility with older versions of the language where random iteration order is still in effect, e.g. Python 3.5).

(Contributed by INADA Naoki in [bpo-27350][78]. Idea [originally suggested by Raymond Hettinger][75].)
