#!/bin/bash

## find IP
host_ip=`ifconfig -a | grep "inet " | grep "Bcast:" | awk '{print $2}' | awk -F: '{print $2}' | sed -n 1p`

## Change IP
sed -i -e "s/@@SETTING_IP/$host_ip/g" $PWD/automation/gen_iaaslite.sh
