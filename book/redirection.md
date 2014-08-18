---
layout: book
title: 重定向
---

In this lesson we are going to check what may be the coolest feature of the
command line. It's called _I/O redirection_.

这章我们将会见到可能是命令行最酷的部分——_输入输出重定向_。

_I/O Redirection_ redirects data. Simple enough, ah? But from where to where?
Before we talk about this, we need to understand this:

_输入输出重定向_  把数据重定向。很简单是吧？但是从哪儿重定向到哪儿呢？
在讨论这个问题之前，我们必须明白这些东西：

## Standard Input, Output, And Error
Many of the programs that we have used so far produce output of some kind.
This output often consists of two types.

### 标准输入，标准输出，标准错误

我们至今使用的很多程序提供某种输出。这些输出基本包括两种形式：

- First, we have the program's results; that is, the data the program is
  designed to produce

- 首先，我们会得到程序运行的结果，指的是那些程序被设计来给出的用户要的东西。

- Second, we have status and error messages that tell us how the program is
  getting along

- 其次，我们会得到告诉我们程序运行得怎么样的状态信息和错误信息。


Keeping with the Unix theme of "everything is a file," programs such as ls
actually send their results to a special file called standard output (often
expressed as stdout) and their status messages to another file called standard
error (stderr). By default, both standard output and standard error are linked
to the screen and not saved into a disk file.  In addition, many programs take
input from a facility called standard input (stdin) which is, by default,
attached to the keyboard.

Unix的传统是“一切都是文件”（"everything is a file"）。像 ls 这样的程序事实上
把它们的结果送到一个叫做标准输出（standard outout, 常作 stdout ）的文件，
把它们的错误信息送到另一个叫做标准错误（ standard error, 常作 stderr ）的文件。
默认情况下，标准输出和标准错误都输出到屏幕上而不会保存在磁盘上。另外，很多程序
从一个叫做标准输入（ standard input, 常作 stdin ）的设备读入数据，默认情况下
就是键盘。

I/O redirection allows us to change where output goes and where input comes
from.  Normally, output goes to the screen and input comes from the keyboard,
but with I/O redirection, we can change that.

输入输出重定向允许我们决定从哪儿输入，往哪儿输出。一般来说，从键盘输入，往屏幕
上输出。但有了输入输出重定向，我们就可以改变这一点了。


           +------------+              +------------+
           |  keyboard  |              |   screen   |
           +-----+------+              +------------+
                 |                          ^  ^
                 |                          |  |
                 v                 +--------+  +--------+
           +-----+-----+     +-----+------+      +------+-----+
           |   stdin   |     |   stdout   |      |   stderr   |
           +-----------+     +------------+      +------------+

## Pipes
## 管道

Pipe is a form of redirection that is used to send the output of one program
to another program for further processing.

管道是重定向的一种，它被用来在程序之间传递输出以达到进一步处理数据的目的。

    command1|command2

For example:
例如：

    peter@vostro:~$ ls /bin/ |grep zip
    bunzip2
    bzip2
    bzip2recover
    gunzip
    gzip

把 ls /bin/ 的输出中包含“zip”的行筛选出来了。
