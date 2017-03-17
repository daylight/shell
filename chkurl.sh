#!/bin/bsh

URLS=(
http://www.etiantian.org
http://www.taobao.com
http://oldboy.blog.51cto.com
http://10.0.0.70
)
ltime(){
echo -n "wait:"
for n in {1..10}
do
    if [ $n -eq 10 ]; then
        echo "start"
    else
        echo -n .
    fi
    sleep 1
done
}
check_url()
{
    wget -T 3 --spider --tries 2 $1 &>/dev/null
    if [ $? -eq 0 ]; then
        return 0
    else
        return 1
    fi
}
mon_url()
{
    for i in ${URLS[*]}
    do
      check_url $i
      if [ $? -eq 0 ]
      then
          echo "$i ok"
      else
          echo "$i false"
      fi
    done
}
main(){
while true
do
    ltime
    mon_url
    sleep 1
done
}
main
