#!/bin/bash


if [ -f $HOME/iaaslite.sh ]; then
	echo "skip genenrate"
	exit
else
	touch $HOME/iaaslite.sh
fi

file=$HOME/iaaslite.sh

echo "#!/bin/bash" >> $file
echo "systemctl enable lxc-net" >> $file
echo "systemctl start lxc-net" >> $file
echo "cp /etc/network/interfaces /etc/network/interfaces_clear" >> $file

echo "brctl addbr v-12345678" >> $file
echo "ifconfig v-12345678 up" >> $file

echo "sleep 1" >> $file
echo "echo auto v-12345678 >> /etc/network/interfaces" >> $file
echo "echo iface v-12345678 inet static >> /etc/network/interfaces" >> $file
echo "echo bridge_ports $SETTING_INTERFACE >> /etc/network/interfaces" >> $file
echo "echo bridge_fd 0 >> /etc/network/interfaces" >> $file
echo "echo bridge_maxwait 0 >> /etc/network/interfaces" >> $file
echo "echo address @@SETTING_IP >> /etc/network/interfaces" >> $file
echo "echo netmask $SETTING_NETMASK >> /etc/network/interfaces" >> $file

echo "echo post-up route del -net $SETTING_GATEWAY_NET dev $SETTING_INTERFACE >> /etc/network/interfaces" >> $file
echo "echo post-up route del default gw $SETTING_GATEWAY dev $SETTING_INTERFACE >> /etc/network/interfaces" >> $file
echo "echo post-up route add default gw $SETTING_GATEWAY dev v-12345678 >> /etc/network/interfaces" >> $file

echo "service networking restart" >> $file
echo "sleep 1" >> $file
