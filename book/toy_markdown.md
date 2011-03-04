---
layout: book
title: Markdown
---

## What is Markdown?
Markdown is a text-to-HTML conversion tool for web writers. Markdown allows
you to write using an easy-to-read, easy-to-write plain text format, then
convert it to structurally valid XHTML (or HTML).

<http://daringfireball.net/projects/markdown/>

## Why Peter love Markdown?

I love Markdown, and am using it to do almost all my notes and documents. If
you don't have any format for your contents, it can be quit confusing, so
no matter how lazy you are, you should do some markups to your lines. And
__markdown__ is:

 - the easiest way you can do "text-to-HTML"
 - the source format is also highly highly readable.

## How to Use?

First try to install it on ubuntu:

    sudo apt-get install markdown

it should work on any version of ubuntu (though, I only tested this on 9.10 and later).

Now open a file with your favorite editor, have these:

    ## title
    this is my code
        
        main()
        {
            printf(...);
        }

    and this is very __important__

Save it with a name, say, _myfile.md_, and now:

    markdown mymfile.md > myfile.html
    firefox myfile.html&

That's it, cool, ah?
