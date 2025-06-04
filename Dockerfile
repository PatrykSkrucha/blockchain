FROM debian:bookworm-slim

RUN apt-get update && apt-get upgrade -y && apt-get install -y \
    ca-certificates curl git && \
    rm -rf /var/lib/apt/lists/*

RUN apt update && apt install -y curl ca-certificates bash && \
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash && \
    export NVM_DIR="$HOME/.nvm" && \
    . "$NVM_DIR/nvm.sh" && \
    nvm install --lts && \
    nvm use --lts


RUN curl -sSfL https://raw.githubusercontent.com/ava-labs/avalanche-cli/main/scripts/install.sh | sh -s

ENV PATH="/root/bin:${PATH}"

COPY genesis.json /genesis.json

COPY contracts/ /contracts/

COPY /subnet-vm/subnet-vm /subnet-vm/subnet-vm

RUN chmod +x /subnet-vm/subnet-vm

RUN  avalanche blockchain create testnet \
	--vm /subnet-vm/subnet-vm \
  	--validator-manager-owner 0c0deba5e0000000000000000000000000000000 \
  	--genesis /genesis.json \
  	--force \
  	--sovereign=true \
  	--proof-of-authority \
  	--evm-token "4242" \
  	--warp \
  	--icm

#RUN avalanche blockchain deploy testnet --local

# Run AvalancheGo (you can change CMD later)
CMD ["tail", "-f", "/dev/null"]
# Or:
# CMD ["avalanchego", "--chain-config-dir=/"]
