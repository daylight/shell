#!/bin/bash
#print world < 6

for i in I am oldboy teacher welcome to oldboy training class
do
	if [ "${#i}" -le 6 ]; then
			echo $i
	fi
done
