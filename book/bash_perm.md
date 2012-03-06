---
layout: book
title: Permissions
---

### What are permissions?
<div class="slide">
  <img src="/LGCB-assets/bash/perm_1.png" />
</div>
A user can possiably have _read_, _write_ and _execute_ permissions to a file, other
permissions exist, less commonly used though.
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
permission to read, write or execute the file or not, then people in
_group_ and _world_. So it is actually simple, when we finishing the 3x3, then
we are done.

### file mode
<div class="slide">
  <img src="/LGCB-assets/bash/perm_4.png" />
</div>
In reality of Linux, this is accomplished  by defining the so-called _file mode_.
If we do 

    ls -l a.txt

Looking at the output, the first `-` is about _file type_, common candidates are `l` for "symbolic link", `d` for "directory" meaning the file is a directory, and if we see `-` here, this represents that the file is a common file.

We will now first leave the following 9 characters alone, and what follows is
a `1` which is the number of _hard links_ `a.txt` has. Now the first `peter`
is _owner_ name, the second is _group_ name. `0` is the size in bytes, and this
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
dir and see all the file names in it( some may say there are also subdirs in,
well, dirs are also files, just a sepical kind of.)
<div class="slide">
  <img src="/LGCB-assets/bash/perm_6.png" />
</div>
If write permission granted to a user, the user has the right to modify the
content, simple enough. But the question is that does this also mean the file name can be modified or deleted? The answer is no. 

Because it is the write permission to the parent dir of this file that is in
charge of whether the file can be renamed/deleted, or a new file can be
created. One prereuest before you can fully enjoy the write permission to your
dir is that you still need the _execute_ permission to the dir. Lucily dirs
generally has `x` for every user on the system, so this rarely becomes a
issue.
<div class="slide">
  <img src="/LGCB-assets/bash/perm_7.png" />
</div>
This brings us to the last permission the _execute_ (x).
Literally, it means we can execute a file as a program. This is still a guess,
but makes a lot of sense. So it is more than clear than if we have `x` to a
file that can not be _execute_ed( say our notes, or c SOURCE code), that is meaningless. So we usually only give `x` permission to files can be run on the system( e.g a shell scripts, code file with interpreted lanaguages like python or ruby, a binary output of C or C++). So usually when we create a file, it comes without a `x`. But if we `mkdir mydir`, `mydir` will be created with a `x` by default, so why? 

To clarify this, let's first remove the `x` from the dir.

    chmod -x mydir

now we try

    $ cd mydir
      permission denied.

So for a dir, `x` determines whether we can `cd` into it or not.
### chmod
<div class="slide">
  <img src="/LGCB-assets/bash/perm_8.png" />
</div>
`chmod` is a Linux command that is used to change _file mode_, and thus change the permissions for everybody. Say, we want to add `w` for both _group_ and _world_. Obviously want want this:

    chmod rw-rw-rw- a.txt

It turned out that the system think it is shit, that forces us to go really
digital, and we use `1` to say "enable", and `0` to "disable" so we get sth
like this:

    chmod 110110110 a.txt

So the logic is right and clear, but unfortunately `110110110` is not the
parameter that chmod recongnizes. So we divide the 9 bits into 3 subgroups can
get a octal out of each subgroup. Now we try:

    chmod 666 a.txt 

is accepted, and we get what we want finally.
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
