---
layout: book
title: Permissions
---
Linux is a _multiuser_ system, this means more than one user can use one Linux
machine at the same time.

Linux是一个多用户的操作系统，这意味者多个用户可以同时使用同一台Linux机器。
所以针对特定文件的操作权限，Linux系统会把所有的用户分为三类：
1. 文件所有者(owner), 一般默认是文件的创建者，可以修改
2.
还有一个组（group）的概念，一个group由一个或多个用户组成，其中可能包括owner,
也可能不包括，每一个Linux上的文件都会对应一个group，group成员对文件的权限统一规定。  
3. 这两类之外的其他所有用户也同归为一类，习惯上叫world


The remaining nine characters of the file attributes, called the file mode, represent the
read, write, and execute permissions for the file's owner, the file's group owner, and
everybody else:

剩下的九个字符，叫做文件模式，代表着文件所有者，文件组所有者，和其他人的读，写，执行权限。

When set, the r, w, and x mode attributes have the following effect on files and
directories:

当设置文件模式后，r，w，x模式属性对文件和目录会产生以下影响：

### chmod – Change file mode

To change the mode (permissions) of a file or directory, the chmod command is used.
Be aware that only the file’s owner or the superuser can change the mode of a file or
directory. chmod supports two distinct ways of specifying mode changes: octal number
representation, or symbolic representation. We will cover octal number representation
first.

<center>
<table class="multi" cellpadding="10" border="1" width="%60">
<tr>
<th class="title">Octal</th>
<th class="title">Binary</th>
<th class="title">File Mode</th>
</tr>
<tr>
<td valign="top">0 </td>
<td valign="top">000</td>
<td valign="top">---</td>
</tr>
<tr>
<td valign="top">1</td>
<td valign="top">001</td>
<td valign="top">--x</td>
</tr>
<tr>
<td valign="top">2</td>
<td valign="top">010</td>
<td valign="top">-w-</td>
</tr>
<tr>
<td valign="top">3</td>
<td valign="top">011</td>
<td valign="top">-wx</td>
</tr>
<tr>
<td valign="top">4</td>
<td valign="top">100</td>
<td valign="top">r--</td>
</tr>
<tr>
<td valign="top">5</td>
<td valign="top">101</td>
<td valign="top">r-x</td>
</tr>
<tr>
<td valign="top">6</td>
<td valign="top">110</td>
<td valign="top">rw-</td>
</tr>
<tr>
<td valign="top">7</td>
<td valign="top">111</td>
<td valign="top">rwx</td>
</tr>
</table>
</center>

By using three octal digits, we can set the file mode for the owner, group owner, and
world:


<div class="code"><pre>
<tt>[me@linuxbox ~]$ > foo.txt
[me@linuxbox ~]$ ls -l foo.txt
-rw-rw-r-- 1 me    me    0  2008-03-06 14:52 foo.txt
[me@linuxbox ~]$ chmod 600 foo.txt
[me@linuxbox ~]$ ls -l foo.txt
-rw------- 1 me    me    0  2008-03-06 14:52 foo.txt</tt>
</pre></div>

By passing the argument “600”, we were able to set the permissions of the owner to read
and write while removing all permissions from the group owner and world. Though
remembering the octal to binary mapping may seem inconvenient, you will usually only
have to use a few common ones: 7 (rwx), 6 (rw-), 5 (r-x), 4 (r--), and 0 (---).

chmod also supports a symbolic notation for specifying file modes. Symbolic notation is
divided into three parts: who the change will affect, which operation will be performed,
and what permission will be set. To specify who is affected, a combination of the
characters “u”, “g”, “o”, and “a” is used as follows:

chmod命令支持一种符号表示法，来指定文件模式。符号表示法分为三部分：更改会影响谁，
要执行哪个操作，要设置哪种权限。通过字符“u”， “g”， “o”， and “a”的组合来指定
要影响的对象，如下所示：

<p>
<table class="multi" cellpadding="10" border="1" width="%100">
<caption class="cap">Table 10-4: chmod Symbolic Notation &nbsp;
chmod命令符号表示法
</caption>
<tr>
<td class="title" width="15%">u</td>
<td class="title">Short for "user", but means the file or directory owner. &nbsp;
"user"的简写，意思是文件或目录的所有者。</td>
</tr>
<tr>
<td valign="top">g</td>
<td valign="top">Group owner. &nbsp; 用户组。</td>
</tr>
<tr>
<td valign="top">o</td>
<td valign="top">Short for "others", but means world. &nbsp;
"others"的简写，意思是其他所有的人。</td>
</tr>
<tr>
<td valign="top">a</td>
<td valign="top">Short for "all", the combination of "u", "g", and "o". &nbsp;
"all"的简写，是"u", "g"和“o”三者的联合。</td>
</tr>
</table>
</p>

If no character is specified, “all” will be assumed. The operation may be a “+” indicating
that a permission is to be added, a “-” indicating that a permission is to be taken away, or
a “=” indicating that only the specified permissions are to be applied and that all others
are to be removed.

如果没有指定字符，则假定使用"all"。执行的操作可能是一个“＋”字符，表示加上一个权限，
一个“－”，表示删掉一个权限，或者是一个“＝”，表示只有指定的权限可用，其它所有的权限被删除。

