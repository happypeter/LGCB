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
""" >$OUTPUT_FILE
for page_name in `cat index.html|grep -o [a-z1-9]*_.*.html`
do
        cat $page_name |sed '1,11d'|sed 'N;$!P;$!D;$d' >>$OUTPUT_FILE 
        rm $page_name
        # delete the first 11 & last 2 lines of a file
done

cp -rf  ../book/images/ .
rm index.html
