In the simple loop we used earlier the GC's job is fairly easy. With every iteration of the loop, the variable isn't used anywhere anymore. The variable can immediately be marked for cleanup.

| ----- |
| 
    
    
    1
    2
    3
    4

 | 
    
    
      1_000_000.times do |i|

        variable = "Variable #{i}"
        puts variable
      end

 | 

In the next example we pass the variable into the `puts_later` method which waits for 30 seconds and then `puts` the variable.

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
    
    
      def puts_later(variable)
        Thread.new do
          sleep 30
          puts variable
        end
      end
    
      1_000_000.times do |i|
        variable = "Variable #{i}"
        puts_later variable
      end

 | 

The Garbage Collector's job is already pretty complicated in this relatively simple example. It has to understand that we reference the variable in the `puts_later` method. Because the method starts a thread, the Garbage Collector has to keep track of the thread and wait for it to finish. Only then can the variable can be marked for cleanup.
