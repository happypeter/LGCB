---
layout: book-zh
title: 遍历文件系统 
---

我们需要学习的第一件事（除了打字之外）是怎样在遍历Linux文件系统（在文件系统树中跳转）。这一章将会
介绍以下命令：

- __pwd__   
  
  打印出当前工作目录名
- __cd__     
  
  更改目录
- __ls__     
  
  列出目录内容
                                 

### 理解文件系统树的结构

1.png

在Windows系统中，我们会把硬盘分为多个分区（C盘，D盘...）每个盘的最顶级都是多个文件夹（folder），每个文件夹下面有文件和子文件夹，子亦有孙，孙亦有子，形成一个树形结构。

每个分区会有自己的一个树。而且树的最顶端是多个文件夹。


那么Linux系统下的情况类似，硬盘也会被分为多个分区（partition），但是名字不叫C盘D盘，而是叫sda1，sda2...。文件的组织也是一个树形结构。

2.png

区别是，Linux下把文件夹（folder）叫做目录（directory），而且整个系统不管有多少个分区，文件系统却只会有一个文件系统树。树的顶端是一个目录（名字叫/）。各个硬盘分区都对应自己的一个挂载点（mount point）。

例如，如果我么把sda1挂载到名为`/`的这个目录上（目录其实就是文件系统树上的一个“点”，所以叫做挂载点）。那么由于系统上的所有文件和目录都包含于`/`这个目录之中，所以这样的话我们所有的数据都会存储到sda1这个分区上。

但是，如果我们在此基础之上，把sda2挂载到`/home/`这个目录上，那以后所有`/home/`下的数据就都存在sda2这个分区之上了。
 
##### 根目录（root directory）

3.png

根目录指的是文件系统树的最顶端的名为`/`的这个目录，之所以把它叫根目录，是因为文件系统是一个倒挂的树，`/`是整个树的根（root），所有其他的文件和目录都是由此衍生出的枝蔓。所以根目录也可叫做“老祖宗”目录。

##### 当前工作目录（The Current Working Directory )
文件系统是一棵倒置的大树，我们能够站立在树中间某个点上。
也就是位于一个目录中，我们能够看到这个目录所包含的文件
还有子目录。那么，我们所处的这个目录就叫做“当前工作目录”。
我们使用`pwd`（Print Working Directory，打印工作目录）命令，来显示当前工作目录名。

    $ pwd
      /home/peter/

也可以用`ls`这个命令来列出当前工作目录中的内容。

    $ ls
      a.txt docs

### 绝对路径和相对路径



### 更改当前工作目录（cd）

To change your working directory (where we are standing in our tree) we use
the cd command. To do this, type cd followed by the pathname of the desired
working directory. A pathname is the route we take along the branches of the
tree to get to the directory we want. Pathnames can be specified in one of two
different ways; as absolute pathnames or as relative pathnames. Let's deal
with absolute pathnames first.

更改你的工作目录（目录树中，我们所站之处），使用__cd__命令。为了实现目标，
输入cd命令，其后跟随着所期望的工作目录。路径名就是我们沿着目录树枝干到达
我们所要目录所经过的路线。路径名可以用两种方式来指定，一个是绝对路径名，
另一个是相对路径名。首先处理绝对路径名。

### Absolute Pathnames

### 绝对路径名

An absolute pathname begins with the root directory(/) and follows the tree
branch by branch until the path to the desired directory or file is completed.
For example, there is a directory on your system in which most of your
system's programs are installed. The pathname of the directory is `/usr/bin`.
This means from the root directory (represented by the leading slash in the
pathname) there is a directory called "usr" which contains a directory called
"bin".

一个绝对路径名从根目录（/）开始，其后跟随着一个个枝干（子目录）直到我们
所期望的目录或文件。例如，系统中，有一个目录是大多数程序的安装目录。这个目录
的绝对路径名是“/usr/bin”。这意思是从根目录开始（由路径名中开头的“/”表示），
有一个叫做“usr”的目录，这个目录下包含一个叫做“bin”的子目录。

<div class="code"><pre>
<tt>peter@vostro:~/repo-farm/LGCB/book$ cd /usr/bin
peter@vostro:/usr/bin$ pwd
/usr/bin</tt>
</pre></div>

Now we can see that we have changed the current working directory to
`/usr/bin` and that it is full of files. Notice how the shell prompt has
changed? As a convenience, it is usually set up to automatically display the
name of the working directory.

现在我们可以看到当前工作目录已经改为`/usr/bin`，它其中包含许多文件。注意
shell提示符是怎样改变的？为了方便，通常，设置shell提示符自动显示工作目录名。

### Relative Pathnames

### 相对路径名

Where an absolute pathname starts from the root directory and leads to its
destination, a relative pathname starts from the working directory. To do
this, it uses a couple of special symbols to represent relative positions in
the file system tree. These special symbols are "." (dot) and ".." (dot dot).
The "." symbol refers to the working directory and the ".." symbol refers to
the working directory's parent directory. Here is how it works. Let's change
the working directory to `/usr/bin` again:

