Without getting into complex examples, trust me when I say the Garbage Collector's job is really hard. This also explains why GC can cause overhead and problems in your production environment. It needs to have a very detailed understanding of what's happening in your program to properly clear memory, which takes quite a few CPU cycles to get right.

So we talked about why we need Garbage Collection and how it works in general. Now it's time to dive a bit deeper into how this is implemented in Ruby, and how you can measure and tune GC to improve the performance of your application.
