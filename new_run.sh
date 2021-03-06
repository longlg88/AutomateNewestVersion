#!/bin/bash

# help
help() {
    echo -e "Usage: ./new_run.sh [OPTIONS] COMMAND"
    echo -e "       ./new_run.sh [ --help] \n"
    echo -e "Automatically configuration service for cloud.\n"
    echo -e "Options: \n" 
    echo -e "   -H, --host         Use hosts groups"
    echo -e "   -h, --help         Print usage\n"
    echo -e "Commands:"
    echo -e "   init                        Initial settings"
	echo -e "	csvmgrrun					Volume manager run"
	echo -e "	dbdelete					Tibero6 delete in container"
	echo -e "	dbinstall					Tibero6 install & run in container"
	echo -e "	dbmanualdelete				Tibero6 manual delete"
	echo -e "	dbmanualinstall				Tibero6 manual install"
	echo -e "	dbmanualrun					Tibero6 manual run"
	echo -e "	dockerdelete				Docker delete"
	echo -e "	iaasrun						IaaS binary run"
	echo -e "	lxcclean					Container initial"
	echo -e "	lxcinstall					LXC install"
	echo -e "	networksetting				Network NIC setting"
	echo -e "	pingexternal				Ping test external IP"
	echo -e "	pinginternal				Ping test internal IP"
	echo -e "	poinstall					PO7 install in docker"
	echo -e "	zfsdelete					ZFS delete"
	echo -e "	zfsinstall					ZFS install"

    #echo -e "\033[1mName\033[0m"
    #echo -e "Install & configuration automatically"
    #echo -e
    #echo -e "\033[1mOPTIONS\033[0m"
    #echo -e "-h      help"
    #echo -e "-o      option"
    #echo -e 
    #echo -e "options: init / rundb / runpo / runall / delete"
    #echo -e "ex) ./run.sh -o run_all"
    exit 0
}

# set argument

while getopts "H:h:-help" opt
do
    echo $opt
    case $opt in
        H ) host="$2" action="$3"
        ;;
        h | -help) help ;;
        ?) help ;;
        *) help ;;
    esac
done

shift $(( $OPTIND -1 ))

user=`cat $PWD/vars/external_vars.yml | grep -a "user:" | awk -F: '{print $2}'`
user_home=`cat $PWD/vars/external_vars.yml | grep -a "user_home:" | awk -F: '{print $2}'`
ip=`cat $PWD/vars/external_vars.yml | grep -a "host_ip:" | awk -F: '{print $2}'`
pw=`cat $PWD/vars/external_vars.yml | grep -a "host_pw:" | awk -F: '{print $2}'`

echo "user = $user"
echo "user_home = $user_home"
echo "hosts = $host"
echo "action = $action"
echo "ip = $ip"
echo "pw = $pw"

## ansible host ssh keygen
file=`find /root/ -name "id_rsa"`
file2=`find $HOME -name "id_rsa"`

#if [ -f "$file" ]; then
#	echo "$file exists."
#else
#	if [ -f "$file2" ]; then
#		echo "$file2 exists"
#		host_count=`cat $PWD/hosts | grep -a $host -A 100 | grep $ip | wc -l`
#    	echo $host_count
#
#    	index=1
#    	while [ $index -le $host_count ]
#    	do
#        	host_ip=`cat $PWD/hosts | grep -a $host -A 100 | grep $ip | sed -n "$index"p`
#expect << EOF
#spawn sudo sh -c "ssh-copy-id -i $HOME/.ssh/id_rsa.pub $user@$host_ip"
#expect {
#"password:" {send "$pw\r"; exp_continue }
#eof
#}
#EOF
#        	index=$(($index+1))
#    	done
#	else
#		ssh-keygen -t rsa
#		host_count=`cat $PWD/hosts | grep -a $host -A 100 | grep $ip | wc -l`
#    	echo $host_count
#
#    	index=1
#    	while [ $index -le $host_count ]
#    	do
#        	host_ip=`cat $PWD/hosts | grep -a $host -A 100 | grep $ip | sed -n "$index"p`
#expect << EOF
#spawn sudo sh -c "ssh-copy-id -i $HOME/.ssh/id_rsa.pub $user@$host_ip"
#expect {
#"password:" {send "$pw\r"; exp_continue }
#eof
#}
#EOF
#        	index=$(($index+1))
#    	done
#	fi
#fi


