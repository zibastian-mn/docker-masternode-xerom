#!/bin/sh

nodeType=$(cat /.nodeType)
nodeId=$(/usr/bin/geth --exec "admin.nodeInfo.enode" attach ipc://./$HOME/.xerom/geth.ipc | sed 's/.*\/\([a-zA-Z0-9]\{128\}\).*/\1/')
nodeIp=$(/usr/bin/geth --exec "admin.nodeInfo.enode" attach ipc://./$HOME/.xerom/geth.ipc | sed 's/.*@\(.*\):.*/\1/')
nodePort=$(/usr/bin/geth --exec "admin.nodeInfo.enode" attach ipc://./$HOME/.xerom/geth.ipc | sed 's/.*:\([0-9]\+\).*/\1/')

echo "node Type : ${nodeType}"
echo "node IP   : ${nodeIp}"
echo "node Port : ${nodePort}"
echo "node ID   : ${nodeId}"
