##FROM golang:1.21 as builder

### Install dependencies and build AvalancheGo
##WORKDIR /app

##RUN apt-get update && apt-get install bash make -y git

### Clone AvalancheGo
##RUN git clone https://github.com/ava-labs/subnet-evm.git

### Build the binary
##RUN /app/subnet-evm/scripts/build.sh

## ----------------------------
## Final image
## ----------------------------
#FROM debian:bookworm

#RUN apt-get update && apt-get install -y ca-certificates curl git bash golang && rm -rf /var/lib/apt/lists/*

#RUN curl -sSfL https://raw.githubusercontent.com/ava-labs/avalanche-cli/main/scripts/install.sh | sh -s

#ENV PATH="/root/bin:${PATH}"

#RUN git clone https://github.com/ava-labs/subnet-evm.git

#RUN /subnet-evm/scripts/build.sh
## Copy avalanchego binary
##COPY --from=builder /app/subnet-evm /subnet-evm

#COPY genesis.json /genesis.json

## Expose ports
#EXPOSE 9650 9651

## Run node
##ENTRYPOINT ["avalanchego"]

#CMD ["tail", "-f", "/dev/null"]
##CMD ["avalanchego", "--chain-config-dir=/"]



#avalanche blockchain create testnet \
#  --proof-of-authority \
#  --vm /subnet-vm/subnet-vm \
#  --validator-manager-owner "0c0deba5e0000000000000000000000000000000" \
#  --genesis /genesis.json \
#  --force \
#  --sovereign=true \
#  --evm-token "4242" \
#  --warp \
#  --icm


# ----------------------------
# Stage 1: Build Subnet-EVM
# ----------------------------
#FROM golang:1.23.9 AS builder

#WORKDIR /app

#RUN apt-get update && apt-get install -y git

## Clone Subnet-EVM
#RUN git clone https://github.com/ava-labs/subnet-evm.git

## Set build variables
#ENV DEFAULT_PLUGIN_DIR=/build/plugins \
#    DEFAULT_VM_ID=srEXiWaHuhNyGwPUi444Tu47ZEDwxTWrbQiuD7FmgSAQ6X7Dy \
#    SUBNET_EVM_COMMIT=docker-build \
#    STATIC_LD_FLAGS="-w -s"

## Build the plugin manually (skip build.sh)
#RUN mkdir -p ${DEFAULT_PLUGIN_DIR} && \
#    cd subnet-evm && \
#    go build -ldflags "-X github.com/ava-labs/subnet-evm/plugin/evm.GitCommit=${SUBNET_EVM_COMMIT} ${STATIC_LD_FLAGS}" \
#    -o "${DEFAULT_PLUGIN_DIR}/${DEFAULT_VM_ID}" plugin/*.go


# ----------------------------
# Stage 2: Runtime image
# ----------------------------
FROM debian:bookworm-slim

RUN apt-get update && apt-get install -y \
    ca-certificates curl git && \
    rm -rf /var/lib/apt/lists/*

# Install Avalanche CLI
RUN curl -sSfL https://raw.githubusercontent.com/ava-labs/avalanche-cli/main/scripts/install.sh | sh -s

ENV PATH="/root/bin:${PATH}"

# Copy the compiled plugin binary
#COPY --from=builder /build/plugins /root/.avalanchego/plugins

# Add genesis file
COPY genesis.json /genesis.json

COPY /subnet-vm/subnet-vm /subnet-vm/subnet-vm

# Expose ports
EXPOSE 9650 9651

# Run AvalancheGo (you can change CMD later)
CMD ["tail", "-f", "/dev/null"]
# Or:
# CMD ["avalanchego", "--chain-config-dir=/"]
