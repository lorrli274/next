Some code is meant to raise exceptions. In a test suite it's possible to simply silence the exception in order to have the test not fail when they are raised.

| ----- |
| 
    
    
    1
    2
    3
    4
    5

 | 
    
    
    def foo
      raise RuntimeError, "something went wrong"
    end
    
    foo rescue RuntimeError
    

 | 

However, this doesn't test if an exception was raised or not. When the exception is not raised, your test won't be able to tell if the behavior is still correct.

It's possible to assert if the exception is raised, and if not, which exception was.

| ----- |
| 
    
    
    1
    2
    3
    4
    5
    6
    7
    8
    9
    10
    11

 | 
    
    
    # expecting_exceptions_spec.rb
    # RSpec example
    def foo
      raise NotImplementedError, "foo method not implemented"
    end
    
    describe "#foo" do
      it "raises a RuntimeError" do
        expect { foo }.to raise_error(RuntimeError)
      end
    end
    

 | 

| ----- |
| 
    
    
    1
    2
    3
    4
    5
    6
    7
    8

 | 
    
    
    1) #foo raises a RuntimeError
       Failure/Error: expect { foo }.to raise_error(RuntimeError)
    
         expected RuntimeError, got # with backtrace:
           # ./expecting_exceptions_spec.rb:4:in `foo'
           # ./expecting_exceptions_spec.rb:9:in `block (3 levels) in '
           # ./expecting_exceptions_spec.rb:9:in `block (2 levels) in '
           # ./expecting_exceptions_spec.rb:9:in `block (2 levels) in '
    

 | 
