New `[Decimal.as_integer_ratio()`][158] method that returns a pair `(n, d)` of integers that represent the given `[Decimal`][159] instance as a fraction, in lowest terms and with a positive denominator:
    
    
    >>> Decimal('-3.14').as_integer_ratio()
    (-157, 50)
    

(Contributed by Stefan Krah amd Mark Dickinson in [bpo-25928][160].)