Permissions are specified with the “r”, “w”, and “x” characters. Here are some examples
of symbolic notation:

权限由“r”, “w”, and “x”来指定。这里是一些符号表示法的实例：

<p>
<table class="multi" cellpadding="10" border="1" width="%100">
<caption class="cap">Table 10-5: chmod Symbolic Notation Examples &nbsp;
chmod符号表示法实例
</caption>
<tr>
<td class="title" width="15%">u+x </td>
<td class="title">Add execute permission for the owner. &nbsp;
为文件所有者添加可执行权限。</td>
</tr>
<tr>
<td valign="top">u-x</td>
<td valign="top">Remove execute permission from the owner. &nbsp;
删除文件所有者的可执行权限。</td>
</tr>
<tr>
<td valign="top">+x</td>
<td valign="top">Add execute permission for the owner, group, and world.
Equivalent to a+x. &nbsp; 为文件所有者，用户组，和其他所有人添加可执行权限。
等价于a+x。</td>
</tr>
<tr>
<td valign="top">o-rw</td>
<td valign="top">Remove the read and write permission from anyone besides the
owner and group owner. &nbsp; 除了文件所有者和用户组，删除其他人的读权限和写权限。</td>
</tr>
<tr>
<td valign="top">go=rw</td>
<td valign="top">Set the group owner and anyone besides the owner to have read and
write permission. If either the group owner or world previously had
execute permissions, they are removed. &nbsp; </td>
</tr>
<tr>
<td valign="top">u+x,go=rw</td>
<td valign="top">Add execute permission for the owner and set the permissions for
the group and others to read and execute. Multiple specifications
may be separated by commas.</td>
</tr>
</table>
</p>

Some people prefer to use octal notation, some folks really like the symbolic. Symbolic
notation does offer the advantage of allowing you to set a single attribute without
disturbing any of the others.

一些人喜欢使用八进制表示法，而另些人真正地喜欢符号表示法。符号表示法的优点是，
允许你设置文件模式的单个组成部分的属性，而没有影响其他的部分。

Take a look at the chmod man page for more details and a list of options. A word of
caution regarding the “--recursive” option: it acts on both files and directories, so it's not
as useful as one would hope since, we rarely want files and directories to have the same
permissions.

看一下chmod命令的手册页，可以得到更详尽的信息和chmod命令的各个选项。要注意"--recursive"选项：
它可以同时作用于文件和目录，所以它并不是如我们期望的那么有用处，因为我们很少希望文件和
目录拥有同样的权限。

### Setting File Mode With The GUI

### 借助GUI来设置文件模式

Now that we have seen how the permissions on files and directories are set, we can better
understand the permission dialogs in the GUI. In both Nautilus (GNOME) and
Konqueror (KDE), right-clicking a file or directory icon will expose a properties dialog.
Here is an example from KDE 3.5:

现在我们已经知道了怎样设置文件和目录的权限，这样我们就可以更好的理解GUI中的设置
权限对话框。在Nautilus (GNOME)和Konqueror
(KDE)中，右击一个文件或目录图标将会弹出一个属性对话框。下面这个例子来自KDE 3.5：

<p style="text-align:center"><img src="./images/102.png" alt="file properties" /></p>
<p class="figure">Figure 2: KDE 3.5 File properties Dialog</p>

Here we can see the settings for the owner, group, and world. In KDE, clicking on the
“Advanced Permissions” button brings up another dialog that allows you to set each of
the mode attributes individually. Another victory for understanding brought to us by the
command line!

从这个对话框中，我们看到可以设置文件所有者，用户组，和其他人的访问权限。
在KDE中，右击"Advanced Permissions"按钮，会打开另一个对话框，这个对话框允许
你单独设置各个模式属性。这也可以通过命令行来理解！

### umask – Set Default Permissions

### umask － 设置默认权限

The umask command controls the default permissions given to a file when it is created.
It uses octal notation to express a mask of bits to be removed from a file's mode
attributes. Let's take a look:

当创建一个文件时，umask命令控制着文件的默认权限。umask命令使用八进制表示法来表达
从文件模式属性中删除一个位掩码。大家看下面的例子：

<div class="code"><pre>
<tt>[me@linuxbox ~]$ rm -f foo.txt
[me@linuxbox ~]$ umask
0002
[me@linuxbox ~]$ > foo.txt
[me@linuxbox ~]$ ls -l foo.txt
-rw-rw-r-- 1 me   me   0 2008-03-06 14:53 foo.txt</tt>
</pre></div>

We first removed any old copy of foo.txt to make sure we were starting fresh. Next,
we ran the umask command without an argument to see the current value. It responded
with the value 0002 (the value 0022 is another common default value), which is the
octal representation of our mask. We next create a new instance of the file foo.txt and
observe its permissions.

首先，删除文件foo.txt，以此确定我们从新开始。下一步，运行不带参数的umask命令，
看一下当前的掩码值。响应的数值是0002（0022是另一个常用值），这个数值是掩码的八进制
表示形式。下一步，我们创建文件foo.txt，并且保留它的权限。

