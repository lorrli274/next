It might still be tempting to **rescue** high up in the exception chain. Rescuing all errors an application can raise will prevent it from crashing. However, it can cause a lot of problems.

The [Exception](http://ruby-doc.org/core-2.3.1/Exception.html) class is the main exception class in Ruby. All other exceptions are subclasses of this class; if Exception is rescued all errors will be caught.

Two exceptions that most applications won't want to rescue are are **SignalException** and **SystemExit**.

[SignalException](http://ruby-doc.org/core-2.3.1/SignalException.html) is used when an outside source is telling the application to stop. This can be the Operating System when it wants to shut down, or a system administrator that wants to stop the application. [Example](https://gist.github.com/tombruijn/a4181e217b8e1c46ebcc2c116223cb6a)
 
[SystemExit](http://ruby-doc.org/core-2.3.1/SystemExit.html) is used when `exit` is being called from the Ruby application. When this is raised the developer wants the application to stop. [Example](https://gist.github.com/tombruijn/b75dcd6722d67f7a982fddc23f295b02)
 
info>If we rescue Exception and these exceptions are raised while an application is currently running the `begin ... rescue ... end` block it cannot exit.

It's generally a bad idea to rescue Exception in normal situations. When rescuing Exception, you'll prevent SignalException and SystemExit to function, but also [LoadError](http://ruby-doc.org/core-2.3.1/LoadError.html), [SyntaxError](http://ruby-doc.org/core-2.3.1/SyntaxError.html) and [NoMemoryError](http://ruby-doc.org/core-2.3.1/NoMemoryError.html), to name a few. It's better to rescue more specific exceptions instead.
