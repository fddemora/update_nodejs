#!/bin/bash

# root executable
chmod 744 ./update_node.sh

./update_node.sh
# 0 - version change
# 1 - no update
# echo $?

mv ./update_node.sh /etc/cron.daily