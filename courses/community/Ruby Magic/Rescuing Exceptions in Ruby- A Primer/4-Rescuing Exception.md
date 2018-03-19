It might still be tempting to rescue high up in the exception chain. Rescuing all errors an application can raise will prevent it from crashing. (100% uptime here we come!) However, it can cause a lot of problems.

The [Exception][2] class is the main exception class in Ruby. All other exceptions are subclasses of this class; if Exception is rescued all errors will be caught.

Two exceptions that most applications won't want to rescue are are SignalException and SystemExit.

> [SignalException][5] is used when an outside source is telling the application to stop. This can be the Operating System when it wants to shut down, or a system administrator that wants to stop the application. [Example][6]
> 
> [SystemExit][7] is used when `exit` is being called from the Ruby application. When this is raised the developer wants the application to stop. [Example][8]
> 
> If we rescue Exception and these exceptions are raised while an application is currently running the `begin ... rescue ... end` block it cannot exit.

It's generally a bad idea to rescue Exception in normal situations. When rescuing Exception, you'll prevent SignalException and SystemExit to function, but also [LoadError][9], [SyntaxError][10] and [NoMemoryError][11], to name a few. It's better to rescue more specific exceptions instead.
