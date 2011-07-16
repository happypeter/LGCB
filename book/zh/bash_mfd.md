---
layout: book
title: Manipulating Files And Directories
---


At this point, we are ready for some real work! This lesson will introduce
the following commands:
        
- __cp__ 
  
  Copy files and directories

- __mv__ 
  
  Move/rename files and directories

- __mkdir__ 
  
  Create directories

- __rm__ 
  
  Remove files and directories

These five commands are among the most frequently used Linux commands. They
are used for manipulating both files and directories.  Now, to be frank, some
of the tasks performed by these commands are more easily done with a graphical
file manager. With a file manager, we can drag and drop a file from one
directory to another, cut and paste files, delete files, etc. So why use these
old command line programs?  

The answer is power and flexibility. While it is
easy to perform simple file manipulations with a graphical file manager,
complicated tasks can be easier with the command line programs. For example,
how could we copy all the HTML files from one directory to another, but only
copy files that do not exist in the destination directory or are newer than
the versions in the destination directory? Pretty hard with with a file
manager. Pretty easy with the command line:

    cp -u *.html destination/


## Wildcards

Before we begin using our commands, we need to talk about a shell feature that
makes these commands so powerful. Since the shell uses filenames so much, it
provides special characters to help you rapidly specify groups of filenames.
These special characters are called wildcards. Using wildcards (which is also
known as globing) allow you to select filenames based on patterns of
characters. The table below lists the wildcards and what they select:

- Matches any characters, use:

    *


- Matches any single character

    ?

check this 
<http://www.linfo.org/wildcard.html>
if you want to know more

## __mkdir__ : Create Directories

The mkdir command is used to create directories. It works like this:

    mkdir directory...

A note on notation: When three periods follow an argument in the description
of a command (as above), it means that the argument can be repeated, thus:

    mkdir dir1

would create a single directory named "dir1", while

    mkdir dir1 dir2 dir3

would create three directories named "dir1", "dir2", and "dir3".

## __cp__ : Copy Files And Directories

The cp command copies files or directories. It can be used two different ways:

     cp item1 item2

to copy the single file or directory "item1" to file or directory "item2"

some examples:

cp all files in a directory into another directory

    peter@vostro:~/xxx$ tree
    .
    |-- des
    `-- sou
        |-- a.html
        `-- b.html

    2 directories, 2 files
    peter@vostro:~/xxx$ cp sou/* des/
    peter@vostro:~/xxx$ tree
    .
    |-- des
    |   |-- a.html
    |   `-- b.html
    `-- sou
        |-- a.html
        `-- b.html

    2 directories, 4 files
    peter@vostro:~/xxx$ 

Using a wildcard, all the files in `sou` are copied into `des`. `des` must
already exist.


Copy a directory and everything in it to somewhere:


    peter@vostro:~/xxx$ tree
    .
    |-- des
    `-- sou
        |-- a.html
        `-- b.html

    2 directories, 2 files
    peter@vostro:~/xxx$ cp -r sou/ des/
    peter@vostro:~/xxx$ tree
    .
    |-- des
    |   `-- sou
    |       |-- a.html
    |       `-- b.html
    `-- sou
        |-- a.html
        `-- b.html

    3 directories, 4 files
    peter@vostro:~/xxx$ 

See the difference, ah?

## __mv__ : Move And Rename Files
The mv command performs both file moving and file renaming, depending on how
it is
used. In either case, the original filename no longer exists after the
operation. mv is used
in much the same way as cp:

    mv item1 item2

To move or rename file or directory "item1" to "item2" or:

    mv item... directory

To move one or more items from one directory to another.

## __rm__ : Remove Files And Directories

The rm command is used to remove (delete) files and directories:

    rm item...

where "item" is one or more files or directories.

Example:

    peter@vostro:~/xxx$ ls
    des  sou
    peter@vostro:~/xxx$ rm des/
    rm: cannot remove `des/': Is a directory
    peter@vostro:~/xxx$ rm -r des/
    peter@vostro:~/xxx$ ls
    sou
    peter@vostro:~/xxx$ 

you need `-r` to remove a directory, but for deleting a file it is not needed,
like in:


    peter@vostro:~/xxx$ tree
    .
    `-- sou
        |-- a.html
        `-- b.html

    1 directory, 2 files
    peter@vostro:~/xxx$ rm sou/a.html 
    peter@vostro:~/xxx$ tree
    .
    `-- sou
        `-- b.html

    1 directory, 1 file

Be careful with __rm__!  Unix-like operating systems such as Linux do not have
an undelete command.  Once you delete something with rm, it's gone. Linux
assumes you're smart and you know what you're doing.


