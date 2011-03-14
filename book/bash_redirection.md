---
layout: book
title: Redirection
---

In this lesson we are going to check what may be the coolest feature of the
command line. It's called _I/O redirection_. 

_I/O Redirection_ redirects data. Simple enough, ah? But from where to where?
Before we talk about this, we need to understand this:

## Standard Input, Output, And Error
Many of the programs that we have used so far produce output of some kind.
This output often consists of two types. 

- First, we have the program's results; that is, the data the program is
  designed to produce 

- Second, we have status and error messages that tell us how the program is
  getting along 


Keeping with the Unix theme of "everything is a file," programs such as ls
actually send their results to a special file called standard output (often
expressed as stdout) and their status messages to another file called standard
error (stderr). By default, both standard output and standard error are linked
to the screen and not saved into a disk file.  In addition, many programs take
input from a facility called standard input (stdin) which is, by default,
attached to the keyboard.

I/O redirection allows us to change where output goes and where input comes
from.  Normally, output goes to the screen and input comes from the keyboard,
but with I/O redirection, we can change that.

<center><img src="./images/three_io.png"></center>

## Pipes

Pipe is a form of redirection that is used to send the output of one program
to another program for further processing. 

    command1|command2

For example:

    peter@vostro:~$ ls /bin/ |grep zip
    bunzip2
    bzip2
    bzip2recover
    gunzip
    gzip

