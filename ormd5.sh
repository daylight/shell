#!/bin/bash


a=(
21029299
00205d1c
a3da1677
1f6d12dd
890684b
)
for i in `seq 1 32767`
do
    for j in ${a[@]}
    do
        SOURCE=`echo $i | md5sum | cut -c 1-8`
        if [ $SOURCE == $j ];then
            echo "$SOURCE --> $i"
        fi
    done
done
