---
layout: book
title: Basic Movement
---

## why normal mode first?

when you already understand why vim has different modes, you may still wonder,
why vim first takes us to _normal mode_(also called _command mode_) rather
than _insert mode_

It is because in a programmer's daily editing, most time are spent to modify
things, not adding text. and in normal mode you can really move around much
faster, and changing things much easier.

## Moving around 

After you return to Normal mode, you can move around by using these keys:

	h   left						*hjkl*
	j   down
	k   up
	l   right

At first, it may appear that these commands were chosen at random.  After all,
who ever heard of using l for right?  But actually, there is a very good
reason for these choices: Moving the cursor is the most common thing you do in
an editor, and these keys are on the home row of your right hand.  In other
words, these commands are placed where you can type them the fastest
(especially when you type with ten fingers).

You can also move the cursor by using the arrow keys.  If you do,
however, you greatly slow down your editing because to press the arrow
keys, you must move your hand from the text keys to the arrow keys.
Considering that you might be doing it hundreds of times an hour, this
can take a significant amount of time.
   Also, there are keyboards which do not have arrow keys, or which
locate them in unusual places; therefore, knowing the use of the hjkl
keys helps in those situations.

One way to remember these commands is that h is on the left, l is on the
right and j points down.  In a picture: >

             ^
             k              Hint:  The h key is at the left and moves left.
       < h       l >               The l key is at the right and moves right.
             j                     The j key looks like a down arrow.
             v

check

    4_basic_move.mov
