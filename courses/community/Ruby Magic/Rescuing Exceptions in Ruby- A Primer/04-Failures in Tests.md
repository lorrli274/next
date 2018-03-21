When Exception is rescued, using `rescue Exception => e`, other things beside your application could break. The test suite could actually be hiding some errors.

In minitest and RSpec assertions that fail will raise an exception to inform you about the failed assertion, failing the test. When they do, they raise their own custom exceptions, subclassed from Exception.

If Exception is rescued in a test or in the application code, it could be silencing an assertion failure.

```ruby    
# RSpec example
def foo(bar)
  bar.baz
rescue Exception => e
  puts "This test should actually fail"
  # Failure/Error: bar.baz
  #    received unexpected message :baz with (no args)
end

describe "#foo" do
  it "hides an 'unexpected message' exception" do
    bar = double(to_s: "")
    foo(bar)
  end
end
```
