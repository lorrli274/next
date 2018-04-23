By adding your files in the previous step, you **staged** them for **committing**. Now it's time to save them to your repository by actually committing them.

As a refresher, a Git **commit** is a snapshot of your repository at a single point in time. It gives you an opportunity to save a checkpoint of your work and explain what changes you've made to your files using a **commit message**.

You can create a commit one of two ways:

* `git commit`: This will prompt you to enter a commit message.
* `git commit -m "Your commit message."`: This will create a new commit with _Your commit message._ as the commit message.

Writing a good commit message is very important. Your commit message should describe what changes you have made and contain only correct spelling, punctuation, and grammar.

Here's a few examples of bad commit messages:

* _Made code changes_
* _Bugfix._
* _Fixed nastee bug in user sign in._

Here are some good ones:
* _Increased frequency of background job processing by 10%._
* _Fixed bug that allows users to set their profile picture as a square._
* _Addressed regression in last commit that temporarily broke sign in form._

Writing a good commit message allows you (and other people) to easily find where you might have made a specific change when you are reviewing the history of your repository.
