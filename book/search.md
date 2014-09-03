---
layout: book
title: 查找
---

作为开发者，每天都在敲敲打打一些文件。每天我们在编辑器里都会搞上几百次的动作：如何快速找到一个文件或者特定字符串，这里看看如何在命令行里实现。

本集主要涉三个命令：

- locate 在全系统范围内定位一个文件
- find 在一个目录之内定位一个文件
- grep 查找一个字符串

要聊的内容分三部分：

1. locate
2. find
3. happygrep

### locate

先来个超级简单的。

      locate pattern

这样会找到系统上的任何路径中包含 pattern 的文件和目录，用通配符表示就是 *pattern* ( pattern 前后可以有0个或是多个任意字符)。

举个例子

    $ locate vimrc

如果要实现更为精确的搜索，可以用 --regexp 选项后面跟正则表达式。

但是，我们也会遇到奇怪的现象，比如现在有一个文件叫 happygrep.c ，但是如果运行 locate 去查找却找不到，奇怪，奇怪。

![](http://media.happycasts.net/pic/lgcb/locate.png)

这个就要说到 locate 命令的运行原理了，打开它的 manpage

    $ man locate

这里面有一句：“ locate 查找的是由 updatedb 这个命令生成的数据库“，这个也解释了为何 locate 找东西会那么快。

可惜，updatedb 命令一般每天自动运行一次。所以最近我们才创建的文件是找不到的，解决方法，也简单，手动运行一下

    $ updatedb

就好了。

### find

find 命令就是你给它指定一个目录，它就帮你翻个底朝天。

![](http://media.happycasts.net/pic/lgcb/find.png)

这里有一个目录 mydir，里面的情况是

    $ ls
    a.txt
    a.c
    b.txt
    subdir/

在当前目录找到文件名中包含 string 的文件

    $ cd mydir
    $ find .|grep .txt

还可以指定文件类型来进行筛选

    $ find . -type f

find 找到文件是为了操作文件

    $ find . -type f -exec ls -l '{}' ';'

打印当前目录下，所有包含字符串 string 的文件，以及行号

    $ find . -exec grep string '{}' ';'

打印出行号

    $ find . -exec grep -n string '{}' ';'

打印出文件名

    $ find . -exec grep -n string '{}' ';' -print


另外，实现一个代码项目目录内查找，ack-grep 比 grep 方便。参考 <http://happycasts.net/episodes/26>

### happygrep

上面 find 命令的输出有点乱，不好看。而且我也希望能很快的用编辑器打开那一行，所以就自己写了个工具


<https://github.com/happypeter/happygrep>

    $ cd edocs
    $ xxx keynote


![](http://media.happycasts.net/pic/lgcb/happygrep.png)

如果我们使用 vim 或 sublime 这样强大的代码编辑器，那么类似于 happygrep 的这种操作是可以在编辑器内部实现的。

要聊的就是这些啦，更多内容大家参考：

- 查找 ch18 <http://billie66.github.io/TLCL/book/zh/chap18.html>
- 正则表达式 ch20 <http://billie66.github.io/TLCL/book/zh/chap20.html>