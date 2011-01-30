---
layout: book
title: vim
---


how to save a file belong to root in vim as common user

    :w !sudo tee %

lots of other good stuff here:
<http://www.catonmat.net/>
## cscope and ctags

`xp`--- to exchange two char

`rc`--- change the char in front of the cursor to 'c'

`zf%`--- to fold a block

`zx` --- to open it

`zc` --- to close it
## quickfix

    :make
    :cwindow
    :cn
    :h quickfix

## my vim slides

<http://vim-showoff-peter.heroku.com/>

## get my vim plugins

    git clone git://github.com/happypeter/peter-vim.git

then follow this:
<http://happypeter.github.com/GitBeijing/vim-conf-share.html>

## insert mode shortcut
__Ctrl-x-l__
__Ctrl-n__
__Ctrl-x-k__

## help

	:h
	:h bd
	:h tutor

## move

`gg` to the top of the file

`G` to the end of the file

`w` to next word

`2w` to next next word

## copy and paste

__SHIFT_V__ then use `j` or `k` to move the cursor

use `y` to copy

and `d` to cut

then move to another place then `p` (paste)

