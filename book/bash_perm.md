---
layout: book
title: Permissions
---

In this lesson, we are going to talk about _permissions_ in Linux. Say, we are
going to delete one file:

    peter@cat:~$ rm /bin/sh
    rm: cannot remove `/bin/sh': Permission denied


Obvisously failed, so what is "permission", and why `permission denied`?

## What is "permission"?
Usually, users can have _read_, _write_, _execute_ permissions to files,(there are
also other permissions, not so often used though).

<div class="slide">
  <img src="/LGCB-assets/bash/perm_1.png" />
</div>

Let's start with some common sense.

To one specific file, it's creator(and naturally become it's owner by
default) will most likely have the most permissions. And then for his friends,
he might decide to give relatively more permissions. Finally for others, he
might be mean, and gives less permissions.

<div class="slide">
  <img src="images/bash_perm/2.png" />
</div>
Back to the Unix theroy.
