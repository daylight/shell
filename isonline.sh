#!/bin/bash

Nmap_ip()
{
    for i in `seq 10`
    do
        result=$(nmap -sP 192.168.177.$i | grep 'Host is up' | wc -l)
        if [ $result -eq 1 ]; then
            echo "192.168.177.$i is online."
            let i=i+1
        else
            echo "192.168.177.$i is offline."
        fi
    done
}
main()
{
    Nmap_ip
    echo "The total number of online is $i"
}
main
