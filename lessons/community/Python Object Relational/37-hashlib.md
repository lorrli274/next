`[hashlib`][20] supports OpenSSL 1.1.0. The minimum recommend version is 1.0.2. (Contributed by Christian Heimes in [bpo-26470][179].)

BLAKE2 hash functions were added to the module. `[blake2b()`][180] and `[blake2s()`][181] are always available and support the full feature set of BLAKE2. (Contributed by Christian Heimes in [bpo-26798][182] based on code by Dmitry Chestnykh and Samuel Neves. Documentation written by Dmitry Chestnykh.)

The SHA-3 hash functions `sha3_224()`, `sha3_256()`, `sha3_384()`, `sha3_512()`, and SHAKE hash functions `shake_128()` and `shake_256()` were added. (Contributed by Christian Heimes in [bpo-16113][183]. Keccak Code Package by Guido Bertoni, Joan Daemen, Michaël Peeters, Gilles Van Assche, and Ronny Van Keer.)

The password-based key derivation function `[scrypt()`][22] is now available with OpenSSL 1.1.0 and newer. (Contributed by Christian Heimes in [bpo-27928][184].)
