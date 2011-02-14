---
layout: book
title: Redirction
---

In this lesson we are going to check what may be the coolest feature of the
command line. It's called _I/O redirection_. The "I/O" stands for input/output
and with this you can redirect the input and output of commands to and from
files, as well as connect multiple commands together into powerful command
_pipelines_.


pipe is a form of redirection that is used in Linux and other Unix-like
operating systems to send the output of one program to another program for
further processing. 

Redirection is the transferring of standard output to some other destination,
such as another program, a file or a printer, instead of the display monitor
(which is its default destination). Standard output, sometimes abbreviated
stdout, is the destination of the output from command line (i.e., all-text
mode) programs in Unix-like operating systems.

Pipes are used to create what can be visualized as a pipeline of commands,
which is a temporary direct connection between two or more simple programs.
This connection makes possible the performance of some highly specialized task
that none of the constituent programs could perform by themselves. A command
is merely an instruction provided by a user telling a computer to do
something, such as launch a program. 

## Standard Input, Output, And Error
Many of the programs that we have used so far produce output of some kind.
This output often consists of two types. First, we have the program's results;
that is, the data the program is designed to produce, and second, we have
status and error messages that tell us how the program is getting along. If we
look at a command like ls, we can see that it displays its results and its
error messages on the screen.  Keeping with the Unix theme of "everything is a
file," programs such as ls actually send their results to a special file
called standard output (often expressed as stdout) and their status messages
to another file called standard error (stderr). By default, both standard
output and standard error are linked to the screen and not saved into a disk
file.  In addition, many programs take input from a facility called standard
input (stdin) which is, by default, attached to the keyboard.

I/O redirection allows us to change where output goes and where input comes
from.  Normally, output goes to the screen and input comes from the keyboard,
but with I/O redirection, we can change that.

<center><img src="./images/three_io.png"></center>
