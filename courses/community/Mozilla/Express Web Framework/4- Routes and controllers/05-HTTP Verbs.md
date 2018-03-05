The example routes above use the `Router.get()` method to respond to HTTP GET requests with a certain path.

The `Router` also provides route methods for all the other HTTP verbs, that are mostly used in exactly the same way: `post()`, `put()`, `delete()`, `options()`, `trace()`, `copy()`, `lock()`, `mkcol()`, `move()`, `purge()`, `propfind()`, `proppatch()`, `unlock()`, `report()`, `mkactivity()`, `checkout()`, `merge()`, `m-``search()`, `notify()`, `subscribe()`, `unsubscribe()`, `patch()`, `search()`, and `connect()`.

For example, the code below behaves just like the previous `/about` route, but only responds to HTTP POST requests.
    
```js    
router.post('/about', function (req, res) {
	res.send('About this wiki');
})
```
