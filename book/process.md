---
layout: book
title: 进程
---

错略的，我们可以认为系统每启动一个程序，就对应启动一个进程。本课介绍进程的基本操作，包括查看进程号，后台执行，以及当程序运行出现故障的时候，如何杀死进程。

### 获取进程号

    $ ps aux|grep vim

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

