This looks a little something like the following mock Ruby code. It declares a variable and uses the method `free` –this method does not actually exist in Ruby– to clean up the memory we've used after we're done with the variable.

| ----- |
| 
    
    
    1
    2
    3
    4
    5

 | 
    
    
      1_000_000.times do |i|

        variable = "Variable #{i}"
        puts variable
        free(variable)
      end

 | 
