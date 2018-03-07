There are many [releases of Node](https://nodejs.org/en/blog/release/) — newer releases contain bug fixes, support for more recent versions of ECMAScript (JavaScript) standards, and improvements to the Node APIs. 

Generally you should use the most recent LTS (long-term supported) release as this will be more stable than the "current" release while still having relatively recent features (and is still being actively maintained). You should use the Current release if you need a feature that is not present in the LTS version.

For Express you should always use the latest version.

info> What about databases and other dependencies? Other dependencies, such as database drivers, template engines, authentication engines, etc. are part of the application, and are imported into the application environment using the NPM package manager. We'll discuss them in later lessons.
