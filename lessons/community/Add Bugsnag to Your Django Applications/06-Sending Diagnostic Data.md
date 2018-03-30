### Automatically captured diagnostics
As well as a full [stacktrace](https://en.wikipedia.org/wiki/Stack_trace) for every exception, Bugsnag will automatically capture the following diagnostic data:
* Request information, including ip, headers, URL, HTTP method, and HTTP params
* Session data
* Release stage (production, beta, staging, etc)
* Hostname

### Custom diagnostics#
The `meta_data field` is a dictionary of dictionaries which will be rendered as a tab in a Bugsnag error report. This example would create a `special_info` tab:

```python
bugsnag.notify(Exception("Something broke!"),
    context="myContext",
    meta_data={"special_info":{"request_id": 12345, "message_id": 854}}
)
```

For more information, see [reporting handled errors](https://docs.bugsnag.com/platforms/python/django/reporting-handled-errors/).
