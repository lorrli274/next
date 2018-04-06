The new `[getfilesystemencodeerrors()`][249] function returns the name of the error mode used to convert between Unicode filenames and bytes filenames. (Contributed by Steve Dower in [bpo-27781][250].)

On Windows the return value of the `[getwindowsversion()`][251] function now includes the _platform_version_ field which contains the accurate major version, minor version and build number of the current operating system, rather than the version that is being emulated for the process (Contributed by Steve Dower in [bpo-27932][252].)
