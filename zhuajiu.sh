#!/bin/bash
>/tmp/temp.txt
input()
{
    while true
    do
        read -p "pls enter your name?" NAME
        if [ -z $NAME ]; then
            continue
        elif [ $NAME == "0" ]
        then
            break
        fi
        rand=$((RANDOM%100))
        echo -e $rand"\t"$NAME >>/tmp/temp.txt
    done
}
output()
{
    cat /tmp/temp.txt | sort -n -k1 -r | sed '3a###########'
}
main()
{
    input
    output
}
main
