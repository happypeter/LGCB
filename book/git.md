---
layout: default
---
# git

## go back to certain version

     git checkout 2e343ea



	git clone git://....

now how to get the new changes

	cd job-akae.wiki
	git pull	

## git config

for more info:
    
    man git-config

this is my `~/.gitconfig`


    [user]
            name = peter    
            email = username@mydomain.com

    [color]
            diff = auto
            status = auto
            branch = auto
            interactive = auto
            ui = true
            pager = true

    [color "branch"]
            current = yellow reverse
            local = yellow
            remote = green

    [color "diff"]
            meta = yellow bold
            frag = magenta bold
            old = red bold
            new = green bold

    [color "status"]
            added = yellow
            changed = green
            untracked = cyan

    [core]
            editor = vim
                

    [alias]
            co = checkout
            ci = commit -a  
            st = status
            br = branch 

## git create repo

     mkdir gitrepo
     cd gitrepo/
     git init
     vim file.txt
     git add file.txt
     git commit -a -m "first"
     tig
     vim file.txt 
     git commit -a -m "second time"
     tig
     history >git.txt

## github

    rm -rf .ssh/
    ssh-keygen -t dsa
    sudo apt-get install xclip
    cat /home/jiesse/.ssh/id_dsa.pub| xclip -sel clip
    ssh git@github.com
    ssh -v git@github.com

sometimes, it took one minite for the key to take effect, but it can also be
one day, so be patient.


## tig

	apt-get install tig
	man tig
	cd dirname
	tig
