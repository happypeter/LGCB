---
layout: book
title: 进程
---

每当我启动一个程序，系统就会对应启动一个进程。本课介绍进程的基本操作，包括查看进程号，后台执行，以及当程序运行出现故障的时候，如何杀死进程。

### 获取进程号

Linux 系统上有一个命令叫 ps 用来查看当前系统上的进程。打开终端，运行 vim 程序，这样这个程序会一直占据当前这个 shell 一直在那里运行。现在我们来开启一个新的终端标签，使用快捷键 shift-ctrl-t 。关于如何自定制终端快捷键可以查看 edit -> keyboard shortcuts

查看系统当前所有进程，要加 aux 参数，注意没有 - 。在新打开的 shell 里输入

    $ ps aux

内容不少，可以用 less 来做分页器，从开头查看

    $ ps aux|less

这样我们看到，第一个字段 USER 代码是哪个用户执行的这个进程，第二个 PID （ Porcess ID ）就是我们要的进程号了。敲 `/vim` 可以查找到我们想要找得 vim 这个进程。其他那些内容我不太关心，表 11-1，11-2 上也有清晰的说明。<http://billie66.github.io/TLCL/book/zh/chap11.html>

当你知道那一部分代表进程好之后，后面一般用管道线加 grep 来进行查找

    $ ps aux|grep vim

拿到进程好，我们就可以对这个进程进行操作了，比如可以结束这个进程

    $ kill 2345

### 后台执行

启动 firefox ( chrome 会报很多 Log 出来，太难看)，直接后台启动

    $ firefox &

如果不小心直接在前台启动了，那么当前这个 shell 就会被一直占据

    $ firefox

要把这个程序变成后台执行也是可以的，先用 Ctrl-Z 讲它挂起，然后

    $ bg

想让程序重新回到前台

    $ fg

这样就可以用 Ctrl-C 来关闭了

当然我们一般还是用快速启动栏来启动这些 GUI 程序，这样就不涉及上面的问题了。

### kill 进程

    ps aux|grep vim
    kill -9 vim
    killall vim

Ctrl-C 和 kill PID 不加参数发出的信号是不一样的，表 11-4，但是他们的作用都是去结束一个还活着的进程。
如果进程已经死了，那么要用 kill -9 PID 强行 kill 。但是极端情况下也有这样的情况

    Control-Alt-F1
    Control-Alt-F7 back to GUI 如果 GUI 彻底死掉了，那么可以用这种方法来杀进程

