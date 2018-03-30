### Automatically captured diagnostics
As well as a full [stacktrace](https://en.wikipedia.org/wiki/Stack_trace) for every exception, Bugsnag will automatically capture the following diagnostic data:
* Request information, including ip, headers, URL, HTTP method, and HTTP params
* Session data
* Release stage (production, beta, staging, etc)
* Hostname

### Custom diagnostics
The `meta_data field` is a dictionary of dictionaries which will be rendered as a tab in a Bugsnag error report. This example would create a `special_info` tab:

```python
bugsnag.notify(Exception("Something broke!"),
    context="myContext",
    meta_data={"special_info":{"request_id": 12345, "message_id": 854}}
)
```

For more information, see [reporting handled errors](https://docs.bugsnag.com/platforms/python/django/reporting-handled-errors/).

### Logging diagnostic data
The BugsnagHandler accepts a special keyword argument to its `__init__()` function: `extra_fields`. This is optional and may be a dictionary of extra attributes to gather from each LogRecord and insert into `meta_data` to be attached to Bugsnag error reports.

The keys in the `Extra_fields` dictionary should be tab names for where you would like the data displayed in Bugsnag, and the values should be attributes to pull off each log record and enter into section. The attributes are not required to exist on the log record, and any non-existent attribute will be ignored. Example:

```python
bs_handler = BugsnagHandler(extra_fields={"some_tab":["context_attribute"]})
```

This is very useful if you are assigning context-specific attributes to your LogRecord objects, as described in the [Python Logging Cookbook](https://docs.python.org/3.4/howto/logging-cookbook.html#using-filters-to-impart-contextual-information).
