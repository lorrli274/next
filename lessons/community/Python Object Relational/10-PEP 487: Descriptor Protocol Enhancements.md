**[PEP 487**][43] extends the descriptor protocol to include the new optional `[__set_name__()`][44] method. Whenever a new class is defined, the new method will be called on all descriptors included in the definition, providing them with a reference to the class being defined and the name given to the descriptor within the class namespace. In other words, instances of descriptors can now know the attribute name of the descriptor in the owner class:
    
    
    class IntField:
        def __get__(self, instance, owner):
            return instance.__dict__[self.name]
    
        def __set__(self, instance, value):
            if not isinstance(value, int):
                raise ValueError(f'expecting integer in {self.name}')
            instance.__dict__[self.name] = value
    
        # this is the new initializer:
        def __set_name__(self, owner, name):
            self.name = name
    
    class Model:
        int_field = IntField()
 
