#!/bin/bash
read -p "C NETWORK" MYNET
PINGNET=`echo $MYNET | sed 's/\([0-9.]*\)\.[0-9]*/\1/g'`
let I=1
while [ $I -le 254 ];do
	ping -c1 -w1 $PINGNET.$I &> /dev/null
	[ $? -eq 0 ] && echo "$PINGNET.$I online." || echo "$PINGNET.$I offline."
	let I=I+1 
done
