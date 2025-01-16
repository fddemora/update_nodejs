#!/bin/bash
x='v22.12.0'
for i in 'node' 'npm' 'npx'; do
    rm -rf "/usr/local/bin/$i"
    ln -s "/opt/nodejs/node-$x-linux-x64/bin/$i" "/usr/local/bin/$i"
done;

