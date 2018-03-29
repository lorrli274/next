The simplest **HTTP GET request** is a **request-line** without any additional headers or a request body.

The Request-Line consists of four parts:

* A method token (`GET`, in this example)
* The Request-URI (`/`)
* The protocol version (`HTTP/1.1`)
* A CRLF (a carriage return: `r`, followed by line feed: `n`) to indicate the end of the line

The server will respond with an HTTP response, which may look like this:

```ruby
HTTP/1.1 200rnContent-Type: text/htmlrnrnHello world!
```

This response consists of:

* A status line: the protocol version ("HTTP/1.1"), followed by a space, the response's status code ("200"), and terminated with a CRLF (`rn`)
* Optional header lines. In this case, there's only one header line ("Content-Type: text/html"), but there could be multiple (separated with with a CRLF: `rn`)
* A newline (or a double CRLF) to separate the status line and header from the body: (`rnrn`)
* The body: "Hello world!"
