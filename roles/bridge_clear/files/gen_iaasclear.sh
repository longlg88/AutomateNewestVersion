#!/bin/bash

if [ -f $HOME/iaasclear.sh ]; then
	echo "skip genenrate"
	exit
else
	touch $HOME/iaasclear.sh
fi

file=$HOME/iaasclear.sh

echo "#!/bin/bash" >> $file
                                                             
echo "brctl delif v-12345678 $SETTING_INTERFACE" >> $file                  
echo "ifconfig v-12345678 0" >> $file
echo "ifconfig v-12345678 down" >> $file
echo "brctl delbr v-12345678" >> $file
echo "cp /etc/network/interfaces_clear /etc/network/interfaces" >> $file                              
echo "service networking restart" >> $file                   
echo "sleep 1" >> $file
