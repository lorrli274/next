Now that we have initialized a Git repository, it's time to start **tracking** files in it!

Currently, Git has not backed up your files. This means changes to them will not be stored, which isn't very useful.

To start tracking a file we must **add** it to the repository. This can be done by passing the filename to the `git add` command, for example `git add myfile.txt`.

There are several other ways you can add files to the repository:

* `git add -A`: Add all files, instead of one at a time.
* `git add .`: Add the changes to files that are already being tracked by Git.
* `git add -p`: _(Advanced)_ Enter an interactive tool that lets you add files bit-by-bit.

We'll use some of these in this course. For now, follow the instructions below to add your files individually.
