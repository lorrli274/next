As mentioned earlier, it's good to be specific in what errors to rescue.

When you're unsure what exceptions an operation can raise, rescuing [StandardError][3] can be a good place to start. Run your code in different scenarios and see what exceptions it raises.

| ----- |
| 
    
    
    1
    2
    3
    4
    5
    6

 | 
    
    
    begin
      File.open('/tmp/appsignal.log', 'a') { |f| f.write "Starting AppSignal" }
    rescue => e
      puts e.inspect
    end
    #
    

 | 

Every time you come across a new exception, add specific rescue cases for those exceptions or its relevant parent class. It's better to be specific in what to rescue than to rescue too many exceptions.

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
    12
    13
    14
    15
    16
    17

 | 
    
    
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
    

 | 

This concludes our primer on exceptions handling in Ruby. Let us know at [@AppSignal][14] if you want to know more, or have a specific question. If you want to get a better insight in where and how often exceptions are raised in your app, [give AppSignal a try][15].

[1]: https://appsignal.com/tour/errors
[2]: http://ruby-doc.org/core-2.3.1/Exception.html
[3]: http://ruby-doc.org/core-2.3.1/StandardError.html
[4]: http://ruby-doc.org/core-2.3.1/NoMethodError.html
[5]: http://ruby-doc.org/core-2.3.1/SignalException.html
[6]: https://gist.github.com/tombruijn/a4181e217b8e1c46ebcc2c116223cb6a
[7]: http://ruby-doc.org/core-2.3.1/SystemExit.html
[8]: https://gist.github.com/tombruijn/b75dcd6722d67f7a982fddc23f295b02
[9]: http://ruby-doc.org/core-2.3.1/LoadError.html
[10]: http://ruby-doc.org/core-2.3.1/SyntaxError.html
[11]: http://ruby-doc.org/core-2.3.1/NoMemoryError.html
[12]: https://github.com/seattlerb/minitest
[13]: http://rspec.info/
[14]: http://twitter.com/appsignal
[15]: https://appsignal.com/

  
