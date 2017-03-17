#!/bin/bash

str="the squid project provides a number of resources toassist users design,implement and support squid installations. Please browsethe documentation and support sections for more infomation"

words(){
    echo $str| sed 's/^[a-z][A-Z]//g'|tr " " "\n"| sed 's/^$//g'|sort | uniq -c|sort -rn
}
letters(){
    echo $str|grep -o "."|sort|egrep -v " |^$|[^a-zA-Z]"|uniq -c|sort -n -r
}

case $1 in
words)
    words
    ;;
letters)
    letters
    ;;
*)
    echo "usage:$0 {words|letters}"
esac
