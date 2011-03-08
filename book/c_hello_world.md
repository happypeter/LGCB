---
layout: book
title: Hello World
---
Now we have our first program in _file.c_, it is nothing but:

    main()
    {
    }

we know it is just source code, so we need the _compiler_ to translate these
text into what the machine can understand, so now we have _a.out_, it run,
looked alright, but did noting at all.

## What should a program look like?
AS a new, one may expected a source file looks like this:

    the first step of what I want to do
    the second step
    the third step
    ...

the above stucture makes perfect logical sense, but

## why C designer loves fuction so much?
If he is not insane, every C feathers brought in for a practical reason.

The real world is that computers are really good at does something quickly,
but again, it can only something really simple one step, hence even a very
simple and common tasks must be divided into several steps, so we end up have a
program looks like this(Structure A):

    the first step of what I want to do
    the second step
    the third step
    ...
    Step 1 to do a simple task
    Step 2 to do a simple task
    Step 3 to do a simple task and this is the last step
    ... 
    Step 1 to do a simple task
    Step 2 to do a simple task
    Step 3 to do a simple task and this is the last step
    ...


This is stupid, and this is the point when _fuction_ come and help.
so now the program looks like this(Structure B)

    task_name()
    {
        Step 1 to do a simple task
        Step 2 to do a simple task
        Step 3 to do a simple task and this is the last step
    }

    the first step of what I want to do
    the second step
    the third step
    ...
    task_name()
    ...
    task_name()

now the program looks shorter and clearer, right?

and "Structure B" is actually used by some of the real lanagues out there(say,
bash script)

## But C goes one step further

Because C designer loves funciton so much, so he finally decided, no code show
run outside a fuction, so The C Structure: 

    task_name()
    {
        Step 1 to do a simple task
        Step 2 to do a simple task
        Step 3 to do a simple task and this is the last step
    }
    main()
    {
        the first step of what I want to do
        the second step
        the third step
        ...
        task_name()
        ...
        task_name()
    }

And all C programs start at main()
