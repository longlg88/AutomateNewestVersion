#!/bin/bash

# apt update && upgrade && remove unnecessary files
echo -e "apt update && upgrade && remove unnecessary files"
apt-get -y update

apt-get -y upgrade


# apt install vim
echo -e "apt install vim"
apt-get -y install vim


# apt-get -y install sshpass
apt-get -y install sshpass

#dpkg -i arptables_*
#modprobe br_netfilter
