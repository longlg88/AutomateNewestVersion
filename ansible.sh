#!/bin/bash

apt-get -y install expect

sudo apt-get -y install software-properties-common


expect << EOF
spawn sudo apt-add-repository ppa:ansible/ansible
expect {
    "adding it" { send "\r" }
    sleep 1
eof
}

EOF

apt-get -y update

apt-get -y install ansible
