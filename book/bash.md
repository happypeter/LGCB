---
layout: post
---
# bash
## What Is The Shell?  
When we speak of the command line, we are
really referring to the shell. The shell is a program that takes
keyboard commands and passes them to the operating system to carry
out. (funny are the names: Shell on top of Kernel)Almost all Linux distributions supply a shell program from the
GNU Project called bash. 

The name “bash” is short for “Bourne
Again SHell”
a program written by Steve Bourne.
we need
another program called a terminal emulator to interact with the
shell. If we look through our desktop menus, we will probably find
one. ubuntu by defualt uses `gnome-terminal`, though it's
likely called simply “terminal” on our menu. There are a number of
other terminal emulators available for Linux, but they all basically
do the same thing; give us access to the shell. 
## ref 
<http://tldp.org/LDP/Bash-Beginners-Guide/html/>

## search

    find . -name "filename"
    grep string filename
    locate filename
    which commandname

often used

    find .|grep filename
    find . -exec grep "$1" '{}' \; -print

    apt-get install ggggg
    sudo !! # run is as root
    ^ggggg^tig^ # then ` sudo apt-get install tig` will be run

now we try __CTRL-r__ then type `gggg`, we can find:

    sudo apt-get install ggggg

## stop a process by force

    ps aux|grep firefox
    kill -9 [the process number of firefox]

## create a tar ball
    
    tar zcvf toy.tgz toy
    tar zxvf toy.tgz 

or we can kill by name

    killall firefox


## user and grp

	chmod +x filename 
	chmod -x filename
	chmod 755 filename
	adduser xxx
	su xxx
	ls -l filename

diff and patch
	
	diff -u a b>ab.diff
	rm b
	patch < ab.diff 

check owner of a file

	ls -l filename

delete anything: 

	rm -rf filename

Clear your shell: __Ctrl-l__

show your Desktop: __Alt-Ctrl-d__

Check if the thing is a file or dir

        file dirname
        file filename

create a dir:

        mkdir dirname

## format test

 - __the thing__ iiiiiiiiiiiiiit is nice t is nice t is nice t is nice t is nice t is nice t is nice t is nice t is nice t is nice t is nice t is nice t is nice t is nice
 - __the thing__ it desciption goes hereiiiiiiiiiit is nice t is nice t is nice t is nice t is nice t is nice t is nice t is nice t is nice t is nice
 - __the thing__ it is nice
 
### the output of ls -l

 - `rwxr-xrw-` 
   skdjkfdsfdsjf sd fkdsjflkjsdkf jdsk fk sdjfksd jfk sdjkf sdkl
   fjksdl fkjsd kfj dsjfkjsd kf
 - `1` 
   this meanns sjdfk sdkjfsd fjdskfsd 
   fdsjf skdjf dsj fkjsdk fjdsk
 - `peter` 
   
   dsfjkdsjfk jdskjfksdjfksjdkfjksdjfkjsdk

   <table>
       <tr>
          <td>Foo</td>
      </tr>
   </table>