We can see that both the owner and group both get read and write permission, while
everyone else only gets read permission. The reason that world does not have write
permission is because of the value of the mask. Let's repeat our example, this time
setting the mask ourselves:

我们可以看到文件所有者和用户组都得到读权限和写权限，而其他人只是得到读权限。
其他人没有得到写权限的原因是由掩码值决定的。重复我们的实验，这次自己设置掩码值：

<div class="code"><pre>
<tt>[me@linuxbox ~]$ rm foo.txt
[me@linuxbox ~]$ umask 0000
[me@linuxbox ~]$ > foo.txt
[me@linuxbox ~]$ ls -l foo.txt
-rw-rw-rw- 1 me   me    0 2008-03-06 14:58 foo.txt</tt>
</pre></div>

When we set the mask to 0000 (effectively turning it off), we see that the file is now
world writable. To understand how this works, we have to look at octal numbers again.
If we take the mask and expand it into binary, then compare it to the attributes we can see
what happens:

当掩码设置为0000（实质上是关掉它）之后，我们看到其他人能够读写文件。为了弄明白这是
怎么回事，我们需要看一下掩码的八进制形式。把掩码展开成二进制形式，然后与文件属性
相比较，看看有什么区别：

<center>
<table class="multi" cellpadding="10" border="1" width="%60">
<tr>
<td valign="top">Original file mode </td>
<td valign="top">--- rw- rw- rw-</td>
</tr>
<tr>
<td valign="top">Mask</td>
<td valign="top">000 000 000 010</td>
</tr>
<tr>
<td valign="top">Result</td>
<td valign="top">--- rw- rw- r--</td>
</tr>
</table>
</center>

Ignore for the moment the leading zeros (we'll get to those in a minute) and observe that
where the 1 appears in our mask, an attribute was removed—in this case, the world   
write permission. That's what the mask does. Everywhere a 1 appears in the binary value
of the mask, an attribute is unset. If we look at a mask value of 0022, we can see what it
does:

此刻先忽略掉开头的三个零（我们一会儿再讨论），注意掩码中若出现一个数字1，则
删除文件模式中和这个1在相同位置的属性，在这是指其他人的写权限。这就是掩码要完成的
任务。掩码的二进制形式中，出现数字1的位置，相应地关掉一个文件模式属性。看一下
掩码0022的作用：

<center>
<table class="multi" cellpadding="10" border="1" width="%60">
<tr>
<td valign="top">Original file mode </td>
<td valign="top">--- rw- rw- rw-</td>
</tr>
<tr>
<td valign="top">Mask</td>
<td valign="top">000 000 010 010</td>
</tr>
<tr>
<td valign="top">Result</td>
<td valign="top">--- rw- r-- r--</td>
</tr>
</table>
</center>

Again, where a 1 appears in the binary value, the corresponding attribute is unset. Play
with some values (try some sevens) to get used to how this works. When you're done,
remember to clean up:

又一次，二进制中数字1出现的位置，相对应的属性被删除。再试一下其它的掩码值（一些带数字7的）
，习惯于掩码的工作原理。当你实验完成之后，要记得清理现场：

<div class="code"><pre>
<tt>[me@linuxbox ~]$ rm foo.txt; umask 0002</tt>
</pre></div>

Most of the time you won't have to change the mask; the default provided by your
distribution will be fine. In some high-security situations, however, you will want to
control it.

大多数情况下，你不必修改掩码值，系统提供的默认掩码值就很好了。然而，在一些高
安全级别下，你要能控制掩码值。

<table class="single" cellpadding="10" width="%100">
<tr>
<td>
<h3>Some Special Permissions</h3>
<h3>一些特殊权限</h3>

<p>Though we usually see an octal permission mask expressed as a three digit
number, it is more technically correct to express it in four digits. Why? Because,
in addition to read, write, and execute permission, there are some other, less used,
permission settings.</p>
<p>虽然我们通常看到一个八进制的权限掩码用三位数字来表示，但是从技术层面上来讲，
用四位数字来表示它更确切些。为什么呢？因为，除了读取，写入，和执行权限之外，还有
其它的，较少用到的权限设置。</p>

<p>The first of these is the setuid bit (octal 4000). When applied to an executable
file, it sets the effective user ID from that of real user (the user actually running
the program) to that of the program's owner. Most often this is given to a few
programs owned by the superuser. When an ordinary user runs a program that is
“setuid root” , the program runs with the effective privileges of the superuser.
This allows the program to access files and directories that an ordinary user
would normally be prohibited from accessing. Clearly, because this raises
security concerns, number of setuid programs must be held to an absolute
minimum.</p>
<p>其中之一是setuid位（八进制4000)。当应用到一个可执行文件时，它把有效用户ID
从真正的用户（实际运行程序的用户）设置成程序所有者的ID。这种操作通常会应用到
一些由超级用户所拥有的程序。当一个普通用户运行一个程序，这个程序由根用户(root)
所有，并且设置了setuid位，这个程序运行时具有超级用户的特权，这样程序就可以
访问普通用户禁止访问的文件和目录。很明显，因为这会引起安全方面的问题，所有可以
设置setuid位的程序个数，必须控制在绝对小的范围内。</p>

