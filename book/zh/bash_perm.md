---
layout: book-zh
title: 权限
---

### 什么是“权限”？
<div class="slide">
  <img src="/LGCB-assets/bash/perm_1.png" />
</div>
用户对文件通常具有“读”，“写”，“执行”
三种权限，当然Linux系统还规定了其他一些权限，不常用。
<div class="slide">
  <img src="/LGCB-assets/bash/perm_2.png" />
</div>
Linux是一个多用户的操作系统，也就是很多用户可能同时使用一台计算机.
对于一个特定文件，系统会为他指定一个特定的用户(user)作为它的所有者(owner)。  同时也一定会指定一个由一个或多个人组成的group，作为这个文件的所有者组(owner group), 严格的术语就叫组(group). 这两类之外的其他用户呢，就是所谓的第三类人了，叫world.这三类人各自的权限多少是可以任意指定的, 不一定谁多谁少，当然一般来讲owner的权限会多一些。
强调一下，就是在Linux系统中owner
是否属于这个group呢？可能属于，也可能不属于。
<div class="slide">
  <img src="/LGCB-assets/bash/perm_3.png" />
</div>
Linux对同一文件的权限控制，也是分了这三类人进行讨论的。权限问题基本上就是要讨论，所有者(owner) 对文件的是否具有“读”，“写”，“执行”的权限。同样，如果对组(group 或者叫owner group)，和其他人(world)的相应讨论也完成了，那权限就明晰了。

### 文件模式（file mode）
<div class="slide">
  <img src="/LGCB-assets/bash/perm_4.png" />
</div>
那么我们回到实际的理论。对于文件权限的规定是通过filemode来规定的。

如果我们执行`ls -l a.txt`,
得到的输出中，我们先看一下前10个字符，第一个`-`是关于“文件类型”的，常见的情况有，`l` 表示符号链接，`d` 表示该文件是个目录，`-` 表示普通文件。

`1` 表示的是硬链接(link)的数目。前后两个`peter`分别代表拥有者(owner)名和组(group)名。`0`是文件大小，以字节为单位，这里明晰是个空文件。后面是最后修改时间。

那剩下的9位就是“文件模式”。可以分位三组。第一组（前3位）规定的是owner对该文件的权限，第一位表示owner对该文件是否有读权限,r 表示有，-表示没有，第二位表示owner对该文件是否具有写权限，w代表有，- 代表没有，第三位表示owner对该文件是否具有执行的权限，x代表有，- 代表没有。中间三位代表group的情况，最后三位是对其他人（world）。这里，owner对该文件只有“读"和“写”的权限。那组和其他用户都只有读权限。


<div class="slide">
  <img src="/LGCB-assets/bash/perm_5.png" />
</div>
如果我们要对目录(directroy)查看权限的话

    ls -ld mydir

同样是读写执行三种权限，对于普通文件和目录代表的意义是有差异的。

读权限对两者的效果类此，用户对文件有读权限，意味着用户可以查看文件的具体内容

    cat a.txt
    less a.txt
    vim a.txt

这些操作都可以看到文件内容。对目录来说，就是可以看目录中所包含的文件名，也就是

    ls mydir

可以正确执行。
<div class="slide">
  <img src="/LGCB-assets/bash/perm_6.png" />
</div>
写权限对文件而言很好理解，就是我们可以修改里面的内容。那是不是也意味者我们可以对文件进行重命名，或删除操作呢？
答案是，这要看包含该文件的目录的权限。这就谈到了一个目录的写权限的意义，我们对于一个目录有写权限，意味着我们可以对其中包含的文件或子目录进行重命名或删除。

    ls -l a.txt
    rw-rw-rw-

显然我们对这个文件是有写权限的，但是如果我们

    rm a.txt
    permission denied
    mv a.txt b.txt
    permission denied

我们查看一下包含它的目录的权限
    
    cd ..
    ls -ld mydir
    r-xr-xr-x

<div class="slide">
  <img src="/LGCB-assets/bash/perm_7.png" />
</div>
最后要谈的是执行权限(x),
我们对于一个二进制文件(例如程序的编译输出),或者是一些脚本文件，例如shell脚本，python脚本执行权限才有意义。例如

    chmod +x peter.sh
    ./peter.sh

但是如果我们文件里存的是笔记或者是C程序的源代码，那执行权限是没有什么意义的。这就是为什么系统上的大部分普通文件，如果我们用`ls
-l`查看一下的话，都是没有执行权限的。但是正好相对的，我们用`ls
-ld`查看一下系统上的目录，发现基本上都是有执行权限的。先执行这样一个操作

    chmod -x mydir
    cd mydir
    permission denied 

原来对于没有执行权限的目录，我们是不能跳转进去的。

### 修改文件模式(chmod)
<div class="slide">
  <img src="/LGCB-assets/bash/perm_8.png" />
</div>
我们可以通过chmod这个命令来更改文件模式，也就是更改各类用户的具体权限。如果我们想对“组”用户和“其他”用户，在`a.txt`都加上写的权限，那么可以凭空想象出这样一个命令

    chmod rw-rw-rw- a.txt

但是实际这个命令系统是不认的。然后，我们用1代表“使能”，0代表“禁止”，可以得到

    chmod 110110110 a.txt

那这个逻辑也是清晰的，但是很不幸`110110110`也不是chmod的合法参数。
我们再把这个参数写的短一点，也就是把它们分三组分别八进制表示。最后得到的

    chmod 666 a.txt 

是一个正确的系统命令，最后实现了我们的目的。
<div class="slide">
  <img src="/LGCB-assets/bash/perm_9.png" />
</div>

