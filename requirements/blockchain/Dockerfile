FROM node:22-bookworm-slim

RUN apt-get update && apt-get upgrade -y && apt-get install -y \
    ca-certificates curl git && \
    rm -rf /var/lib/apt/lists/*

ENV PATH="/root/bin:${PATH}"

#COPY genesis.json /genesis.json

#COPY contracts/ /contracts/

#COPY /subnet-vm/subnet-vm /subnet-vm/subnet-vm

#RUN chmod +x /subnet-vm/subnet-vm

COPY script.sh genesis.json subnet-vm/subnet-vm /root/

COPY contracts/ /root/contracts

RUN chmod +x /root/script.sh /root/subnet-vm

ENTRYPOINT [ "/root/script.sh" ]