#! /usr/bin/env bash

docker network create --ipv6 transcendence
docker build -t testnet .
docker run -d --network transcendence testnet
