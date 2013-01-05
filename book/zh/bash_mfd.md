---
layout: book-zh
title: 操作文件和目录
---


At this point, we are ready for some real work! This lesson will introduce
the following commands:
这时候，我们已经准备好做些实际点的事情了。这章将会介绍以下命令：
        
- __cp__ 
  
  Copy files and directories
  复制文件和目录

- __mv__ 
  
  Move/rename files and directories
  移动或重命名文件和目录

- __mkdir__ 
  
  Create directories
  新建目录

- __rm__ 
  
  Remove files and directories
  删除文件和目录

These five commands are among the most frequently used Linux commands. They
are used for manipulating both files and directories.  Now, to be frank, some
of the tasks performed by these commands are more easily done with a graphical
file manager. With a file manager, we can drag and drop a file from one
directory to another, cut and paste files, delete files, etc. So why use these
old command line programs?  
这是五个在Linux中用得最平凡的命令。它们可以来操作文件和目录。实事求是地说用这些
命令能处理的某些任务还不如在图形界面里那么简单。用图形界面的文件管理器，我们可以
吧文件从一个目录里拖出来，放到另一个里面，可以剪切和粘贴文件，可以删除文件等等。
那么，为什么要用这些古老的命令行程序呢？

The answer is power and flexibility. While it is
easy to perform simple file manipulations with a graphical file manager,
complicated tasks can be easier with the command line programs. For example,
how could we copy all the HTML files from one directory to another, but only
copy files that do not exist in the destination directory or are newer than
the versions in the destination directory? Pretty hard with with a file
manager. Pretty easy with the command line:
答案是命令行的强大和灵活性。尽管用一个图形界面的文件管理器来操作单个文件会更
方便，操作多个文件的时候用命令行却更简单。举个例子说，我们怎样从一个目录里把
所有的HTML文件拷贝到另一个目录里，并且只拷贝目标目录里没有的或者比目标目录里
更新的文件？用图形界面的文件管理器相当宽难，用命令行则相当简单：


    cp -u *.html destination/


## Wildcards
## 通配符

Before we begin using our commands, we need to talk about a shell feature that
makes these commands so powerful. Since the shell uses filenames so much, it
provides special characters to help you rapidly specify groups of filenames.
These special characters are called wildcards. Using wildcards (which is also
known as globing) allow you to select filenames based on patterns of
characters. The table below lists the wildcards and what they select:
在我们开始用我们的命令行之前，我们必需先讨论一下一个使命令变得如此强大的shell
元素——通配符。鉴于shell如此频繁地使用文件名，它提供了特殊的字符帮助用户快速地
描述若干组文件名。这些特殊的字符就是通配符(wildcards/globing)。通过使用通配符，
用户可以通过基于几个字符的模式来选择文件名。

- Matches any characters, use:
- 我们用这个字符来匹配任何及数量的字符：

    *


- Matches any single character
- 我们用这个字符来匹配任何单个字符：

    ?

check this 
<http://www.linfo.org/wildcard.html>
if you want to know more
看看这个
<http://www.linfo.org/wildcard.html>
如果你想知道更多（那当然！）

## __mkdir__ : Create Directories
## __mkdir__ : 新建目录

The mkdir command is used to create directories. It works like this:
命令 mkdir 被用来新建目录。它被这样使用：

    mkdir directory...

A note on notation: When three periods follow an argument in the description
of a command (as above), it means that the argument can be repeated, thus:
一个记号的约定：当三个句号（...）跟在一个命令示例的参数后面（就像上面那样）的
时候，它意味着那个参数可以重复，所以：

    mkdir dir1

would create a single directory named "dir1", while
将会新建一个叫做“dir1”的目录，而

    mkdir dir1 dir2 dir3

would create three directories named "dir1", "dir2", and "dir3".
将会新建三个目录，分别叫做“dir1”，“dir2”，“dir3”。

## __cp__ : Copy Files And Directories
## __cp__ : 复制文件和目录

The cp command copies files or directories. It can be used two different ways:
命令 cp 被用来复制文件和目录。它可以通过以下两种方式被使用：

     cp item1 item2

to copy the single file or directory "item1" to file or directory "item2"
这样能把单个叫做“item1”的文件或目录复制到一个叫做“item2”的文件或目录

some examples:
举几个例子：

cp all files in a directory into another directory
把一个目录里所有文件复制到另一个目录里

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
以上命令用了一个通配符，所有“sou”目录里的文件都被复制到了“des”里面，前提是
“des”目录必须事先存在。


Copy a directory and everything in it to somewhere:
复制一个目录以及其中所有东西到另一个地方：


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
观察到不同了吗？

## __mv__ : Move And Rename Files
## __mv__ : 移动和重命名文件

The mv command performs both file moving and file renaming, depending on how
it is
used. In either case, the original filename no longer exists after the
operation. mv is used
in much the same way as cp:
命令 mv 被用来移动和重命名已经存在的文件，具体功能由使用方法决定。不论哪种
用法，在操作进行之后原来的文件名就不复存在了。 mv 用法和 cp 很像：


    mv item1 item2

To move or rename file or directory "item1" to "item2" or:
这样可以移动或重命名文件或目录“item1”为“item2”。或者：

    mv item... directory

To move one or more items from one directory to another.
这样可以移动多个文件。

## __rm__ : Remove Files And Directories
## __rm__ : 删除文件和目录

The rm command is used to remove (delete) files and directories:
命令 rm 被用来删除（remove/delete）文件和目录：

    rm item...

where "item" is one or more files or directories.
其中“item”是一个或多个文件或目录。

Example:
举例来说：

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
删除目录的时候需要加上“-r”选项，但是删除普通文件的时候不需要。想这样：


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
使用 __rm__ 命令的时候一定要当心！类Unix操作系统如Linux没有恢复已删除文件的命令。
一旦你用 rm 删除了什么东西，就找不回来了。因为Linux假设你是足够聪明的，能够意识
到自己在做什么。


