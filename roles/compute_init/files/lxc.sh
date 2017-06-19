#!/bin/bash

# Package Install
apt-get install -y openssh-server openssh-client
apt-get install -y sshpass
apt-get install -y curl
apt-get install -y bridge-utils
apt-get install -y lxc
apt-get install -y net-tools
apt-get install -y iproute
apt-get install -y arptables
apt-get install -y nfs-common
DEBIAN_FRONTEND=noninteractive apt-get install -y procmail
