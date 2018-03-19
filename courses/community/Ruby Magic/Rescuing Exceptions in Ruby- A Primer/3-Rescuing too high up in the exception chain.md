It's important not to rescue exceptions too high up the [Exception chain][2]. When you do, all subclassed exceptions will also be caught, making the rescue block's capture too generic.

Here's a program that reads a config file based on the argument passed to the program.

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

 | 
    
    
    # $ ruby example.rb config.yml
    def config_file
      ARGV.firs # Note the typo here, we meant `ARGV.first`.
    end
    
    begin
      File.read config_file
    rescue
      puts "Couldn't read the config file"
    end
    

 | 

The error message says it couldn't read the config file, but the real problem was a typo in the code.

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
      File.read config_file
    rescue => e
      puts e.inspect
    end
    #
    

 | 

The default exception class caught by a `begin .. rescue` block is [StandardError][3]. If we don't pass in a specific class, Ruby will rescue StandardError and all subclassed errors. [NoMethodError][4] is one of these errors.

Rescuing a specific exception class will help prevent unrelated errors from accidentally prompting a failure state. It also allows for more specific custom error messages that are more helpful for the end user.

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
    
    
    config_file = "config.yml"
    begin
      File.read config_file
    rescue Errno::ENOENT => e
      puts "File or directory #{config_file} doesn't exist."
    rescue Errno::EACCES => e
      puts "Can't read from #{config_file}. No permission."
    end
    

 | 
