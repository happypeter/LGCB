---
layout: default
---
# Navigation

The first thing we need to learn to do (besides just typing) is how to
navigate the file
system on our Linux system. In this chapter we will introduce the following
commands:

- `pwd`    - Print name of current working directory
- `cd`     - Change directory
- `ls`     - List directory contents
                                 
## Understanding The File System Tree
Like Windows, a Unix-like operating system such as Linux organizes its files
in what is called a _hierarchical directory structure_. This means that they are
organized in a tree-like pattern of directories (sometimes called folders in
other systems), which may contain files and other directories. The first
directory in the file system is called the root directory. The root directory
contains files and subdirectories, which contain more files and subdirectories
and so on and so on.  

Note that unlike Windows, which has a separate file
system tree for each storage device, Unix-like systems such as Linux always
have a single file system tree, regardless of how many drives or storage
devices are attached to the computer. Storage devices are attached (or more
correctly, mounted) at various points on the tree according to the whims of
the system administrator, the person (or persons) responsible for the
maintenance of the system.  The Current Working Directory Most of us are
probably familiar with a graphical file manager which represents the file
system tree as in Figure 1. Notice that the tree is usually shown upended,
that is, with the root at the top and the various branches descending below.


![tree](./images/tree.png)
