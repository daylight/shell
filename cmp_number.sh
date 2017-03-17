#!/bin/bash
#脚本传递参数比较数字大小

[ $# -ne 2 ] &&{
    echo "Usage:`basename $0`:num1 num2"
	exit 1
}
expr $1 + 1 &>/dev/null
[ $? -ne 0 ]&&{
	echo "$1 must be int."
	exit 1
}
expr $2 + 1 &>/dev/null
[ $? -ne 0 ]&&{
    echo "$2 must be int."
	exit 1
}
if [ $1 -gt $2 ]; then
	echo "$1 > $2"
elif [ $1 -lt $2 ]; then
    echo "$1 < $2"
else
    echo "$1 = $2"
fi
