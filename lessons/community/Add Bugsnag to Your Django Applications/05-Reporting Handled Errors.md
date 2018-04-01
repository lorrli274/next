If you would like to send **handled exceptions** to `bugsnag`, you should import the bugsnag module:

```python
import bugsnag
```

Then to notify Bugsnag of an error, you can call `bugsnag.notify`:

```python
bugsnag.notify(Exception("Something broke!"))
```

You can also pass [additional configuration options](https://docs.bugsnag.com/platforms/python/django/reporting-handled-errors/) as named parameters. These parameters will only affect the current call to notify.

