---
layout: book
title: The First Program
---
## why we need to learn C?
So the question is why we need to learn C or any other so called programing
language?

To write programs, of course. And a computer program will run on our computer
and help us do something, say, do some mathematical calculation, or download
music for us from the Internet.

So the real answer is we want to TALK to our computer and get things done. 

## the first program

Let's first create a file

    vim file.c

and now have the following in it:

    main()
    {
    }

Save and quit now we have a file named _file.c_, which is our first program.

So first we need to say, a programming Language is different from our natural
languages in that 

## It has stick format

Compared to human brain, computers are far less smart, so the easily way to
make it understand what you are saying is by talking in a very Strictly
formatted way, so that every thing is simple and clear.

In our first program, we followed the format, so even though it does nothing
for us, it has its format, and the format shows everything within this file
is a empty _function_.

## What is a function in C?

Again, we need to say computers are machines, which can only do one simple
thing in one single step. The the result is a very small task is devided into
several steps of computation.

A function provides a convenient way to wrap some many-step computation up,
now you can do all the steps as one. This make sense, because you always have
steps to repeat.

This is what a function does, and now what it looks:

    function_name()
    {
        things to do
    }

A legal (though simplified) function format.

so now we see in our first program, we have a fuction named "main", and it
does nothing for us, because there is nothing between "{" and "}". OK, so if
we only have one function in a C program, can we give it any other name, the
answer is NO, since: 

## every C program start with main fuction

So as a C program, it needs to have one(and only one) "main()", that's the
point the execution begins.


## run it!
Until now all I metioned seems to be nothing but the defense to say our first
program is a real C program. That's bullshit, if we can not run it. Words are
tedious, we need to see something fun.

But wait, our program is human-readable charaters, so we ususally call what's
inside _file.c_ "source code". While computer is a simple machine, which only
understanding 0 and 1 as you may know. So we need somebody who can translate
the "source code" into "0 and 1"s. And here steps in the translator, anoter
somputer program named _compiler_ .

On ubuntu system, now we run this:

    peter@vostro:~$ gcc file.c 

note __gcc__ is the compiler.

If you don't messed up anything, you should get a complied file named _a.out_
in your current dir.   

    peter@vostro:~$ ./a.out 

and it does nothing for us.  
