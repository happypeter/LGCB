---
layout: book
title: 你好，命令行
---

这一集里面，我们主要带大家走人 Linux 命令行的精彩世界，首先介绍如何选择一款合适的 Linux 操作系统，然后是命令行终端软件的基本配置操作。

### 安装操作系统

之所以不采用 14.04 是因为他太新，很多东西网上还找不到资料

12.04 支持期是 5 年，https://wiki.ubuntu.com/LTS，所以依旧是目前的最佳选择

<http://releases.ubuntu.com/12.04/> 的页面上我们可以进行下载

![](http://media.happycasts.net/pic/lgcb/ubuntu.png)

安装过程可以参考：
http://happycasts.net/episodes/11

### 启动命令行

打开 terminal，终端是指我们打开的这个窗口，里面运行的程序叫 shell，shell 有很多种，zsh csh 等等，但是在现在大部分最常见的 Unix 类的系统上，例如,苹果的 Mac 系统，红帽系统，包括我们这里的 ubuntu 系统，使用的都是一种叫 Bash 的 shell

下面更改 profile
edit->profiles-> new profile 'imooc' ->
颜色设置为 black on white
font-size: 20

Ctrl++

Ctrl-D 关闭一个 shell


### 隐藏启动区

点击启动区的系统设置图标（ systerm settings ），到 Personal -> Appearance 条目下，选择 Behavior，这样就可以点击开启，“Auto hide Launcher" 这个选项即可。

重新显示，可以用右侧的 Cmd 键，我现在的情况是在 Mac 机器上的虚拟机中安装的 Ubuntu，如果你用的是普通 PC 可能相应的就要使用 Window 键了。


### 删除不必要的目录

显示桌面  到 systerm settings -> keyboard 下面，点击 shortcut，然后找到 navigation 下面的 "hide all normal windows" 这一项，单击右侧的快捷键说明，我一般会改为 Ctrl-Alt-D，关闭后就生效了。

切换工作区的方式来显示桌面，按住 Ctrl+Alt 键，然后敲上下左右就可以了


### 为什么要使用命令行？

不要给大家讲命令分那四类，就告诉大家
http://billie66.github.io/TLCL/book/zh/chap06.html 有详细的说明就好了。

### 如何学习这些命令

基本原则不必逐一学习，实际动手中学习就好了，如果要看书，千万不要看手册型的大部头数，而要看 toturial，像 TLCL 这种

对于已经基本学会的命令，如果忘了具体细节，可以使用 manpage

如果要查看 ls 这个命令的文档，我们可以敲

学习 Linux 的过程中还有一个问题就是很多术语不明白，可以 google，可以使用 wikipedia，不过我哪会学的时候有一个感觉是 wikipedia 给的解释太多太全了，这时候我发现 <Linfo.org> 这个网站是非常简单明了。

```
man ls
```

/-xxx n


### 参考资料：

- TLCL 第二章 : 什么是 shell <http://billie66.github.io/TLCL/book/zh/chap02.html>
- 第六章：使用命令 <http://billie66.github.io/TLCL/book/zh/chap06.html>