一个绝对路径名从根目录开始到达目的地，而相对路径从工作目录开始。文件系统使用几个
特殊的符号来表示在文件系统树中的相对位置。这些特殊符号是“.”（点）和“..”（点点）。
这个“.”符号是指工作目录，而“..”符号是指工作目录的父目录。下面的例子展示了它是
怎样工作的。再次把工作目录更改到`/usr/bin`:

<div class="code"><pre>
<tt>peter@vostro:~/repo-farm/LGCB/book$ cd /usr/bin
peter@vostro:/usr/bin$ pwd
/usr/bin</tt>
</pre></div>

Okay, now let's say that we wanted to change the working directory to the
parent of `/usr/bin` which is `/usr`. We could do that two different ways. Either
with an absolute pathname:

好的，现在比方说我们想把工作目录改到父目录`/usr`。可以用两种不同的方式来实现目的。
或者使用绝对路径名：

<div class="code"><pre>
<tt>peter@vostro:/usr/bin$ cd /usr/
peter@vostro:/usr$ pwd
/usr</tt>
</pre></div>

Or, with a relative pathname:

或者使用相对路径名：

<div class="code"><pre>
<tt>peter@vostro:/usr/bin$ cd ..
peter@vostro:/usr$ pwd
/usr</tt>
</pre></div>

different methods with identical results. Which one should we use? The one
that requires the least typing!  Likewise, we can change the working directory
from `/usr` to `/usr/bin` in two different ways. Either using an absolute
pathname:

不同的方法取得相同的结果。那么我们使用哪一种方法呢？选择要求输入最少字符的那个。
同样地，把工作目录从`/usr`更改到`/usr/bin`也有两种不同的方式。一个使用绝对路径名：

<div class="code"><pre>
<tt>peter@vostro:/usr$ cd /usr/bin/
peter@vostro:/usr/bin$ pwd
/usr/bin</tt>
</pre></div>

Or, with a relative pathname:

另一个，使用相对路径名：

<div class="code"><pre>
<tt>peter@vostro:/usr$ cd ./bin/
peter@vostro:/usr/bin$ pwd
/usr/bin</tt>
</pre></div>

there is something important that I must point out here. In almost all cases,
you can omit the "./". It is implied. Typing:

在这里，我必须提醒大家一件很重要的事情。在几乎所有情况下，你可以省略“./”，这是
隐含的。输入：

<div class="code"><pre>
<tt>peter@vostro:/usr$ cd bin/
peter@vostro:/usr/bin$ pwd
/usr/bin</tt>
</pre></div>

does the same thing. In general, if you do not specify a pathname to
something, the working directory will be assumed.

效果一样。通常，如果你不指定路径名，那么会假定是工作目录。

### Some Helpful Shortcuts

### 快捷键

- __cd__    Changes the working directory to your home directory.

  更改工作目录到你的主目录。

- __cd -__  Changes the working directory to the previous working directory.

  更改工作目录到先前的工作目录。

### Important Facts About Filenames

### 关于文件名的重要规则
 
1. Filenames that begin with a period character are hidden. This only means
   that ls will not list them unless you say ls -a. When your account was
   created, several hidden files were placed in your home directory to
   configure things for your account. Later on we will take a closer look at
   some of these files to see how you can customize your environment. In
   addition, some applications place their configuration and settings files in
   your home directory as hidden files.

2. Filenames and commands in Linux, like Unix, are case sensitive. The
   filenames "File1" and "file1" refer to different files.

3. Linux has no concept of a “file extension” like some other operating
   systems.  You may name files any way you like. The contents and/or purpose
   of a file is needed by other means. Although Unix-like operating system don’t
   use file extensions to determine the contents/purpose of files, some
   application programs do.

4. Though Linux supports long filenames which may contain embedded spaces, do
   NOT embed spaces in filenames. If you want to represent spaces between
   words in a filename, use underscore characters. You will thank yourself
   later.

<ol>
<p><li>文件名以圆点开头的文件是隐藏文件。这只意味着，ls命令不会列出它们，除非你使用
`ls -a`命令。当你的用户帐号创建之后，几个隐藏文件会放置到你的主目录下，这些文件是
关于你帐号的配置文件。稍后，我们会仔细研究这些文件，看一下怎样定制自己的工作环境。
除此之外，一些应用程序也会把它们的配置和设置文件以隐藏文件的形式放置到你的主目录下。</li></p>

<p><li>Linux中的文件名和命令名，如Unix中的一样，是大小写敏感的。文件名“File1”和“file1”
是指不同的文件。</li></p>

<p><li>Linux中没有“文件扩展名”这个概念。你可以用任何你喜欢的方式来给文件命名。文件内容或
文件用途由其它方法决定。虽然在类似Unix的操作系统中，不用文件扩展名来决定文件的内容或
用途，但是一些应用程序却采用这种方法。</li></p>

<p><li>虽然Linux支持长文件名，文件名中可能嵌入了空格，但是不要这样做。如果你想要表示，
文件名中两个单词之间的空隙，使用下划线来代替。你将会感激你自己，如果你这样做的话。</li></p>
</ol>