<p>The second is the setgid bit (octal 2000) which, like the setuid bit, changes the
effective group ID from the real group ID of the user to that of the file owner. If
the setgid bit is set on a directory, newly created files in the directory will be
given the group ownership of the directory rather the group ownership of the file's
creator. This is useful in a shared directory when members of a common group
need access to all the files in the directory, regardless of the file owner's primary
group.</p>

<p>第二个是setgid位（八进制2000），这个相似于setuid位，把有效用户组ID从真正的
用户组ID更改为文件所有者的组ID。如果设置了一个目录的setgid位，则目录中新创建的文件
具有这个目录用户组的所有权，而不是文件创建者所属用户组的所有权。对于共享目录来说，
当一个普通用户组中的成员，需要访问共享目录中的所有文件，而不管文件所有者的主用户组时，
那么设置setgid位很有用处。</p>

<p>The third is called the sticky bit (octal 1000). This is a holdover from ancient
Unix, where it was possible to mark an executable file as “not swappable.” On
files, Linux ignores the sticky bit, but if applied to a directory, it prevents users
from deleting or renaming files unless the user is either the owner of the directory,
the owner of the file, or the superuser. This is often used to control access to a
shared directory, such as /tmp.</p>

<p>第三个是sticky位（八进制1000）。这个继承于Unix，在Unix中，它可能把一个可执行文件
标志为“不可交换的”。在Linux中，会忽略文件的sticky位，但是如果一个目录设置了sticky位，
那么它能阻止用户删除或重命名文件，除非用户是这个目录的所有者，或者是文件所有者，或是
超级用户。这个经常用来控制访问共享目录，比方说/tmp。</p>

<p>Here are some examples of using chmod with symbolic notation to set these
special permissions. First assigning setuid to a program:</p>
<p>这里有一些例子，使用chmod命令和符号表示法，来设置这些特殊的权限。首先，
授予一个程序setuid权限。</p>

<p>chmod u+s program</p>

<p>Next, assigning setgid to a directory:</p>

<p>下一步，授予一个目录setgid权限：</p>

<p>chmod g+s dir</p>

<p>Finally, assigning the sticky bit to a directory:</p>
<p>最后，授予一个目录sticky权限：</p>

<p>chmod +t dir</p>

<p>When viewing the output from ls, you can determine the special permissions.
Here are some examples. First, a program that is setuid:</p>
<p>当浏览ls命令的输出结果时，你可以确认这些特殊权限。</p>

<p>-rwsr-xr-x</p>

<p>A directory that has the setgid attribute:</p>
<p>具有setgid属性的目录：</p>

<p>drwxrwsr-x</p>

<p>A directory with the sticky bit set:</p>
<p>设置了sticky位的目录：</p>

<p>drwxrwxrwt</p>

</td>
</tr>
</table>

### Changing Identities

At various times, we may find it necessary to take on the identity of another user. Often
we want to gain superuser privileges to carry out some administrative task, but it is also
possible to “become” another regular user for such things as testing an account. There
are three ways to take on an alternate identity:

1. Log out and log back in as the alternate user. &nbsp; 注销系统并以其他用户身份重新登录系统。

2. Use the su command. &nbsp; 使用su命令。

3. Use the sudo command. &nbsp; 使用sudo命令。

We will skip the first technique since we know how to do it and it lacks the convenience
of the other two. From within our own shell session, the su command allows you to
assume the identity of another user, and either start a new shell session with that user's
IDs, or to issue a single command as that user. The sudo command allows an
administrator to set up a configuration file called /etc/sudoers, and define specific
commands that particular users are permitted to execute under an assumed identity. The
choice of which command to use is largely determined by which Linux distribution you
use. Your distribution probably includes both commands, but its configuration will favor
either one or the other. We'll start with su.

我们将跳过第一种方法，因为我们知道怎样使用它，并且它缺乏其它两种方法的方便性。
在我们自己的shell会话中，su命令允许你，假定为另一个用户的身份，以这个用户的ID
启动一个新的shell会话，或者是以这个用户的身份来发布一个命令。sudo命令允许一个管理员
设置一个叫做/etc/sudoers的配置文件，并且定义了一些具体命令，在假定的身份下，特殊用户
可以执行这些命令。选择使用哪个命令，很大程度上是由你使用的Linux发行版来决定的。
你的发行版可能这两个命令都包含，但系统配置可能会偏袒其中之一。我们先介绍su命令。

### su – Run A Shell With Substitute User And Group IDs

### su－以其他用户身份和组ID运行一个shell

The su command is used to start a shell as another user. The command syntax looks like
this:

su命令用来以另一个用户的身份来启动shell。这个命令语法看起来像这样：

<div class="code"><pre>
<tt>su [-[l]] [user]</tt>
</pre></div>

If the “-l” option is included, the resulting shell session is a login shell for the specified
user. This means that the user's environment is loaded and the working directory is
changed to the user's home directory. This is usually what we want. If the user is not
specified, the superuser is assumed. Notice that (strangely) the “-l” may be abbreviated
“-”, which is how it is most often used. To start a shell for the superuser, we would do
this:

