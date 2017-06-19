#!/bin/bash

brctl delif v-12345678 eno1

ifconfig v-12345678 0
ifconfig v-12345678 down

brctl delbr v-12345678

cp /etc/network/interfaces_clear /etc/network/interfaces

service networking restart
sleep 1
