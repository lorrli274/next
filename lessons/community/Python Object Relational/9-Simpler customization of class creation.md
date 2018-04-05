It is now possible to customize subclass creation without using a metaclass. The new `__init_subclass__` classmethod will be called on the base class whenever a new subclass is created:
    
    
    class PluginBase:
        subclasses = []
    
        def __init_subclass__(cls, **kwargs):
            super().__init_subclass__(**kwargs)
            cls.subclasses.append(cls)
    
    class Plugin1(PluginBase):
        pass
    
    class Plugin2(PluginBase):
        pass
    

In order to allow zero-argument `[super()`][40] calls to work correctly from `[__init_subclass__()`][41] implementations, custom metaclasses must ensure that the new `__classcell__` namespace entry is propagated to `type.__new__` (as described in [Creating the class object][42]).
