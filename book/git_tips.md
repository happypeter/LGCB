---
layout: book
title: Git Tips
---

## go back to certain version

    git checkout 2e343ea



## github

    rm -rf .ssh/
    ssh-keygen -t dsa
    sudo apt-get install xclip
    cat /home/jiesse/.ssh/id_dsa.pub| xclip -sel clip
    ssh git@github.com
    ssh -v git@github.com

Sometimes, it took one minite for the key to take effect, but it can also be
one day, so be patient.


## tig

    apt-get install tig
	man tig
	cd dirname
	tig
