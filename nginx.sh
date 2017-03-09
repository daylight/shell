#!/bin/bash
#usage: nginx start scripts
#       you must modify $CMD to yourself
#date:  17/3/9
#author: day

STATUS=""
CMD="/usr/local/nginx/sbin/nginx"
PID_file="/usr/local/nginx/logs/nginx.pid"
WRONG_MESSAGE="some wrong happened,nginxplease cheak...cant't"

status()
{
    if [ -f $PID_file ];then
		echo "nginx is running..."
	else
		echo "nginx is stop..."
	fi
}
usage()
{
	echo "Usage: `basename $0` [start|stop|restart|reload|status|-h]"
	exit 1
}
start()
{
    
    if [ -f $PID_file ];then
        echo "Nginx is running..."
        exit 1
	else
		if $CMD -t | grep -sq sucesssful ; then
			$CMD
			if [ $? -eq 0 ];then
				echo "nginx is start...                  [ok]"
			else
				echo "${WRONG_MESSAGE} start" >&2
			fi
		else
			$CMD -t
			exit 1
		fi
	fi
}
stop()
{
	if [ ! -f $PID_file ];then
		echo "Nginx is not running..."
	else
		$CMD -s stop
		if [ $? -eq 0 ];then
			echo "Nginx is stoped..."
		else
			echo "${WRONG_MESSAGE} stop" >&2
		fi
	fi
}

reload()
{
	if [ -f $PID_file];then
		if $CMD -t | grep -sq sucessful ; then
			$CMD -s reload && echo "reload ok...."
		else
		    $CMD -t
			exit 1
		fi
	else
		echo "nginx is not running..."
	fi
}
if [ $(whoami) != "root" ];then
	echo "Permssion deny,please change to root"
	exit 1
fi
if [ $# -ne 1 ];then
	usage
	exit 1
fi
case $1 in
	start) start;;
	stop) stop;;
	restart) stop
             sleep 3
			 start
             ;;
    reload) reload;;
    status) status;;
    *) usage ;;
esac
