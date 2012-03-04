---
layout: book
title: Permissions
---

### What are permissions?
<div class="slide">
  <img src="/LGCB-assets/bash/perm_1.png" />
</div>
A user usually have _read_, _write_ and _execute_ permissions to a file, other
permissions exist, less commonly seen.
<div class="slide">
  <img src="/LGCB-assets/bash/perm_2.png" />
</div>
Linux is a _multiuser_ operating system, meaning more than one users can use
the same machine at the same time. To a specific file, the system will assign
one user as its _owner_, and one group of one or more users to behave as its
"owner group", simply called _group_ in tech term. Then the rest of the users
fall into the third category named _world_. It is tempting to think the
_owner_ and _group_ will have more priviliages( more permissions) than _world_, it is not always the case.
And another thing worth mentioning is that the _owner_ is usually a member of
_group_, and again, it is not always the case.
<div class="slide">
  <img src="/LGCB-assets/bash/perm_3.png" />
</div>
So when we talk about permissions, we actually need to deal with the three
sorts of people. So we need first to determine wether the _owner_ has the
permission to read, write or execute the file or not, then the people in
_group_ and _world_. So it is actually simple, when we finishing the 3x3, then
we are done.

### file mode
<div class="slide">
  <img src="/LGCB-assets/bash/perm_4.png" />
</div>
In reality of Linux, this was done by defining _file mode_ of a file.
If we do 

    ls -l a.txt

Looking at the output, the first `-` is about _file type_, common candidates are `l` for "symbolic link", `d` for "directory" meaning the file is a directory, and if we see `-` here, this represents that the file is a common file.

We will not first leave the following 9 characters along, can what follows is
a `1` which is the number of _hard links_ `a.txt` has. Now the first `peter`
is _owner_ name, the second is _group_ name. `0` is the size in byte, and this
is a empty file obviously. Then last modification time followed by the file
name.

Now back to the 9 bits we left out, so Linux use the first 3 to represent the
permissions of _owner_, then the middle 3 for _group_, last 3 for _world_.
 the first bit determines whether the _owner_ has the read permission to the
file, `r` means yes, `-` no. Then we see `w` in the second bit, which means
the _owner_(namely peter) has write access to the file, and again, if `-`,
he does not. Finally the 3rd bit `-` here means the _owner_ can not execute
the file, if we want the _owner_ has such permission, we need to set this bit
to `x`.

So the situation here is clear. As to all the users on the system, peter ( the
_owner_) has read and write permissions to the file a.txt. Everybody in the
group named `peter` has read permission. Then everybody else( the _world_)
also only has read permission.
<div class="slide">
  <img src="/LGCB-assets/bash/perm_5.png" />
</div>
If we want to see the some "long" format output for a directory, we need to

    ls -ld mydir

And permissions can mean a bit different to files and dirs.

If a user has read permission to a file, he can check the content within the
file, this is simple. If to a dir, then he can also check the content in the
dir and see all the file names in it( some may say there also is subdirs in,
well, dirs are also files, just a sepical kind of.)
<div class="slide">
  <img src="/LGCB-assets/bash/perm_6.png" />
</div>
If write permission granted to a user, the user has the right to modify the
content, simple enough. But the question is that does this also means the file name can be modified or deleted? The answer is no. 

Because it is the write permission of the parent dir of this file that is in
charge of whether the file can be renamed/deleted, or a new file can be
created. One prereuest before you can fully enjoy the write permission to your
dir is that you still need the _execute_ permission of the dir. Lucily dirs
generally has `x` for every user on the system, so this rarely becomes a
issue.
<div class="slide">
  <img src="/LGCB-assets/bash/perm_7.png" />
</div>
最后要谈的是执行权限(x),
我们对于一个二进制文件(例如程序的编译输出),或者是一些脚本文件，例如shell脚本，python脚本执行权限才有意义。
但是如果我们文件里存的是笔记或者是C程序的源代码，那执行权限是没有什么意义的。这就是为什么系统上的大部分普通文件，如果我们用`ls
-l`查看一下的话，都是没有执行权限的。但是正好相对的，我们用`ls
-ld`查看一下系统上的目录，发现基本上都是有执行权限的。
对于没有执行权限的目录，我们是不能跳转进去的，所以有没有执行权限，意味者我们能不能成功的`cd`到该目录里。

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
Beside using the three octals as the parameters of `chmod`, we can also use
character notaions. Let's first give a short name to each of the three
categories. So we want to use `o` for _owner_, but Linux system does not
agree, so finally `u`(short for user) is the decided name for _owner_, and `g`
for _group_, `o`(short for others) is choosen for _world_. 

If we have a.txt whose initial `file mode` like this

    $ ls -l a.txt
      -rw-r--r--

we run

    $ chmod a+x a.txt

we get

    $ ls -l a.txt
      -rwxr-xr-x

then

    $ chmod g+w a.txt

now

    $ ls -l a.txt
      -rwxrwxr-x    

we can ripe of both the _read_ and _execute_ permissions of _group_ in one go by

    $ chmod o-rx a.txt

that is

    $ ls -l a.txt
      -rwxrwx---

Lastly, if we want to go back to the state we started with, that is
`rw-r--r--`, so it seems we won't be able to accomplish this in one step using
the notation way, so we go back to the octal way and

    $ chmod 644 a.txt

is our best friend now.
