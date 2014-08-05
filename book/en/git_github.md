---
layout: book
title: Github 
---

## Github setup

Good news: now github have a really nice doc page on setup:

<http://help.github.com/linux-set-up-git/>


The only step that may cause you trouble is adding ssh key, if that happens,
follow what I did, and I tested it on at least 5 different machines, all
worked:

    rm -rf .ssh/
    ssh-keygen -t dsa
    sudo apt-get install xclip
    cat /home/jiesse/.ssh/id_dsa.pub| xclip -sel clip
    ssh git@github.com
    ssh -v git@github.com

Sometimes, it took one minite for the key to take effect, but it can also be
one day, so be patient.


## Github pages

A lot people like to know how did I get my 

user page: <http://happypeter.github.com/>

and project pages like <http://happypeter.github.com/LGCB/>

here goes the steps:

<http://pages.github.com/>
