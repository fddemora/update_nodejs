#!/bin/bash

# root executable
chmod 744 ./update_node.sh

./update_node.sh
# 0 - version change
# 1 - no update
# echo $?

if [[ ! -x /etc/cron.daily/update_node.sh ]]; then 
    cp ./update_node.sh /etc/cron.daily
else
    echo 'file already exists'
fi