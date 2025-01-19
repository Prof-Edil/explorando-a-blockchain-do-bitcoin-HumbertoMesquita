# Create a 1-of-4 P2SH multisig address from the public keys in the four inputs of this tx:
#   `37d966a263350fe747f1c606b159987545844a493dd38d84b070027a895c4517`

txid="37d966a263350fe747f1c606b159987545844a493dd38d84b070027a895c4517"
tx_details=$(bitcoin-cli getrawtransaction "$txid" 1)

pubkey1=$(echo "$tx_details" | jq -r '.vin[0].txinwitness[1]')
pubkey2=$(echo "$tx_details" | jq -r '.vin[1].txinwitness[1]')
pubkey3=$(echo "$tx_details" | jq -r '.vin[2].txinwitness[1]')
pubkey4=$(echo "$tx_details" | jq -r '.vin[3].txinwitness[1]')

P2SH=$(bitcoin-cli createmultisig 1 "[\"$pubkey1\", \"$pubkey2\", \"$pubkey3\", \"$pubkey4\"]" | jq -r '.address')
echo "$P2SH"

