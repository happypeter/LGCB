---
layout: book
title: Permissions
---

这节课要讨论的是Linux下的权限问题。比如我们试图删除一个文件

    peter@cat:~$ rm /bin/sh
    rm: cannot remove `/bin/sh': Permission denied

但是操作失败了，原因是“权限”(Permission)不够，那么

## 什么是“权限”？
用户对文件通常具有“读”，“写”，“执行”
三种权限，当然Linux系统还规定了其他一些权限，不常用。

<img src="images/bash_perm/1.png" />
