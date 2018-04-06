[ssl`][21] supports OpenSSL 1.1.0. The minimum recommend version is 1.0.2. (Contributed by Christian Heimes in [bpo-26470][179].)

3DES has been removed from the default cipher suites and ChaCha20 Poly1305 cipher suites have been added. (Contributed by Christian Heimes in [bpo-27850][233] and [bpo-27766][234].)

`[SSLContext`][235] has better default configuration for options and ciphers. (Contributed by Christian Heimes in [bpo-28043][236].)

SSL session can be copied from one client-side connection to another with the new `[SSLSession`][237] class. TLS session resumption can speed up the initial handshake, reduce latency and improve performance (Contributed by Christian Heimes in [bpo-19500][238] based on a draft by Alex Warhawk.)

The new `[get_ciphers()`][239] method can be used to get a list of enabled ciphers in order of cipher priority.

All constants and flags have been converted to `[IntEnum`][240] and `IntFlags`. (Contributed by Christian Heimes in [bpo-28025][241].)

Server and client-side specific TLS protocols for `[SSLContext`][235] were added. (Contributed by Christian Heimes in [bpo-28085][242].)
