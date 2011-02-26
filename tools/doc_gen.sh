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
partno=0    
while read line
do
    echo $line |grep h2 &>/dev/null
    if [ "$?" = "0" ] 
    then
        
        part_name=$line
        tag_name=Part$(( ++partno ))
        echo $part_name|sed 's/<\/h2>//g'|sed "s/<h2>/$tag_name:/g" >>$OUTPUT_FILE
        # <h2> topic </h2>  into Part1:topic
    fi
    echo $line |grep \<li\> &>/dev/null
    if [ "$?" = "0" ] 
    then
        page_name=`echo $line|grep -o [a-z1-9]*_.*.html`
        echo $page_name
        cat $page_name |sed '1,11d'|sed 'N;$!P;$!D;$d' >>$OUTPUT_FILE
        # delete the first 11 & last 2 lines of a file
        rm $page_name
    fi

done < index.html


cp -rf  ../book/images/ .
rm index.html

#################################
#
#    h1->h2  h2->h3
#    "<Part 1>" -> "<h1> Part 1:"
#    
#################################
# need to consider <h2 style=ccc>xxx</h2>, so we need this:
sed -i 's/<h2/<h3/g' lgcb.html
sed -i 's/h2>/h3>/g' lgcb.html
sed -i 's/<h1/<h2/g' lgcb.html
sed -i 's/h1>/h2>/g' lgcb.html

# now "Part 1:topic"->"<h1>Part1:topic</h1>"
sed -i "s/Part[1-9]*:.*/<h1>&<h1>/g" lgcb.html 

# use  htmldoc to generate a pdf, it looks really nice

