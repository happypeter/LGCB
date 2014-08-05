---
layout: book-zh
title: Bash 简介
---

## What is a Command?

## 什么叫做“命令”？

A command is merely an instruction provided by a user telling a computer to do
something, such as launch a program. 

命令就是用户向计算机发的指令，告诉计算机完成一个我想要的的任务，比如说给我启动一个程序。

## Why Use The Command Line?

## 为什么要采用“命令行”的方式来操作电脑？

Have you ever noticed in the movies when the "super hacker" sits down at
the computer, he never touches a mouse? It's because movie makers realize that
we, as human beings, instinctively know the only way to really get anything
done on a computer is by typing on a keyboard.

你以前有没有见过在电影里有些超级黑客是怎么操作电脑的，为什么那些人从来都不碰鼠标？因为电影制作人知道, 在普通人的直觉中，如果真正想用电脑干活的话，那唯一的方式就是敲键盘。



Most computer users today are only familiar with the graphical user interface
(GUI) and have been taught that the command line interface (CLI) is a
difficult thing of the past. This is unfortunate, because a good command line
interface is a very expressive way of communicating with a computer in much
the same way the written word is for human beings. It's been said that
"graphical user interfaces make easy tasks easy, while command line interfaces
make difficult tasks possible" and this is still very true today.

当今，大部分的电脑使用者只熟悉图形化的用户界面，而认为命令行是过时的，而且很难。这种看法是不对的，因为只有命令行才是人类和电脑交流的最富表现力的方式，就好象人和人交流的最好方式是使用文字一样。曾经有人这样说：图形化的用户界面可以让用户简便的完成一些简单任务，而对于复杂任务却只能通过敲命令才可能实现。这个说法即使在今天看来也是非常正确的。

## What Is The Shell?  
## 什么是Shell?

When we speak of the command line, we are really referring to the shell.
Shell is something called a "command interpreter". The shell is a program that
takes keyboard commands and passes them to the operating system to carry
out(Funny are the names: _Shell_ on top of _Kernel_). Almost all Linux
distributions supply a shell program from the GNU Project called __bash__, so
does __ubuntu__. 

其实人们所谓的命令行指的就是Shell。Shell
又叫做“命令解释器”，它会读取我们敲的命令，并把这些命令交给操作系统去执行（细想想，这个名字起得挺有意思："壳"
套在 "内核" 上）。几乎所有的Linux发行版都带一个来自GNU项目的Shell，名叫 __Bash__， __ubuntu__ 也不例外。

The name __bash__ is short for "Bourne Again SHell" a program written by Steve
Bourne.  

__bash__ 是 “Bourne Again SHell” 的缩写，作者是 Steve Bourne。

## Terminal Emulators

## 终端仿真器

When using a graphical user interface, we need another program called a
__terminal emulator__ to interact with the shell. If we look through our
desktop menus, we will probably find one. __ubuntu__ by default uses
__gnome-terminal__, though it's likely called simply __terminal__ on our menu.
You can take terminal as nothing but a simple window, it by itself does
nothing but give us access to the shell. 

当我们使用用户图形界面时，我们需要一个叫做 __终端仿真器__ 的程序来和 __shell__ 进行交互。在桌面菜单找一下，就可以找到。 __ubuntu__ 默认使用的是 __gnome-terminal__  ( __终端仿真器__ 的一种），不过通常在桌面菜单上就简称叫 __终端__ 。基本上终端就可以看作一扇窗户，它本身什么也不做，只是把 __shell__ 送入我们的视野。 

## Future Reading 
## 拓展阅读 

- __TLDP:__
  <http://tldp.org/LDP/Bash-Beginners-Guide/html/>

  Nice book, worth reading.

  不错，值得一读。


