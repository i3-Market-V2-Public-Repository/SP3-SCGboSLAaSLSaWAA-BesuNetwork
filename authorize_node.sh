#/bin/bash

ADDRESS="$1"
NODES="$2"

[ -z "$ADDRESS" ] && echo "Set address as a parameter: $0 XXXX" && exit

if [[ $ADDRESS =~ ^0x[a-fA-F0-9]{40}$ ]]
then
  echo "Detected valid address"
else
  echo "Invalid address format. Aborting..."
  exit 1
fi

for NODE in $NODES
do  
  curl -X POST --data "{\"jsonrpc\":\"2.0\",\"method\":\"ibft_proposeValidatorVote\",\"params\":[\"$ADDRESS\",true], \"id\":1}" $NODE
done
