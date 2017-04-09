#!/bin/bash
#date: 2017/3/16


DATE=`date +%F`
PATH_NGINX="/usr/local/lnmp/nginx"
PATH_PHP="/usr/local/lnmp/php"
PATH_MYSQL="/usr/local/lnmp/mysql"
PATH_NGINX_TAR="./nginx-1.8.0.tar.gz"


weclome_menu()
{
	while :
	do
	clear
    cat <<-EOF
	lnmp install                          date:$DATE
	1.Install Nginx
	2.Install php-fpm
	3.Install mysql
	4.exit
	EOF
	read -p "please select(1-3):" ANS
	case $ANS in
		1) ins_nginx ;;
		2) : ;;
		3) : ;;
		4) exit 0 ;;
		*) echo -n "please select (1-3):"
			break
		;;
	esac
	done
}
is_user_root()
{
	if [ `whoami` == "root" ]; then
		return 0
	else
		return 1
	fi
}
ins_nginx()
{
	if is_exit_nginx ;then
		echo "Nginx already installed or did not pure remove."
		exit 1
	fi
	apt-get install libpcre+* zlib1g* libssl1.0.0 libssl-dev gcc make -y &> /dev/null
	[ $? -ne 0 ] && exit 1
	[ -e $PATH_NGINX_TAR ] && tar zxf $PATH_NGINX_TAR || exit 1
	cd ${PATH_NGINX_TAR%%.tar.gz}
	./configure --prefix=${PATH_NGINX} --with-http_stub_status_module --with-http_ssl_module
	make && make install
}
ins_php()
{
	:
}
ins_mysql()
{
	:
}
if is_user_root; then
	weclome_menu
else
	echo "you must be root"
	exit 0
fi
