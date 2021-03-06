#!/bin/bash
ip_addr=$1
ETH_DATA=/root/.ethereum
    
geth --datadir=$ETH_DATA --rpc --rpcaddr 0.0.0.0 --rpcport "8000" --rpccorsdomain "*" --gasprice 0 --networkid 9119 --unlock 0 --password <(echo -n "") js <(echo 'console.log(admin.nodeInfo.enode);') 2>/dev/null |grep enode | perl -pe "s/127.0.0.1/$ip_addr/g" | perl -pe "s/^/\"/; s/\s*$/\"/;"

