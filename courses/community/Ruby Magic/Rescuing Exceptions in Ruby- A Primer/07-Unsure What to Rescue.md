As mentioned earlier, it's good to be specific in what errors to rescue.

When you're unsure what exceptions an operation can raise, rescuing [StandardError](http://ruby-doc.org/core-2.3.1/StandardError.html) can be a good place to start. Run your code in different scenarios and see what exceptions it raises.

```ruby    
begin
  File.open('/tmp/appsignal.log', 'a') { |f| f.write "Starting AppSignal" }
rescue => e
  puts e.inspect
end
#
```

Every time you come across a new exception, add specific rescue cases for those exceptions or its relevant parent class. It's better to be specific in what to rescue than to rescue too many exceptions.

```ruby
begin
  file = '/tmp/appsignal.log'
  File.open(file, 'a') { |f| f.write("AppSignal started!") }
rescue Errno::ENOENT => e
  puts "File or directory #{file} doesn't exist."
rescue Errno::EACCES => e
  puts "Cannot write to #{file}. No permissions."
end

# Or, using the parent error class
begin
  file = '/tmp/appsignal.log'
  File.open(file, 'a')
rescue SystemCallError => e
  puts "Error while writing to file #{file}."
  puts e
end
``` 
