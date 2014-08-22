---
layout: book
title: 基本文件和目录操作
---

理论部分大家自己看书，视频里面我们带大家实际动动手，完成一些常用的操作。


### 日常文件操作
大家平时用鼠标干的活，这里咱们用敲命令的方式快速做一遍。要覆盖到得内容包括：

复制文件目录

    $ cp -r dir1 dir2
    $ cp file1 file2

移动文件目录

    $ mv dir1 Desktop/dir1

重命名文件目录

    $ mv file1 file2
    $ mv dir1 dir2

删除文件目录

    $ rm file
    $ rm -r dir

创建文件目录

    $ mkdir dir
    $ touch file
    $ >file
    $ vim file

查看文件内容

    $ cat file # 适合比较短的文件
    $ less file # 有快捷键，可以看比较长的文件
    $ tail -f tmp.log # 开启另一个终端，执行 echo "first line" >> tmp.log 看看效果

创建快捷方式（符号链接） ln -s

    $ ln -s source symlink # 如果不加 -s 则创建”硬链接“
      # 参考：TLCL

查看文件类型 fiie

    $ file symlink
    $ file file1
    $ file dir1

- http://billie66.github.io/TLCL/book/zh/chap04.html
  - 这部分内容，前面的视频中已经让大家看了

### 通配符的使用

- http://billie66.github.io/TLCL/book/zh/chap05.html
  - wildcard 的细节
