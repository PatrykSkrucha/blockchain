#! bin/bash

#apt update && apt install -y curl ca-certificates bash && \
#    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash && \
#    export NVM_DIR="$HOME/.nvm" && \
#    . "$NVM_DIR/nvm.sh" && \
#    nvm install --lts && \
#    nvm use --lts


curl -sSfL https://raw.githubusercontent.com/ava-labs/avalanche-cli/main/scripts/install.sh | sh -s

#export PATH="/root/bin:${PATH}"

 avalanche blockchain create testnet \
	--vm /subnet-vm/subnet-vm \
  	--validator-manager-owner 0c0deba5e0000000000000000000000000000000 \
  	--genesis /genesis.json \
  	--force \
  	--sovereign=true \
  	--proof-of-authority \
  	--evm-token "4242" \
  	--warp \
  	--icm

avalanche blockchain deploy testnet --local

avalanche network start

avalanche network status

#tail -f /dev/null
sleep infinity