如果包含"-l"选项，那么会为指定用户启动一个需要登录的shell。这意味着会加载此用户的shell环境，
并且工作目录会更改到这个用户的主目录。这通常是我们所需要的。如果不指定用户，那么就假定是
超级用户。注意（不可思议地），选项"-l"可以缩写为"-"，这是经常用到的形式。启动超级用户的shell，
我们可以这样做：

<div class="code"><pre>
<tt>[me@linuxbox ~]$ su -
Password:
[root@linuxbox ~]#</tt>
</pre></div>

After entering the command, we are prompted for the superuser's password. If it is
successfully entered, a new shell prompt appears indicating that this shell has superuser
privileges (the trailing “#” rather than a “$”) and the current working directory is now the
home directory for the superuser (normally /root.) Once in the new shell, we can carry
out commands as the superuser. When finished, type “exit” to return to the previous
shell:

按下回车符之后，shell提示我们输入超级用户的密码。如果密码输入正确，出现一个新的shell提示符，
这表明这个shell具有超级用户特权（提示符的末尾字符是"#"而不是"$"），并且当前工作目录是超级用户的主目录
（通常是/root）。一旦进入一个新的shell，我们能执行超级用户所使用的命令。当工作完成后，
输入"exit"，则返回到原来的shell:

<div class="code"><pre>
<tt>[root@linuxbox ~]# exit
[me@linuxbox ~]$</tt>
</pre></div>

It is also possible to execute a single command rather than starting a new interactive
command by using su this way:

以这样的方式使用su命令，也可以只执行单个命令，而不是启动一个新的可交互的shell：

<div class="code"><pre>
<tt>su -c 'command'</tt>
</pre></div>

Using this form, a single command line is passed to the new shell for execution. It is
important to enclose the command in quotes, as we do not want expansion to occur in our
shell, but rather in the new shell:

使用这种模式，命令传递到一个新shell中执行。把命令用单引号引起来很重要，因为我们不想
命令在我们的shell中展开，但需要在新shell中展开。

<div class="code"><pre>
<tt>[me@linuxbox ~]$ su -c 'ls -l /root/*'
Password:
-rw------- 1 root root    754 2007-08-11 03:19 /root/anaconda-ks.cfg

/root/Mail:
total 0
[me@linuxbox ~]$</tt>
</pre></div>

### sudo – Execute A Command As Another User

### sudo－以另一个用户身份执行命令

The sudo command is like su in many ways, but has some important additional
capabilities. The administrator can configure sudo to allow an ordinary user to execute
commands as a different user (usually the superuser) in a very controlled way. In
particular, a user may be restricted to one or more specific commands and no others.
Another important difference is that the use of sudo does not require access to the
superuser's password. To authenticate using sudo, the user uses his/her own password.
Let's say, for example, that sudo has been configured to allow us to run a fictitious
backup program called “backup_script”, which requires superuser privileges. With sudo
it would be done like this:

sudo命令在很多方面都相似于su命令，但是sudo还有一些非常重要的功能。管理员能够配置
sudo命令，从而允许一个普通用户以不同的身份（通常是超级用户），通过一种非常可控的方式
来执行命令。尤其是，只有一个用户可以执行一个或多个特殊命令时，（更体现了sudo命令的方便性）。
另一个重要差异是sudo命令不要求超级用户的密码。使用sudo命令时，用户使用他/她自己的密码
来认证。比如说，例如，sudo命令经过配置，允许我们运行一个虚构的备份程序，叫做"backup_script"，
这个程序要求超级用户权限。通过sudo命令，这个程序会像这样运行：

<div class="code"><pre>
<tt>[me@linuxbox ~]$ sudo backup_script
Password:
System Backup Starting...</tt>
</pre></div>

After entering the command, we are prompted for our password (not the superuser's) and
once the authentication is complete, the specified command is carried out. One important
difference between su and sudo is that sudo does not start a new shell, nor does it load
another user's environment. This means that commands do not need to be quoted any
differently than they would be without using sudo. Note that this behavior can be
overridden by specifying various options. See the sudo man page for details.

按下回车键之后，shell提示我们输入我们的密码（不是超级用户的）。一旦认证完成，则执行
具体的命令。su和sudo之间的一个重要区别是sudo不会重新启动一个shell，也不会加载另一个
用户的shell运行环境。这意味者命令不必用单引号引起来。注意通过指定各种各样的选项，这
种行为可以被推翻。详细信息，阅读sudo手册页。

To see what privileges are granted by sudo, use the “-l” option to list them:

想知道sudo命令可以授予哪些权限，使用"-l"选项，列出所有权限：

<div class="code"><pre>
<tt>[me@linuxbox ~]$ sudo -l
User me may run the following commands on this host:
(ALL) ALL</tt>
</pre></div>

<br />

<table class="single" cellpadding="10" width="%100">
<tr>
<td>
<h3>Ubuntu And sudo</h3>
<h3>Ubuntu与sudo</h3>

<p>One of the recurrent problems for regular users is how to perform certain tasks
that require superuser privileges. These tasks include installing and updating
software, editing system configuration files, and accessing devices. In the
Windows world, this is often done by giving users administrative privileges. This
allows users to perform these tasks. However, it also enables programs executed
by the user to have the same abilities. This is desirable in most cases, but it also
permits malware (malicious software) such as viruses to have free reign of the
computer.</p>

<p>In the Unix world, there has always been a larger division between regular users
and administrators, owing to the multi-user heritage of Unix. The approach taken
in Unix is to grant superuser privileges only when needed. To do this, the su and
sudo commands are commonly used.</p>

<p>在Unix世界中，由于Unix是多用户系统，所以在普通用户和管理员之间总是存在很大的
差别。Unix采取的方法是只有在需要的时候，才授予普通用户超级用户权限。这样，普遍会
用到su和sudo命令。</p>

<p>Up until a couple of years ago, most Linux distributions relied on su for this
purpose. su didn't require the configuration that sudo required, and having a
root account is traditional in Unix. This introduced a problem. Users were
tempted to operate as root unnecessarily. In fact, some users operated their
systems as the root user exclusively, since it does away with all those annoying
“permission denied” messages. This is how you reduce the security of a Linux
system to that of a Windows system. Not a good idea.</p>

<p>几年前，大多数的Linux发行版都依赖于su命令，来达到目的。su命令不需要sudo命令
所要求的配置，su命令拥有一个root帐号，是Unix中的传统。但这会引起问题。所有用户
会企图以root用户帐号来操纵系统。事实上，一些用户专门以root用户帐号来操作系统，
因为这样做，的确消除了所有那些讨厌的“权限被拒绝”的消息。相比于Windows系统安全性而言，
这样做，你就削弱了Linux系统安全性能。不是一个好主意。</p>

<p>When Ubuntu was introduced, its creators took a different tack. By default,
Ubuntu disables logins to the root account (by failing to set a password for the
account), and instead uses sudo to grant superuser privileges. The initial user
account is granted full access to superuser privileges via sudo and may grant
similar powers to subsequent user accounts.</p>

</td>
</tr>
</table>

### chown – Change File Owner And Group

### chown－更改文件所有者和用户组

The chown command is used to change the owner and group owner of a file or directory.
Superuser privileges are required to use this command. The syntax of chown looks like
this:

chown命令被用来更改文件或目录的所有者和用户组。使用这个命令需要超级用户权限。chown命令
的语法看起来像这样：

<div class="code"><pre>
<tt>chown [owner][:[group]] file...</tt>
</pre></div>

chown can change the file owner and/or the file group owner depending on the first
argument of the command. Here are some examples:

chown命令可以更改文件所有者和/或文件用户组，依据于这个命令的第一个参数。这里有
一些例子：

<p>
<table class="multi" cellpadding="10" border="1" width="%100">
<caption class="cap">Table 10-6: chown Argument Examples &nbsp; chown参数实例</caption>
<tr>
<th class="title">Argument </th>
<th class="title">Results</th>
</tr>
<tr>
<td valign="top" width="15%">bob</td>
<td valign="top">Changes the ownership of the file from its current owner to user
bob. &nbsp; 把文件所有者从当前属主更改为用户bob。</td>
</tr>
<tr>
<td valign="top">bob:users</td>
<td valign="top">Changes the ownership of the file from its current owner to user
bob and changes the file group owner to group users. &nbsp;
把文件所有者改为用户bob，文件用户组改为用户组users。</td>
</tr>
<tr>
<td valign="top">:admins</td>
<td valign="top">Changes the group owner to the group admins. The file owner is
unchanged. &nbsp; 把文件用户组改为组admins，文件所有者不变。</td>
</tr>
<tr>
<td valign="top">bob:</td>
<td valign="top">Change the file owner from the current owner to user bob and
changes the group owner to the login group of user bob. &nbsp; 文件所有者改为
用户bob，文件用户组改为，用户bob登录系统时，所属的用户组。</td>
</tr>
</table>
</p>

Let's say that we have two users; janet, who has access to superuser privileges and
tony, who does not. User janet wants to copy a file from her home directory to the
home directory of user tony. Since user janet wants tony to be able to edit the file,
janet changes the ownership of the copied file from janet to tony:

比方说，我们有两个用户，janet，拥有超级用户访问权限，而tony没有。用户jant想要从
她的主目录复制一个文件到用户tony的主目录。因为用户jant想要tony能够编辑这个文件，
janet把这个文件的所有者更改为tony:

<div class="code"><pre>
<tt>[janet@linuxbox ~]$ sudo cp myfile.txt ~tony
Password:
[janet@linuxbox ~]$ sudo ls -l ~tony/myfile.txt
-rw-r--r-- 1 root  root 8031 2008-03-20 14:30 /home/tony/myfile.txt
[janet@linuxbox ~]$ sudo chown tony: ~tony/myfile.txt
[janet@linuxbox ~]$ sudo ls -l ~tony/myfile.txt
-rw-r--r-- 1 tony  tony 8031 2008-03-20 14:30 /home/tony/myfile.txt</tt>
</pre></div>

Here we see user janet copy the file from her directory to the home directory of user
tony. Next, janet changes the ownership of the file from root (a result of using
sudo) to tony. Using the trailing colon in the first argument, janet also changed the
group ownership of the file to the login group of tony, which happens to be group
tony.

Notice that after the first use of sudo, janet was not prompted for her password? This
is because sudo, in most configurations, “trusts” you for several minutes until its timer
runs out.

注意，第一次使用sudo命令之后，为什么（shell）没有提示janet输入她的密码？这是因为，在
大多数的配置中，sudo命令会相信你几分钟，直到计时结束。

### chgrp – Change Group Ownership

### chgrp－更改用户组所有权

In older versions of Unix, the chown command only changed file ownership, not group
ownership. For that purpose, a separate command, chgrp was used. It works much the
same way as chown, except for being more limited.

在旧版Unix系统中，chown命令只能更改文件所有权，而不是用户组所有权。为了达到目的，
使用一个独立的命令，chgrp来完成。除了限制多一点之外，chgrp命令与chown命令使用起来很相似。

### Exercising Our Privileges

### 练习使用权限 

Now that we have learned how this permissions thing works, it's time to show
it off. We are going to demonstrate the solution to a common problem — setting
up a shared   directory. Let's imagine that we have two users named “bill” and
“karen.” They both have music CD collections and wish to set up a shared
directory, where they will each store their music files as Ogg Vorbis or MP3.
User bill has access to superuser privileges via sudo.

到目前为止，我们已经知道了，权限这类东西是怎样工作的，现在是时候炫耀一下了。我们
将展示一个常见问题的解决方案，这个问题是如何设置一个共享目录。假想我们有两个用户，
他们分别是"bill"和"karen"。他们都有音乐CD收藏品，也愿意设置一个共享目录，在这个
共享目录中，他们分别以Ogg Vorbis或MP3的格式来存储他们的音乐文件。通过sudo命令，
用户bill具有超级用户访问权限。

The first thing that needs to happen is creating a group that will have both bill and
karen as members. Using the graphical user management tool, bill creates a group
called music and adds users bill and karen to it:

我们需要做的第一件事，是创建一个以bill和karen为成员的用户组。使用图形化的用户管理工具，
bill创建了一个叫做music的用户组，并且把用户bill和karen添加到用户组music中：

<p style="text-align:center"><img src="./images/103.png" alt="file properties" /></p>
<p class="figure">Figure 3: Creating A New Group With GNOME</p>

Next, bill creates the directory for the music files:

下一步，bill创建了存储音乐文件的目录：

<div class="code"><pre>
<tt>[bill@linuxbox ~]$ sudo mkdir /usr/local/share/Music
password:</tt>
</pre></div>

Since bill is manipulating files outside his home directory, superuser privileges are
required. After the directory is created, it has the following ownerships and permissions:

因为bill正在他的主目录之外操作文件，所以需要超级用户权限。这个目录创建之后，它具有
以下所有权和权限：

<div class="code"><pre>
<tt>[bill@linuxbox ~]$ ls -ld /usr/local/share/Music
drwxr-xr-x 2 root root 4096 2008-03-21 18:05 /usr/local/share/Music</tt>
</pre></div>

As we can see, the directory is owned by root and has 755 permissions. To make this
directory sharable, bill needs to change the group ownership and the group permissions
to allow writing:

正如我们所见到的，这个目录由root用户拥有，并且具有权限755。为了使这个目录共享，允许（用户
karen）写入，bill需要更改目录用户组所有权和权限：

<div class="code"><pre>
<tt>[bill@linuxbox ~]$ sudo chown :music /usr/local/share/Music
[bill@linuxbox ~]$ sudo chmod 775 /usr/local/share/Music
[bill@linuxbox ~]$ ls -ld /usr/local/share/Music
drwxrwxr-x 2 root music 4096 2008-03-21 18:05 /usr/local/share/Music</tt>
</pre></div>

So what does this all mean? It means that we now have a directory,
/usr/local/share/Music that is owned by root and allows read and write
access to group music. Group music has members bill and karen, thus bill and
karen can create files in directory /usr/local/share/Music. Other users can
list the contents of the directory but cannot create files there.

那么这是什么意思呢？
它的意思是，现在我们拥有一个目录，/usr/local/share/Music，这个目录由root用户拥有，并且
允许用户组music读取和写入。用户组music有两个成员bill和karen，这样bill和karen能够在目录
/usr/local/share/Music中创建文件。其他用户能够列出目录中的内容，但是不能在其中创建文件。

But we still have a problem. With the current permissions, files and directories created
within the Music directory will have the normal permissions of the users bill and
karen:

但是我们仍然会遇到问题。通过我们目前所拥有的权限，在Music目录中创建的文件，只具有用户bill
和karen的普通权限：

<div class="code"><pre>
<tt>[bill@linuxbox ~]$ &gt; /usr/local/share/Music/test_file
[bill@linuxbox ~]$ ls -l /usr/local/share/Music
-rw-r--r-- 1 bill    bill    0 2008-03-24 20:03 test_file</tt>
</pre></div>

Actually there are two problems. First, the default umask on this system is 0022 which
prevents group members from writing files belonging to other members of the group.
This would not be a problem if the shared directory only contained files, but since this
directory will store music, and music is usually organized in a hierarchy of artists and
albums, members of the group will need the ability to create files and directories inside
directories created by other members. We need to change the umask used by bill and
karen to 0002 instead.

实际上，存在两个问题。第一个，系统中默认的掩码值是0022，这会禁止用户组成员编辑属于同
组成员的文件。如果共享目录中只包含文件，这就不是个问题，但是因为这个目录将会存储音乐，
通常音乐会按照艺术家和唱片的层次结构来组织分类。所以用户组成员需要在同组其他成员创建的
目录中创建文件和目录。我们将把用户bill和karen使用的掩码值改为0002。

Second, each file and directory created by one member will be set to the primary group of
the user rather than the group music. This can be fixed by setting the setgid bit on the
directory:

第二个问题是，用户组成员创建的文件和目录的用户组，将会设置为用户的主要组，而不是用户组music。
通过设置此目录的setgid位来解决这个问题：

<div class="code"><pre>
<tt>[bill@linuxbox ~]$ sudo chmod g+s /usr/local/share/Music
[bill@linuxbox ~]$ ls -ld /usr/local/share/Music
drwxrwsr-x 2 root music 4096 2008-03-24 20:03 /usr/local/share/Music</tt>
</pre></div>

Now we test to see if the new permissions fix the problem. bill sets his umask to
0002, removes the previous test file, creates a new test file and directory:

现在测试一下，看看是否新的权限解决了这个问题。bill把他的掩码值设为0002，删除
先前的测试文件，并创建了一个新的测试文件和目录：

<div class="code"><pre>
<tt>[bill@linuxbox ~]$ umask 0002

[bill@linuxbox ~]$ rm /usr/local/share/Music/test_file

[bill@linuxbox ~]$ &gt; /usr/local/share/Music/test_file
[bill@linuxbox ~]$ mkdir /usr/local/share/Music/test_dir
[bill@linuxbox ~]$ ls -l /usr/local/share/Music
drwxrwsr-x 2 bill   music 4096 2008-03-24 20:24 test_dir
-rw-rw-r-- 1 bill   music 0 2008-03-24 20:22 test_file
[bill@linuxbox ~]$</tt>
</pre></div>

Both files and directories are now created with the correct permissions to allow all
members of the group music to create files and directories inside the Music directory.

现在，创建的文件和目录都具有正确的权限，允许用户组music的所有成员在目录Music中创建
文件和目录。

The one remaining issue is umask. The necessary setting only lasts until the end of
session and must be reset. In the next part of the book, we'll look at making the change to
umask permanent.

剩下一个问题是关于umask命令的。umask命令设置的掩码值只能在当前shell会话中生效，若当前shell
会话结束后，则必须重新设置。在这本书的第三部分，我们将看一下，怎样使掩码值永久生效。

### Changing Your Password

### 更改用户密码

The last topic we'll cover in this chapter is setting passwords for yourself (and for other
users if you have access to superuser privileges.) To set or change a password, the
passwd command is used. The command syntax looks like this:

这一章最后一个话题，我们将讨论自己帐号的密码（和其他人的密码，如果你具有超级用户权限）。
使用passwd命令，来设置或更改用户密码。命令语法如下所示：

<div class="code"><pre>
<tt><b>passwd [user]</b></tt>
</pre></div>

To change your password, just enter the passwd command. You will be prompted for
your old password and your new password:

只要输入passwd命令，就能更改你的密码。shell会提示你输入你的旧密码和你的新密码：

<div class="code"><pre>
<tt>[me@linuxbox ~]$ passwd
(current) UNIX password:
New UNIX password:</tt>
</pre></div>

The passwd command will try to enforce use of “strong” passwords. This means the it
will refuse to accept passwords that are too short, too similar to previous passwords, are
dictionary words, or too easily guessed:

passwd命令将会试着强迫你使用“强”密码。这意味着，它会拒绝接受太短的密码，与先前相似的密码，
字典中的单词作为密码，或者是太容易猜到的密码：

<div class="code"><pre>
<tt>[me@linuxbox ~]$ passwd
(current) UNIX password:
New UNIX password:
BAD PASSWORD: is too similar to the old one
New UNIX password:
BAD PASSWORD: it is WAY too short
New UNIX password:
BAD PASSWORD: it is based on a dictionary word</tt>
</pre></div>

If you have superuser privileges, you can specify a user name as an argument to the
passwd command to set the password for another user. There are other options
available to the superuser to allow account locking, password expiration, etc. See the
passwd man page for details.

如果你具有超级用户权限，你可以指定一个用户名作为passwd命令的参数，这样可以设置另一个
用户的密码。还有其它的passwd命令选项对超级用户有效，允许帐号锁定，密码失效，等等。
详细内容，参考passwd命令的手册页。

### Further Reading

### 拓展阅读

Wikipedia has a good article on malware:

Wikipedia上面有一篇关于malware（恶意软件）好文章：

<http://en.wikipedia.org/wiki/Malware>

There are number of command line programs used to create and maintain users and
groups. For more information, see the man pages for the following commands:

还有一系列的命令行程序，可以用来创建和维护用户和用户组。更多信息，查看以下命令的手册页：

* adduser

* useradd

* groupadd


<center><img src="./images/rwx.png"></center>


## Further Reading

 - __TLCL:__
   <http://linuxcommand.org/tlcl.php>

   See "10-Permissions"

