Configure the library in your Django *Settings.py*:

```python
BUGSNAG = {
    'api_key': 'YOUR_API_KEY_HERE',
    'project_root': '/path/to/your/app',
}
If not set, the project_root will default to the current working directory, and api_key will default to the BUGSNAG_API_KEY environment variable.

Add the Bugsnag middleware to the top of MIDDLEWARE in settings.py.

MIDDLEWARE = (
    'bugsnag.django.middleware.BugsnagMiddleware',
    ...
)
```