#host_count=`cat $PWD/hosts | grep -v "\[" | grep -v "\#" | grep -v "^$" | grep -v "[a-z]" | grep -v "[A-Z]" | wc -l`



## Delete
if [ "$action" = "dbmanualdelete" ]; then
    sudo ansible-playbook delete/dbmanual_delete.yml -e "hosts=$host" -v
elif [ "$action" = "dockerdelete" ]; then
    sudo ansible-playbook delete/docker_delete.yml -e "hosts=$host" -v 
elif [ "$action" = "zfsdelete" ]; then
    sudo ansible-playbook delete/zfs_delete.yml -e "hosts=$host" -v

##Install 
elif [ "$action" = "init" ]; then
    sudo ansible-playbook install/init.yml -e "hosts=$host" -v
elif [ "$action" = "csvmgrrun" ]; then
	sudo ansible-playbook install/csvmgr_run.yml -e "hosts=$host" -v
elif [ "$action" = "computeinit" ]; then
	sudo ansible-playbook install/compute_init.yml -e "hosts=$host" -v
elif [ "$action" = "dbmanualinstall" ]; then
	sudo ansible-playbook install/dbmanual_install.yml -e "hosts=$host" -v
elif [ "$action" = "imageinnerdockerinstall" ]; then
	sudo ansible-playbook install/image_inner_docker_install.yml -e "hosts=$host" -v
elif [ "$action" = "imgatewayinit" ]; then
	sudo ansible-playbook install/image_gateway_init.yml -e "hosts=$host" -v
elif [ "$action" = "imscpinit" ]; then
	sudo ansible-playbook install/image_scp_init.yml -e "hosts=$host" -v
elif [ "$action" = "networksetting" ]; then
	sudo ansible-playbook install/network_setting.yml -e "hosts=$host" -v
elif [ "$action" = "pomanualinstall" ]; then
	sudo ansible-playbook install/pomanual_install.yml -e "hosts=$host" -v
elif [ "$action" = "portalwebinstall" ]; then
	sudo ansible-playbook install/portal_web_install.yml -e "hosts=$host" -v
elif [ "$action" = "storageinit" ]; then
	sudo ansible-playbook install/storage_init.yml -e "hosts=$host" -v
elif [ "$action" = "zfsinstall" ]; then
	sudo ansible-playbook install/zfs_install.yml -e "hosts=$host" -v
elif [ "$action" = "sysagentinstall" ]; then
    sudo ansible-playbook install/sysmanager_agent.yml -e "hosts=$host" -v
elif [ "$action" = "proxyinit" ]; then
	sudo ansible-playbook install/proxy_init.yml -e "hosts=$host" -v
elif [ "$action" = "osinstallconf" ]; then
	sudo ansible-playbook install/osinstall_conf.yml -e "hosts=$host" -v
elif [ "$action" = "bridgesetting" ]; then
	sudo ansible-playbook install/bridge_setting.yml -e "hosts=$host" -v
elif [ "$action" = "i1dbmanualinstall" ]; then
	sudo ansible-playbook install/i1dbmanual_install.yml -e "hosts=$host" -v
 
## manage 
elif [ "$action" = "dbmanualrun" ]; then
    sudo ansible-playbook manage/dbmanual_run.yml -e "hosts=$host" -v
elif [ "$action" = "dbmanualcsvmgrrun" ]; then
	sudo ansible-playbook manage/dbmanual_csvmgr_run.yml -e "hosts=$host" -v
elif [ "$action" = "lxcclean" ]; then
    sudo ansible-playbook manage/lxc_clean.yml -e "hosts=$host" -v
elif [ "$action" = "iaasrun" ]; then
    sudo ansible-playbook manage/iaas_run.yml -e "hosts=$host" -v
elif [ "$action" = "networksettingclear" ]; then
    sudo ansible-playbook manage/network_setting_clear.yml -e "hosts=$host" -v
elif [ "$action" = "sysagentrun" ]; then
    sudo ansible-playbook manage/sysagent_run.yml -e "hosts=$host" -v
