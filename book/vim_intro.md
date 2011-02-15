---
layout: book
title: vim
---


When I learn a new software tool, I really want a tutorial that goes like
story-telling, and I can learn things from easy to difficult. In this sense
the vim official help files(these you get by typing `:h` in vim) are 
nice, but still there are two things I want for my students:

    - less stuff, so that we only focus on the most important
    - easier English, so that my students can read with smiles

so here this is my guide to the vim official help files, enjoy.

Screencasts can be a lot of help in learning vim, so I am building some in
easy English, following the flow of vim `:h`, focusing on only basic stuff,
and giving extra explain whenever I think is necessary.

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

