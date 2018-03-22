Now the whole chat system works! But as you can see, writing a program that uses multiprocessing is quite complex and uses a lot of resources. The upside is that it's very robust. If one of the child processes crashes the rest of the system just keeps working. You can try that by running the example code and running `kill -9 ` on one of the processes (you can find the process id in the server's log output).

In the next lesson we'll implement the same chat system only using threads, so we can run a server with the same features using just one process and less memory.
