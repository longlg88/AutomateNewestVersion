#!/bin/bash

systemctl enable lxc-net
systemctl start lxc-net

brctl addbr v-12345678
ifconfig v-12345678 up

sleep 1
echo auto v-12345678 >> /etc/network/interfaces
echo iface v-12345678 inet static >> /etc/network/interfaces
echo bridge_ports eno1 >> /etc/network/interfaces
echo bridge_fd 0 >> /etc/network/interfaces
echo bridge_maxwait 0 >> /etc/network/interfaces
echo address 192.168.201.40 >> /etc/network/interfaces
echo netmask 255.255.255.0 >> /etc/network/interfaces

service networking restart
sleep 5
route add default gw 192.168.201.1 dev v-12345678

route del -net 192.168.201.0/24 dev eno1
route del default gw 192.168.201.1 dev eno1
