#!/bin/bash


while getopts "H:n:h:-help" opt
do
    echo $opt
    case $opt in
        H ) host="$2" ;;
	n ) num="$4" ;;
	h | -help) help ;;
	?) help ;;
	*) help ;;
    esac
done

shift $(( $OPTIND -1 ))

user=`cat $PWD/vars/external_vars.yml | grep -a "user:" | awk -F: '{print $2}'`
user_home=`cat $PWD/vars/external_vars.yml | grep -a "user_home:" | awk -F: '{print $2}'`
ip=`cat $PWD/vars/external_vars.yml | grep -a "host_ip:" | awk -F: '{print $2}'`
host_count=`cat $PWD/hosts | grep -a $host -A $num | grep $ip | wc -l`

## ansible host ssh keygen
file=`find /root/ -name "id_rsa"`
file2=`find $HOME -name "id_rsa"`

if [ -f "$file" ]; then
    echo "$file exists."
    index=1
    while [ $index -le $host_count ]
    do
        host_ip=`cat $PWD/hosts | grep -a $host -A $num | grep $ip | sed -n "$index"p`
        sudo ssh-copy-id -i $HOME/.ssh/id_rsa.pub $user@$host_ip
        index=$(($index+1))
    done
elif [ -f "$file2" ]; then
    index=1
    while [ $index -le $host_count ]
    do
        host_ip=`cat $PWD/hosts | grep -a $host -A $num | grep $ip | sed -n "$index"p`
	echo $host_ip
        sudo ssh-copy-id -i $HOME/.ssh/id_rsa.pub $user@$host_ip
        index=$(($index+1))
    done    
else
    ssh-keygen -t rsa
    index=1
    while [ $index -le $host_count ]
    do
        host_ip=`cat $PWD/hosts | grep -a $host -A $num | grep $ip | sed -n "$index"p`
        sudo ssh-copy-id -i $HOME/.ssh/id_rsa.pub $user@$host_ip
        index=$(($index+1))
    done
fi
