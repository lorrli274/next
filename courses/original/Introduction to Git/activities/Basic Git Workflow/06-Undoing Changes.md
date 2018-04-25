If you want to undo changes to a file that have not been added for committing, you can use the `git checkout` command. There are two different ways you can use this:

* `git checkout .`: This will reset all the tracked files in a repository
* `git checkout <filename>`: This will reset the provided file

Checking out a file resets its contents to what they were at the previous commit.

If you've already added the file to be committed, you also have two options:

* `git reset HEAD .`: un-stage all the files
* `git reset HEAD <filename>`: unstage a particular file

`HEAD` points to the current commit. Once you've unstaged the file(s), you can use the `checkout` commands to undo the changes entirely.

info> You can also use `git clean -f` to remove files that have been created but not added to the repo yet.
