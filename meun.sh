#!/bin/bash
while :
do
    clear
    cat <<-EOF
	1.[install lamp]
	2.[install lnmp]
	3.[exit]
	pls input the num you want:
	EOF
read SEL
case $SEL in
    1) echo "install lamp" ;;
	2) echo "install lnmp" ;;
    3) exit ;;
	*) echo "no section"
esac
	read ANS
done
