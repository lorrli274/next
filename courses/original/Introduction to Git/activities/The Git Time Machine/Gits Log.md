As you saw from completing the previous instruction, we currently have a clean Git repository. In other words, no files are currently waiting to be committed.

But there have been some changes to this repo (that's a fancy word for repository) since you last saw it. A new file (_README.md_) has been added.

We can check this by using the `git log` command. This will show us the previous history of this repository, starting with the last commit.

If you run that command now, it'll look something like this:

```
commit 0ab9e758166ff6211760dd38f19e5f9db0f0bd5e
Author: root
Date:   Wed Oct 11 23:18:21 2017 +0000

    Added a readme.

commit ae7119aabd686731b8153ee2519a9ee985ed8f72
Author: root
Date:   Wed Oct 11 23:16:00 2017 +0000

    Initial commit
```

Let's break this output down.

First, we have the commit **hash**. This is an output of the SHA-1 cryptographic hashing function, which takes your current repository state and some other information and produces a 40 character ID that will ([almost always](http://shattered.io)) be unique.

The commit hash is used to identify it in the repository. We'll use this a lot as we progress.

Next up we have the name of the author of the commit and the date and time that the commit was created. Then there's the commit message.

If you've already run `git log`, progress to the next step. Otherwise, run it and review the output!
