#!/bin/bash

trap 'echo "Killing PID $SERVER_PID"; kill $SERVER_PID' EXIT


args="$@"

args="$@ -p 80"

file=/data/db.json
if [ -f $file ]; then
    echo "Found db.json, trying to open"
    args="$args db.json"
fi

file=/data/file.js
if [ -f $file ]; then
    echo "Found file.js seed file, trying to open"
    args="$args file.js"
fi

json-server $args &
SERVER_PID=$!
echo "json-server started with PID $SERVER_PID"
wait
