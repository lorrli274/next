Bugsnag can track the number of “sessions” that happen in your application. This enables Bugsnag to [provide and compare crash rates between releases](https://docs.bugsnag.com/product/releases/releases-dashboard/) to help you understand the quality of your releases. This functionality is disabled by default, but can be enabled through the configuration:

```python
Bugsnag.configure(
  auto_capture_sessions=True
)
```

Using this option, Bugsnag will report a session each time a request is made to the server.

If you want control over what is deemed a session, rather than using the `uto_capture_sessions` option, you can call `Bugsnag.start_session` when appropriate for your application.
