#FROM golang:1.23-bullseye AS builder

#WORKDIR /app

## Install Git (required to clone AvalancheGo)
#RUN apt-get update && apt-get install -y git && rm -rf /var/lib/apt/lists/*

## Clone AvalancheGo source code into the working directory
#RUN git clone https://github.com/ava-labs/avalanchego.git .

## Optionally checkout a specific version (e.g., v1.11.2)
## RUN git checkout v1.11.2

## Ensure go.mod is in place before downloading dependencies
#RUN test -f go.mod

## Download dependencies
#RUN go mod download

## Build AvalancheGo
#RUN ./scripts/build.sh


FROM debian:bookworm-slim

RUN apt-get update && apt-get upgrade -y && apt-get install -y \
    ca-certificates curl git && \
    rm -rf /var/lib/apt/lists/*

#RUN apt update && apt install -y curl ca-certificates bash && \
#    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash && \
#    export NVM_DIR="$HOME/.nvm" && \
#    . "$NVM_DIR/nvm.sh" && \
#    nvm install --lts && \
#    nvm use --lts


#RUN curl -sSfL https://raw.githubusercontent.com/ava-labs/avalanche-cli/main/scripts/install.sh | sh -s

ENV PATH="/root/bin:${PATH}"

#COPY --from=builder /app/build/avalanchego /root/avalanchego
#COPY --from=builder /app/plugins /root/plugins

COPY genesis.json /genesis.json

#COPY contracts/ /contracts/

COPY /subnet-vm/subnet-vm /subnet-vm/subnet-vm

#RUN chmod +x /subnet-vm/subnet-vm

COPY script.sh /root/script.sh

COPY .avalanche-cli/ /root/.avalanche-cli/

RUN chmod +x /root/script.sh /subnet-vm/subnet-vm

#RUN  avalanche blockchain create testnet \
#	--vm /subnet-vm/subnet-vm \
#  	--validator-manager-owner 0c0deba5e0000000000000000000000000000000 \
#  	--genesis /genesis.json \
#  	--force \
#  	--sovereign=true \
#  	--proof-of-authority \
#  	--evm-token "4242" \
#  	--warp \
#  	--icm

#RUN avalanche blockchain deploy testnet --local

##RUN avalanche network start

# Run AvalancheGo (you can change CMD later)
#CMD ["avalanche", "network", "start"]
# Or:
# CMD ["avalanchego", "--chain-config-dir=/"]

ENTRYPOINT [ "/root/script.sh" ]