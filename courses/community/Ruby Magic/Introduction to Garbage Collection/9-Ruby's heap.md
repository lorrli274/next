A computer has two types of memory: **Stack** and **Heap**. The stack is very fast and is local to the context of a function call. This means that every variable that is declared in the stack is immediately freed once the function is done. The stack is very limited in size, so you cannot store larger objects that contain an image or file's data, for example.

This is a bad fit for storing Ruby objects. These objects very often stick around for longer than a method call. Also, it's almost impossible to predict whether an object will be too big for the stack.

Therefore Ruby uses the other type of memory: the heap. On the heap a program can claim some memory and is then responsible for cleanup once it's done with that memory. Ruby uses this by claiming a single slab of memory to use to store Ruby objects. This is referred to as Ruby's heap.

Stack and Heap summary
Stack memory	Very fast 
Used memory is freed automatically when the function call ends 
Very limited in size
Heap memory	Slightly slower than stack 
No automatic cleanup 
Size is only limited by the available memory of the computer

So Ruby objects are always allocated on Ruby's heap. If they're smaller than 40 bytes their content can be directly embedded in the object. Otherwise the object points to a separate segment of memory on Ruby's heap. So your Ruby object is often stored in two completely different locations in memory. Once Ruby's heap is full it will create a new heap, which is used for new objects.

The mark phase halts the execution of your code. The reason for this is that the Garbage Collector has to understand all the relationships between objects that exist. If the program would be running during the mark process things might change in the meantime and the Garbage Collector wouldn't be sure what the current state of an object is.

Secondly the sweep phase starts. This runs in the background on Ruby 1.9 and up. The Garbage Collector quietly frees every object that was marked in the mark phase. The memory is only available again after the sweep.

Since the mark phase halts the execution of your code, this is where problems in production can occur. The sweep phase is relatively benign.

|  Mark and Sweep summary |  
| ----  |
|  Mark phase |  Scans existing objects   

Sets mark flag if object can be cleaned   
Halts code execution  |  
|  Sweep phase |  Runs in the background   
Cleans up marked objects   
Memory available again after sweep is competed  | 

This is useful because often a part of your memory should never be cleaned up. When you boot up Rails it loads the entire Rails framework into memory. That will stay there for the entire lifetime, so it would be a waste of resources to check all these objects every time.

| Major and minor runs |  
| -------------------- |  
| Major run            | Runs less often     
More intensive to run  |  
| Minor run            | Ignores old objects     

Runs more often   
Less intrusive to run  |
