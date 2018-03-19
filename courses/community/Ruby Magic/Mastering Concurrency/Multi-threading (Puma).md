This threading model allows one process to handle multiple requests at the same time. It does so by running multiple threads within a single process.

As opposed to the multi-process approach, all threads run within the same process. This means they share data such as global variables. Therefore, only small chunks of extra memory are used per thread.

![][4]
