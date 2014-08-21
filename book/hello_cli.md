---
layout: book
title: 你好，命令行
---

现在我们一起走入 Linux 命令行的精彩世界。学 Linux 应该说主要就是学命令行，强大的命令行界面是比用鼠标来回比划比划要强一百万倍的利剑，是开发者必备的利剑。相比之下 Windows 下的 dos 批处理就太简陋了，开发中根本没法用。

这一集里，首先带大家选择一款合适的 Linux 操作系统，演示一下如何配置命令行终端软件，然后宏观介绍一下什么是 Linux 系统的命令，应该如何学习各种各样命令。

### 选择操作系统

Linux 其实是分很多版本的，在 <http://en.wikipedia.org/wiki/Linux_distribution> 页面上我们可以看到各个 Linux 的发行版可谓多如牛毛。有 Redhat，CentOS，fedora 等等，但是 Redhat 和 CentOS 主要是在构建企业服务方面见长，我以前服务过的一间公司，其实基本上就是仿效 Redhat 的商业模式的。而在创业领域，观察一下圈子内最著名的 VPS 提供商，例如 aliyun，和国外的 Linode，aws，digitalocean 这些公司，应该说 ubuntu 是最受欢迎的服务器部署平台。另外，如果你像我一样，把 ubuntu 安装在自己的机器上做开发机用，ubuntu 的表现也是非常优秀。

目前我们可以拿到的 ubuntu LTS 长期支持版本有2012年发布的12.04系统，还有2014年4月发布的14.04版，这里我们选择使用12.04。之所以不采用 14.04 是因为他太新，很多东西网上还找不到资料，出了问题不容易解决。同时如果我们到 <https://wiki.ubuntu.com/LTS> 可以看到12.04支持期是5年，所以依旧是目前的依旧是可以放心使用的。可以到 <http://releases.ubuntu.com/12.04/> 的页面上我们可以进行下载。

![](http://media.happycasts.net/pic/lgcb/ubuntu.png)

安装过程可以参考我自己曾经录的一个视频： <http://happycasts.net/episodes/11>

### 打开并设置终端

好，如果我们已经把系统装好，启动之后就是这个样子。

![](http://media.happycasts.net/pic/lgcb/ubuntu_fresh.png)

使用命令行，我们先要打开一个叫做”终端“的软件，这个软件是系统已经预装的了，所以我们可以敲 Super 键（在我这里是右侧的 Cmd 键，如果你用的是 PC，那么可能是你右侧的 window 键）调出快速启动框，敲 terminal 也就是终端的英文，然后回车即可。

其实，终端是指我们打开的这个窗口，里面我们看到的，真正运行的程序叫 shell，shell 有很多种，zsh csh 等等，但是在现在大部分最常见的 Unix 类的系统上，例如,苹果的 Mac 系统，红帽系统，包括我们这里的 ubuntu 系统，使用的都是一种叫 Bash 的 shell。

如果我们在终端里执行

    $ python
    >>>

这样，终端里运行的就不是 bash 了，而是 python 语言。Ctrl-D 可以退出 python 回到 bash 。

下面更改一下终端样式，点击 edit -> profiles

![](http://media.happycasts.net/pic/lgcb/set_profile.png)

打开的界面中点击 “new” 来创建一个新的 profile 比如起名字叫 'imooc' 这样我们就可以随意的设置这个 profile 对应的颜色和字体了，比如，我们把颜色设置为 “black on white”，字体设为 “font-size: 20”，关闭当前选项卡，设置 “Profile used when launching a new terminal:" 为 "imooc"，这样以后每次启动终端的时候，咱们刚才的设置就会被应用了。

当然，我们也可以随时用 ”Ctrl++“ 和 ”Ctrl--" 对终端字体大小进行调整。关闭当前 shell，使用 “Ctrl-D"。

### 打扫场地，准备干活

隐藏启动区

点击启动区的系统设置图标（ systerm settings ），到 Personal -> Appearance 条目下，选择 Behavior，这样就可以点击开启，“Auto hide Launcher" 这个选项即可。

重新显示，可以用右侧的 Cmd 键，我现在的情况是在 Mac 机器上的虚拟机中安装的 Ubuntu，如果你用的是普通 PC 可能相应的就要使用 Window 键了。

删除不必要的目录，这里我们会接触两个命令 ls ( list ) 和 rm （ remove ）

    $ rm -r Document # 这个命令有参数，可以用来做例子，阐述什么是一个命令

显示桌面  到 systerm settings -> keyboard 下面，点击 shortcut，然后找到 navigation 下面的 "hide all normal windows" 这一项，单击右侧的快捷键说明，我一般会改为 Ctrl-Alt-D，关闭后就生效了。

切换工作区的方式来显示桌面，按住 Ctrl+Alt 键，然后敲上下左右就可以了


### 如何学习命令

命令一般都三部分组成，命令本身，命令参数，操作对象。

基本原则不必逐一学习，实际动手中学习就好了。如果要看书，千万不要看手册型的大部的课本，课本通常都讲的太深了而且也是总理论轻动手。也不要看用户手册，用户手册是给已经会用这个工具的人看的。而要看 toturial，像 TLCL 这种： <http://billie66.github.io/TLCL/> 。

对于已经基本学会的命令，如果忘了具体细节，可以使用 manpage

如果要查看 ls 这个命令的文档，我们可以敲

```
man ls
```

然后敲 `/-l` 就可以查找 `-l` 这个参数的意义了，查找下一处，敲 n 。


学习 Linux 的过程中还有一个问题就是很多术语不明白，可以 google，可以使用 wikipedia，不过我哪会学的时候有一个感觉是 wikipedia 给的解释太多太全了，这时候我发现 <http://info.org> 这个网站是非常简单明了，Linux 所涉及的很多最重要的概念这个里面都有。


### 参考资料：

- TLCL 第二章：什么是 shell <http://billie66.github.io/TLCL/book/zh/chap02.html>
- TLCL 第六章：使用命令 <http://billie66.github.io/TLCL/book/zh/chap06.html>
