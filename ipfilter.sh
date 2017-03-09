#!/bin/bash

ip_filter_command="iptables -I INPUT -j DROP -s"
ip_file="./ddos.txt"

ip_check()
{
    grep "EST" $ip_file | sudo netstat -anltp | grep "EST" |awk -F "[ |:]+" '{print $6}' | sort | uniq -c | sort -nr > ./ip.txt
}
ip_filter()
{
    while read ip_count ip
    do
        ip_fil=$(iptables -nL | grep $ip | wc -l)
        if [ $ip_count -gt 25 -a $ip_fil -eq 0 ]; then
            $ip_filter_command ${ip}
            echo $ip >> ./ip_filter.txt
            echo "$(date +%F-%H:%M:%S) filtered by $(whoami)" >> /server/scripts/ip_filtered.txt
        fi
   done < ./ip.txt
}
main()
{
	ip_check
    ip_filter
}
main
