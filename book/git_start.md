---
layout: book
title: Gittin Started
---

Fine, Let's try to do some real work, usually when people try to talk about
git, they suppose the listener knows about systems like SVN or CVS. I don't,
and if my reader--you knows nothing about these bullshit traditional version
control systems, it is actually a advantage. 

## Installing git

On __ubuntu__, it is:

    sudo apt-get install git-core

That's it. On other operating systems this may differ.

Try and See:

    peter@vostro:~/repo-farm/LGCB/book$ git --version
    git version 1.6.3.3

Now we are good to go.

## I want versions!

you have files and subdirs in a _common directory_, you have files and subdirs
in a _git directory_. What's the difference? It is in a _git directory_, you
can:

- have revision history of all files 
- so that if you make a mistake modifying these files, you are free to go
  back
- so it is a time machine

OK, "time machine" sounds cool, but what to do to get a _git directory_?

now let's do it:

    peter@vostro:~$ mkdir mydir
    peter@vostro:~$ cd mydir/
    peter@vostro:~/mydir$ ls
    peter@vostro:~/mydir$ vim README
    peter@vostro:~/mydir$ ls
    README
    peter@vostro:~/mydir$ cat README 
    hello world

we get a _common directory_ named `mydir`, and some git work

    peter@vostro:~/mydir$ git init
    Initialized empty Git repository in /home/peter/mydir/.git/

it is nothing difficult, just a simple command `git init`, but now you get a
_git directory_ already, you see nothing until you do: 

    peter@vostro:~/mydir$ ls -a
    .  ..  .git  README

So the difference, between a common dir and a git dir is simply this little
`.git` directory. 

`.git` is the heart of git, and it is usually called a _git repository_,
because all the history of whatever in your `mydir` is stored there.


My people will say now: OK, `mydir` is a time machine, I am save and allowed
to make mistakes now, because the history is saved. Actully not yet. It is
easy for git to automatically save whatever in `mydir` and save a new revision
everytime you change your stuff. Git can, but git won't. Because that is not
what the users want. So you need to it mannually.

Fisrt, tell git which file you want to track, by

    peter@vostro:~/mydir$ git add README

so to everything other than the `README`, git will turn a blind eye.

    peter@vostro:~/mydir$ git commit -a -m "my first version"
    [master (root-commit) b50d0f7] my first version
     1 files changed, 1 insertions(+), 0 deletions(-)
      create mode 100644 README
      peter@vostro:~/mydir$ 

now you have the _r0_ in the following graph:

<center><img src="./images/rev.png"></center>
<center>revisions</center>

Surely, if you have only _r0_, that's not the point to do verison control, so
you need to make a delta, and get the _r1_, like this: 

    peter@vostro:~/mydir$ vim README 
    peter@vostro:~/mydir$ cat README 
    hello world
    hello again

Now make _r1_, like this:

    peter@vostro:~/mydir$ git commit -a -m "my second verion"
    [master 3ccdf5e] my second verion
     1 files changed, 1 insertions(+), 0 deletions(-)

Oho, so much work has done, but we don't see anything interesting happens,
where is my history:

Now there is the thing called `git log`, will is one of the many ways, to get
a look at the histroy:

    peter@vostro:~/mydir$ git log
    
    commit 3ccdf5e1ab80ee2e818433ceeb9f2e01c0074f81
    Author: peter <peter@vostro.(none)>
    Date:   Wed Mar 9 09:29:13 2011 +0800

        my second verion

    commit b50d0f74cec015c74c63c42d1f80236ce775a79d
    Author: peter <peter@vostro.(none)>
    Date:   Wed Mar 9 09:27:27 2011 +0800

        my first version

Never mind if you don't quit get what all these output means, now at least you
know you have `README`, not only the latest verion, but also all its revisons
are save there(in `.git`? Right!).

Good quetions now are:

- how I can check the differnce between different revisions?
- how can I go back to certain point of the history and get the revison I
  want?

My answer now is you can do these things, really easy, because git was made to
do such jobs efficiently. 