elif [ "$action" = "sysagentgetlog" ]; then
    sudo ansible-playbook manage/sysagent_getlog.yml -e "hosts=$host" -v
elif [ "$action" = "sysagentlive" ]; then
    sudo ansible-playbook manage/sysagent_live.yml -e "hosts=$host" -v
elif [ "$action" = "sysagentkill" ]; then
    sudo ansible-playbook manage/sysagent_kill.yml -e "hosts=$host" -v
elif [ "$action" = "dbexport" ]; then
	sudo ansible-playbook manage/db_export.yml -e "hosts=$host" -v
elif [ "$action" = "dbimport" ]; then
	sudo ansible-playbook manage/db_import.yml -e "hosts=$host" -v
elif [ "$action" = "pingexternal" ]; then
    sudo ansible-playbook manage/ping_external.yml -e "hosts=$host" -v
elif [ "$action" = "pinginternal" ]; then
    sudo ansible-playbook manage/ping_internal.yml -e "hosts=$host" -v
elif [ "$action" = "downloadtest" ]; then
    sudo ansible-playbook manage/downloadtest.yml -e "hosts=$host" -v
elif [ "$action" = "portalwebrun" ]; then
    sudo ansible-playbook manage/portal_web_run.yml -e "hosts=$host" -v
elif [ "$action" = "portalserverrun" ]; then
    sudo ansible-playbook manage/portal_server_run.yml -e "hosts=$host" -v
elif [ "$action" = "tcnmrun" ]; then
    sudo ansible-playbook manage/tcnm_run.yml -e "hosts=$host" -v
elif [ "$action" = "podown" ]; then
	sudo ansible-playbook manage/po_down.yml -e "hosts=$host" -v
elif [ "$action" = "portalwebdown" ]; then
	sudo ansible-playbook manage/portal_web_down.yml -e "hosts=$host" -v
elif [ "$action" = "bridgeclear" ]; then
	sudo ansible-playbook manage/bridge_clear.yml -e "hosts=$host" -v
elif [ "$action" = "i1dbmanualrun" ]; then
	sudo ansible-playbook manage/i1dbmanual_run.yml -e "hosts=$host" -v

## docker app install & run
elif [ "$action" = "poinstall" ]; then
    sudo ansible-playbook dappinstall/po_install.yml -e "hosts=$host" -v
elif [ "$action" = "dockeriaasrun" ]; then
    sudo ansible-playbook dappinstall/docker_iaas_run.yml -e "hosts=$host" -v
elif [ "$action" = "dockertcnminstall" ]; then
    sudo ansible-playbook dappinstall/docker_tcnm_install.yml -e "hosts=$host" -v
elif [ "$action" = "dockertcnmrun" ]; then
    sudo ansible-playbook dappinstall/docker_tcnm_run.yml -e "hosts=$host" -v
elif [ "$action" = "dockerportalwebinstall" ]; then
    sudo ansible-playbook dappinstall/docker_portal_web_install.yml -e "hosts=$host" -v
elif [ "$action" = "dockerportalwebrun" ]; then
    sudo ansible-playbook dappinstall/docker_portal_web_run.yml -e "hosts=$host" -v
elif [ "$action" = "dockerportalserverinstall" ]; then
    sudo ansible-playbook dappinstall/docker_portal_server_install.yml -e "hosts=$host" -v
elif [ "$action" = "dockerportalserverrun" ]; then
    sudo ansible-playbook dappinstall/docker_portal_server_run.yml -e "hosts=$host" -v
elif [ "$action" = "authinstall" ]; then
    sudo ansible-playbook dappinstall/auth_install.yml -e "hosts=$host" -v
elif [ "$action" = "authrun" ]; then
    sudo ansible-playbook dappinstall/auth_run.yml -e "hosts=$host" -v
elif [ "$action" = "cmdbinstall" ]; then
    sudo ansible-playbook dappinstall/cmdb_install.yml -e "hosts=$host" -v
elif [ "$action" = "cmdbrun" ]; then
    sudo ansible-playbook dappinstall/cmdb_run.yml -e "hosts=$host" -v
elif [ "$action" = "dbinstall" ]; then
    sudo ansible-playbook dappinstall/db_install.yml -e "hosts=$host" -v

else
    echo "Unrecongnized host : "$host "command : "$action
fi
