---
layout: book
title: 使用 apt-get 来安装软件
---

首先返璞归真，介绍如何用手动编译安装的方式来弄，然后介绍这个过程可以如何通过打包的方式来自动化，最后给出 repo 的概念，这样就引出了 apt-get 的使用。

### 手动安装

可以用 happygrep 为例子


apt-get dpkg 都怎么用，package 是个什么东西，repo 指的是啥

介绍一些 sublimeText 的下载安装，展示一下

    $ ln -s ~/.sublime bin/subl

ubuntu 下默认 bin 不是 $PATH 的一部分，但是如果你创建了 ~/bin 然后再重启，那就自动添加了。

也有的软件因为不满足必要的开源使用协议，是需要手动安装的，例如 chrome

### 下载软件包

- 省去了编译步骤
- 安装后可管理

    $ dpkg -l
    $ dpkg -L packagename
    $ dpkg -S filename
    $ dpkg -remove xxx # 删的干净利落

以 chrome 为例

    $ dpkg -i xxx.deb


### 从软件仓库安装

- 定期有人为我们更新
- 有人帮我们解决依赖问题
- 自动下载

我们也可以添加其他的仓库进来

当然有时候官方仓库中的包可能并不全，我们也可以添加其他的仓库进来。而且版本可能更新的不是特别及时，如果你必须要用新的版本，有时候也可以自己去下载源码编译安装。