---
layout: book
title: Functions 
---
now let's see what's in our _file.c_:


    #include<stdio.h>
    main()
    {
        printf("hello world");
    }


## function structure updated

First check this line:

    printf("hello world");

Now we know we need to updated our understanding of function structure

    function_name( parameters )
    {
        things to do with parameters
    }

You may also notice the trailing "`;`", it is actually a very important
format thing in C, that is:

    statement = what_we_do;

so a C statement is actually not only `what_we_do`, if you forget to add the "`;`",
you will have trouble.

## Function declaration 

All functions in C need to be declared before they are used. For functions the
declaration needs to be before the first call of the function. 

Now we know `printf` is declared in `stdio.h`, but what the hell is
declaration?

If you still remember our Structure C:

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

Even though this structure is accepted by __gcc__, but common practice is to
have a C code structured this way:

    fuction declaration
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
    fuction()
    {
        Step 1 to do a simple task
        Step 2 to do a simple task
        Step 3 to do a simple task and this is the last step
    }

## real world example

Let's modify _file.c_ a bit more:

    #include <stdio.h>

    say_hello_twice();
    int main(int argc, const char *argv[])
    {
        say_hello_twice();
        return 0;
    }

    say_hello_twice()
    {
        printf("hello");
        printf("hello");
    }

Now what is the declaration? it is just this line:

    say_hello_twice();

Right, it is somewhat simplified. 
