# Which public key signed input 0 in this tx:
#   `e5969add849689854ac7f28e45628b89f7454b83e9699e551ce14b6f90c86163`

#!/bin/bash

txid="e5969add849689854ac7f28e45628b89f7454b83e9699e551ce14b6f90c86163"
transaction=$(bitcoin-cli getrawtransaction "$txid" 1)
key=$(echo "$transaction" | jq -r '.vin[0].txinwitness[2]')

echo "$key"

