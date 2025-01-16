#!/bin/bash

cd $(cd "$(dirname "$0")"; pwd -P)
x=$(node compare_versions.js)

if [[ $x == '' ]]; then
    # x is empty. No new version available.
    echo 'No updates available.'  
else
    wget "https://nodejs.org/dist/$x/node-$x-linux-x64.tar.xz"
    tar -xJf "node-$x-linux-x64.tar.xz"
    mv "node-$x-linux-x64 /opt/nodejs/"
    rm "node-$x-linux-x64.tar.xz"

    # update links
    for i in 'node' 'npm' 'npx'; do
        if [[ -h "/usr/local/bin/$i" ]]; then
            rm -f "/usr/local/bin/$i"
        fi

        # Create a nodejs folder if not present
        if [[ ! -d '/opt/nodejs' ]]; then
            mkdir /opt/nodejs
        fi
        ln -s "/opt/nodejs/node-$x-linux-x64/bin/$i" "/usr/local/bin/$i"
    done

fi



