#!/bin/bash
book_url="http://happypeter.github.com/LGCB/book/"
OUTPUT_FILE=lgcb.html

for file in `ls ../book|grep .md|grep -v tmp`
do
    short_name=`echo $file|awk -F"." '{print $1}'`
    echo $short_name
    page_url=$book_url$short_name".html"
    wget $page_url >/dev/null
done

## now parse index to know how to who comes first

wget $book_url/index.html >/dev/null
echo """
<style media="screen" >
    /*this is very important for me*/
    pre { margin-left: 3% }

</style>
<title>Linux Guide for Chines Beginners</title>
""" >$OUTPUT_FILE
for page_name in `cat index.html|grep -o [a-z1-9]*_.*.html`
do
        cat $page_name |sed '1,11d'|sed 'N;$!P;$!D;$d' >>$OUTPUT_FILE 
        rm $page_name
        # delete the first 11 & last 2 lines of a file
done

cp -rf  ../book/images/ .
rm index.html

#################################
#
#    h1->h2  h2->h3
#    
#################################
# need to consider <h2 style=ccc>xxx</h2>, so we need this:
cat $OUTPUT_FILE|sed 's/<h2/<h3/g'|sed 's/h2>/h3>/g'|sed 's/<h1/<h2/g'|sed 's/h1>/h2>/g' >ll.html


# now mannully add ( we can also get these name of "part"s by processing index.html)
#  <h1> Part 1: Getting started </h1>
#  to ll.html
#  then use  htmldoc to generate a pdf, it looks really nice

