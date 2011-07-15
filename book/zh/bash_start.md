---
layout: book
title: 开始bash之旅 
---

So let's get started. Launch the terminal emulator! Once it comes up, we
should see something like this:

让我们开始bash之旅吧。启动终端仿真器！一旦它运行起来，我们应该能看到类似
下面的提示信息：

<div class="code"><pre>
<tt>peter@vostro:~$ </tt>
</pre></div>

This is called a shell prompt and it will appear whenever the shell is ready
to accept input.  it will usually include your "username@machinename", followed
by the current working directory (more about that in a little bit) and a
dollar sign. As above shows, "peter" is "username", and "vostro" is the name
of my machine.

这叫做shell提示符，当shell准备好接受输入的时候，它就会出现。通常，它包括你的
“用户名＠主机名”，其后是当前工作目录（关于它的内容要多一点），和一个美元符号。
如上所示，“peter”是“用户名”，“vostro”是我主机的名字。

## Your First Keystrokes

## 第一次按键

Assuming that things are good so far, let's try some typing. Type some junk at
the prompt like so:

假定到目前为止，事情进展顺利，让我们试着输入一些东西。输入一些没有意义的字符，
如下所示：

<div class="code"><pre>
<tt>peter@vostro:~$ sddsdss
sddsdss: command not found</tt>
</pre></div>

Since this command makes no sense, the shell will tell us "command not found"

因为这个命令没有任何意义，所以shell会告诉我们“命令没有找到”。

## Command History

## 命令历史
If we press the up-arrow key, we will see that the previous command "sddsdss"
reappears after the prompt. This is called command history. Most Linux
distributions remember the last five hundred commands by default. Press the
down-arrow key and the previous command disappears.

如果我们按下上箭头按键，我们会看到前一个命令会重新出现在提示符之后。这就叫做命令
历史。默认情况下，大多数Linux发行版可以记得最后运行过的500个命令。按下下箭头按键，
前一个命令消失。

## Cursor Movement

## 移动光标
Recall the previous command with the up-arrow key again. Now try the left and
right- arrow keys. See how we can position the cursor anywhere on the command
line?  This makes editing commands easy.

再次按下上箭头按键，得到上一个命令。现在，试试左右按键。看一下我们怎样在命令行中
移动光标。这样可以轻松地编辑命令。

## Try Some Simple Commands

## 试试一些简单命令
Now that we have learned to type, let's try a few simple commands. The first
one is __date__. This command displays the current time and date.

尽然我们已经知道怎样输入命令了，那么试试执行一些简单的命令吧。第一个命令是__data__。
这个命令显示当前时间和日期。

<div class="code"><pre>
<tt>peter@vostro:~$ date
Tue Jan 18 21:46:56 CST 2011</tt>
</pre></div>

Now Linux command line is no longer a stranger to you.

现在，Linux命令行对你来说就不再陌生了。
