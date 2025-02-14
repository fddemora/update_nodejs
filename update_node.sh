#!/bin/bash
# running as root user
# set -x

cd /tmp

# Assume that node is installed
current=$(node -v)
latest=$(curl -sL https://nodejs.org/dist/latest-v22.x/ | grep -oP 'v\d+\.\d+\.\d+' | uniq)

if [[ $current == $latest ]]; then
    exit 1
fi

wget "https://nodejs.org/dist/${latest}/node-${latest}-linux-x64.tar.xz"
tar -xJf "node-${latest}-linux-x64.tar.xz"

# Create a nodejs folder if not present
if [[ ! -d '/opt/nodejs' ]]; then
    mkdir /opt/nodejs
fi

mv node-${latest}-linux-x64 /opt/nodejs/

# update links
for i in 'node' 'npm' 'npx'; do
    if [[ -h "/usr/local/bin/$i" ]]; then
        rm -f "/usr/local/bin/$i"
    fi
    ln -s "/opt/nodejs/node-${latest}-linux-x64/bin/$i" "/usr/local/bin/$i"
done

exit 0





