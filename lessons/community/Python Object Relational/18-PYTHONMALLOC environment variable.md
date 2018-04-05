The new `[PYTHONMALLOC`][80] environment variable allows setting the Python memory allocators and installing debug hooks.

It is now possible to install debug hooks on Python memory allocators on Python compiled in release mode using `PYTHONMALLOC=debug`. Effects of debug hooks:

* Newly allocated memory is filled with the byte `0xCB`
* Freed memory is filled with the byte `0xDB`
* Detect violations of the Python memory allocator API. For example, `[PyObject_Free()`][81] called on a memory block allocated by `[PyMem_Malloc()`][82].
* Detect writes before the start of a buffer (buffer underflows)
* Detect writes after the end of a buffer (buffer overflows)
* Check that the [GIL][83] is held when allocator functions of `[PYMEM_DOMAIN_OBJ`][84] (ex: `[PyObject_Malloc()`][85]) and `[PYMEM_DOMAIN_MEM`][86] (ex: `[PyMem_Malloc()`][82]) domains are called.

Checking if the GIL is held is also a new feature of Python 3.6.

See the `[PyMem_SetupDebugHooks()`][87] function for debug hooks on Python memory allocators.

It is now also possible to force the usage of the `malloc()` allocator of the C library for all Python memory allocations using `PYTHONMALLOC=malloc`. This is helpful when using external memory debuggers like Valgrind on a Python compiled in release mode.

On error, the debug hooks on Python memory allocators now use the `[tracemalloc`][14] module to get the traceback where a memory block was allocated.

Example of fatal error on buffer overflow using `python3.6 -X tracemalloc=5` (store 5 frames in traces):
    
    
    Debug memory block at address p=0x7fbcd41666f8: API 'o'
        4 bytes originally requested
        The 7 pad bytes at p-7 are FORBIDDENBYTE, as expected.
        The 8 pad bytes at tail=0x7fbcd41666fc are not all FORBIDDENBYTE (0xfb):
            at tail+0: 0x02 *** OUCH
            at tail+1: 0xfb
            at tail+2: 0xfb
            at tail+3: 0xfb
            at tail+4: 0xfb
            at tail+5: 0xfb
            at tail+6: 0xfb
            at tail+7: 0xfb
        The block was made by call #1233329 to debug malloc/realloc.
        Data at p: 1a 2b 30 00
    
    Memory block allocated at (most recent call first):
      File "test/test_bytes.py", line 323
      File "unittest/case.py", line 600
      File "unittest/case.py", line 648
      File "unittest/suite.py", line 122
      File "unittest/suite.py", line 84
    
    Fatal Python error: bad trailing pad byte
    
    Current thread 0x00007fbcdbd32700 (most recent call first):
      File "test/test_bytes.py", line 323 in test_hex
      File "unittest/case.py", line 600 in run
      File "unittest/case.py", line 648 in __call__
      File "unittest/suite.py", line 122 in run
      File "unittest/suite.py", line 84 in __call__
      File "unittest/suite.py", line 122 in run
      File "unittest/suite.py", line 84 in __call__
      ...
    

(Contributed by Victor Stinner in [bpo-26516][88] and [bpo-26564][89].)
