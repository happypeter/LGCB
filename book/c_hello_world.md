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
If he is not insane, every C feather was brought in for a practical reason.

The real world is that computers are really good at does something quickly,
but again, it can only does something really simple one step, hence even a very
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


In practice, we always have some code blocks that repeats again and again, so
the code now looks unnecessarily long, stupid. This is the point when
_fuction_ come and help.  so now the program looks like this(Structure B)

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

Because C designer loves funciton so much, that he finally decided, no code show
run outside a fuction, so The  Structure C of a program looks: 

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


And all C programs start at main(), and you are not allowed to change `main`
into any other name.

## The standard library

It is really dull since _a.out_ showed us nothing, so the first thing we may
want our program to do is to print some on the screen. I know you now have
this in your mind:   


    print_something()
    {
        Step 1 to do printing
        Step 2 to do printing
        Step 3 to do printing
        ...
    }
    main()
    {
        print_something()
    }

As a matter of fact, you are on the right track, but there is just one single practical
diffculty: You do not know the Steps "to do printing". And Truth is that they
are quit complex. Wow...now what to do?

Lucily, there is the thing called "standard library", which provide a function
that is similar to our `print_something()`,(actully the standard library
provides many such useful fuctions).  

## The hello world program
So in order to use functions porvided by standard library, you need a format
like this:

    #inlcue<file_name.h>
    main()
    {
        the_function();
    }

standard library provide quit a few of these `file_name`s, to determin which
is the one to be `#include`d is acutlly simple, that is you need to choose
the one in which `the_function()` is decleared. So anything else, the compiler
will take care for us.

Now let's modify our code in _file.c_, and have these lines:

    #include<stdio.h>
    main()
    {
        printf("hello world");
    }


## Now run it

Compile it again:

    peter@vostro:~$ gcc file.c 

now run:

    peter@vostro:~$ ./a.out 
    hello world

Good, now we see something happens.

## Further Reading

 - __Std lib:__
 <http://www.utas.edu.au/infosys/info/documentation/C/CStdLib.html>

 you get info about std lib here
