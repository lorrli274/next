Bugsnag’s handler can integrate with Django’s **logging configuration** by adding `bugsnag.handlers.BugsnagHandler` to the application’s logging configuration.

For example, to send any logs that are `ERROR` and above to Bugsnag (in addition to the existing logging behaviour) the configuration would look like:

```python
LOGGING = {
    'version': 1,
    'disable_existing_loggers': False,

    'root': {
        'level': 'ERROR',
        'handlers': ['bugsnag'],
    },

    'handlers': {
        'bugsnag': {
            'level': 'INFO',
            'class': 'bugsnag.handlers.BugsnagHandler',
        },
    }
}
```
