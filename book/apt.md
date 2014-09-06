---
layout: book
title: 使用 apt-get 来安装软件
---

安装软件在 ubuntu 系统上主要有三种方式：

- 手动下载源码或者编译好的软件安装
- 下载 deb 包来安装
- 从 ubuntu 官方的仓库，用 apt-get 下载安装

本集就来说说它们的区别和联系。

# 手动安装

安装 sublimeText 编辑器。<http://sublimetext.com/> 可以直接下载可执行的程序。解压缩自后可以放到系统上的任意位置，比如我们可以

    mv xxx ~/.sublime

可执行程序在那里都可以执行，但是要加路径

    $ ./sublime_text

如果要让它变成一个系统命令，需要移动到 $PATH 中包含的一个目录中，也可以不移动，做个符号链接也行

    $ ln -s ~/.sublime/sublime_text ~bin/subl

注意：ubuntu 下默认 bin 不是 $PATH 的一部分，但是如果你创建了 ~/bin 然后再重启，那就自动添加了。

这样 sublime_text 就安装好了。


手动安装中更为常见的一种形式是下载源码安装。Linux 系统上的软件一般都是开源软件，所以都可以下载到源代码。下载后的操作步骤就是像顺口溜一样的这几步：

    # 下载 gnu hello 做例子
    $ tar jxvf hello.tar.bz2
    $ cd hello
    $ ./configure
    $ make
    $ sudo make install

hello 还是太复杂。我的 happygrep 更简单，便于把道理说清楚。

# 软件 deb 包

- 省去了编译步骤
- 安装后可管理

    $ dpkg -l
    $ dpkg -L packagename
    $ dpkg -S filename
    $ dpkg -remove xxx # 保留配置文件
    $ dpkg -purge xxx # 连配置文件也不留

以 chrome 为例

    $ dpkg -i xxx.deb


打造自己的 deb 包，参考 <http://happycasts.net/episodes/14>

# 软件 apt-get 仓库

- 定期有人为我们更新
- 有人帮我们解决依赖问题
- 自动下载

我们也可以添加其他的仓库进来

当然有时候官方仓库中的包可能并不全，我们也可以添加其他的仓库进来。而且版本可能更新的不是特别及时，如果你必须要用新的版本，有时候也可以自己去下载源码编译安装。

查找需要安装的软件包包名，ubuntu 的仓库的包列表页面：

    $ apt-get search git

自己动手搭建软件仓库：<http://happycasts.net/episodes/15>