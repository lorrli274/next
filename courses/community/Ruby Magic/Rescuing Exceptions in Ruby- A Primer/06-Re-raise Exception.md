An application should only capture exceptions as high up in the chain as the Exception class when there's a very good reason. For example, when there's some cleanup involved before exiting a block of code, like removing temporary files that really need to be removed.

One recommendation for when you absolutely have to rescue Exception, re-raise it after you're done handling the error. This way the Ruby exception handling can decide the fate of the process afterward.

 ```ruby    
File.open("/tmp/my_app.status", "w") { |f| "running" }


begin
  foo
rescue Exception => e
  Appsignal.add_error e
  File.open("/tmp/my_app.status", "w") { |f| "stopped" }
  raise e
end
```
