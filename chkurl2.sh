URLS=(
http://www.etiantian.org
http://www.taobao.com
http://oldboy.blog.51cto.com
http://10.0.0.70
)
LTIME(){
echo -n "time;"
for n in {1..10}
do
  if [ $n -eq 10 ]
   then
    echo "start"
  else
    echo -n .
  fi
  sleep 1
done
}
CHECK_URL(){
  wget -T 3 --spider --tries=2 $1 &>/dev/null
  if [ $? -eq 0 ]
  then
    return 0
  else
    return 1
  fi
}
MON_URL(){
for url in ${URLS[*]}
do
  CHECK_URL $url
  if [ $? -eq 0 ]
  then
    echo "$url ok"
  else
    echo "$url false"
  fi
done
}
main(){
while true
do
  LTIME
  MON_URL
  sleep 10
done
}
main
