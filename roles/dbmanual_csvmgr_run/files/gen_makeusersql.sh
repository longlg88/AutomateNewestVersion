#!/bin/bash

if [ -f $PWD/automation/db_files/sql_script/make_csvmgruser.sql ]; then
    echo "skip generate"
    exit
else
    touch $PWD/automation/db_files/sql_script/make_csvmgruser.sql
fi

sql=$PWD/automation/db_files/sql_script/make_csvmgruser.sql

echo "create user $CSVMGRID identified by '$CSVMGRPW';" >> $sql
echo "grant create sequence to $CSVMGRID;" >> $sql
echo "grant create session to $CSVMGRID;" >> $sql
echo "grant create table to $CSVMGRID;" >> $sql
echo "grant create trigger to $CSVMGRID;" >> $sql

echo "commit;" >> $sql
echo "exit;" >> $sql
