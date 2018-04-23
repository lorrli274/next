Although you can always undo changes to files by creating a new commit, sometimes it's better to use a fancy command to do this: `git reset`.

Because each commit is a snapshot of our repository at a given point in time, we can always jump our repo back to an earlier commit.

The first step of resetting is to figure out where we want to reset to. Because this bug was introduced in the last commit, there are two ways we can reset to the commit earlier:

* `git reset --hard ae7119`: This undoes all the changes _after_ the ABCABC commit.
* `git reset --hard HEAD^1`: `HEAD` is the last commit, so `HEAD^1` will give us the commit before that (if you wanted to go back two commits, you could do `git reset HEAD^2`).

Before you use `git reset`, you should check the status of your repo. This is because your current work is often lost during resetting.

info> Using the `--hard` flag is the fastest way for us to get what we want, but if you were working with a team have shared this code with them, you should create a new commit instead. This is because this flag rewrites the history of the repository, which can cause issues for other people working on the same repository.
