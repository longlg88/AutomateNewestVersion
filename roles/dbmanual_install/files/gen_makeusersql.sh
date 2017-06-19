#!/bin/bash

if [ -f $PWD/automation/db_files/sql_script/make_user.sql ]; then
    echo "skip generate"
    exit
else
    touch $PWD/automation/db_files/sql_script/make_user.sql
fi

sql=$PWD/automation/db_files/sql_script/make_user.sql

echo "create user $TID identified by '$TPW';" >> $sql
echo "grant create sequence to $TID;" >> $sql
echo "grant create session to $TID;" >> $sql
echo "grant create table to $TID;" >> $sql
echo "grant create trigger to $TID;" >> $sql

echo "create user $PORTALTID identified by '$PORTALTPW';" >> $sql
echo "grant create sequence to $PORTALTID;" >> $sql
echo "grant create session to $PORTALTID;" >> $sql
echo "grant create table to $PORTALTID;" >> $sql
echo "grant create trigger to $PORTALTID;" >> $sql

echo "create user $CMDBTID identified by '$CMDBTPW';" >> $sql
echo "grant create sequence to $CMDBTID;" >> $sql
echo "grant create session to $CMDBTID;" >> $sql
echo "grant create table to $CMDBTID;" >> $sql
echo "grant create trigger to $CMDBTID;" >> $sql

echo "create user $AUTHTID identified by '$AUTHTPW';" >> $sql
echo "grant create sequence to $AUTHTID;" >> $sql
echo "grant create session to $AUTHTID;" >> $sql
echo "grant create table to $AUTHTID;" >> $sql
echo "grant create trigger to $AUTHTID;" >> $sql

echo "commit;" >> $sql
echo "exit;" >> $sql
