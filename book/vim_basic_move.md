---
layout: book
title: Basic Movement
---

## why normal mode first?

When you already understand why __vim__ has different modes, you may still wonder,
why __vim__ first takes us to _normal mode_(also called _command mode_) rather
than _insert mode_?

It is because in a programmer's daily editing, most time are spent to modify
things, not adding text. and in normal mode you can really move around much
faster, and changing things much easier.

## Moving around 

After you return to _Normal mode_, you can move around by using these keys:

             ^
             k              Hint:  The h key is at the left and moves left.
       < h       l >               The l key is at the right and moves right.
             j                     The j key looks like a down arrow.
             v


You can also move the cursor by using the arrow keys. But NEVER do it! 
Because, you must move your hand from the text keys to the arrow keys.


Check

    4_basic_move.mov

[basic_move-zh](http://v.youku.com/v_show/id_XMjQ5NzMxMzYw.html) 


## FAQ

__Q:__ 

How u move to the end of the line, i know one way : $, but this need to
press shift button, i feel u do it fast , so i wonder whether you have better
way ?

__A:__

I do not use $ very often.

usually when we go to the end of line, we actually want to append sth to the
line, so it's best to have a shortcut that takes us to the end of line
and switch to _insert mode_ at the same time. luckily __vim__ has that and it is

    A

try it :)

