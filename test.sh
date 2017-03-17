#read -p "Pls input two num:" a b
#[ -z "$a" -o -z "$b" ]&&{
#   echo "must be two num."
#   exit 1
#}
#!/bin/sh
str="the squid project provides a number of resources toassist users design,implement and support squid installations. Please browsethe documentation and support sections for more infomation"
words(){
echo $str|sed 's#[^a-zA-Z]# #g'|tr " " "\n"|grep -v "^$"|sort|uniq -c|sort -r -n
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
