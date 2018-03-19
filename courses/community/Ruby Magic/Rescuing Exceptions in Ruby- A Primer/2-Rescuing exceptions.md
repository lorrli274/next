By rescuing exceptions in Ruby you can prevent your application from crashing the moment something goes wrong. With a `begin .. rescue` block you can specify an alternative path for your application when an error occurs.

| ----- |
| 
    
    
    1
    2
    3
    4
    5

 | 
    
    
    begin
      File.read "config.yml"
    rescue
      puts "No config file found. Using defaults."
    end
    

 | 

It's also possible to specify which exceptions should be rescued. When specifying an exception class, all subclasses of this exception will also be captured.

| ----- |
| 
    
    
    1
    2
    3
    4
    5
    6
    7

 | 
    
    
    begin
      File.read "config.yml"
    rescue SystemCallError => e
      puts e.class # => Errno::ENOENT
      puts e.class.superclass # => SystemCallError
      puts e.class.superclass.superclass # => StandardError
    end
    

 | 

In the example above you can see the exception `Errno::ENOENT` is caught when its parent `SystemCallError` is being rescued.
