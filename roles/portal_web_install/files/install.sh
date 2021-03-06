#!/bin/bash

expect << EOF
    spawn sh -c "/root/automation/portal_web/WEBTOB5_0_SP0_Fix1_LinuxK2_6_x64.bin > /root/automation/portal_web/log"
        expect "PRESS <ENTER> TO CONTINUE:"
            send "\n"
        expect "License Agreement:"
            send "\n"
        expect "PRESS <ENTER> TO CONTINUE:"
            send "\r"
        expect "PRESS <ENTER> TO CONTINUE:"
            send "\r"
        expect "DO YOU ACCEPT THE TERMS OF THIS LICENSE AGREEMENT? (Y/N):"
            send "Y\r"
        expect "DEFAULT"
            send "1\r"
        expect "DEFAULT"
            send "\r"
        expect "PRESS <ENTER> TO CONTINUE:"
            send "\r"
        expect "PRESS <ENTER> TO INSTALL:"
            send "\r"
        expect "PRESS <ENTER> TO CONTINUE:"
            send "\r"
        expect "PRESS <ENTER> TO EXIT THE INSTALLER:"
            send "\r"
    expect eof 
EOF
