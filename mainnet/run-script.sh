#!/bin/bash

# This file should be copied to the config directory mounted by the Docker
# container at startup. Edit this file to customize the environment variables
# controlling the infrastructure that the BCH ABC full node depends on.

# Attempt to copy from home, allowing user to manually override the default configuration:
cp /home/bitcoin/config/lotus.conf /data/lotus.conf

#CMD ["bitcoind", "-conf=/home/bitcoin/bitcoin.conf", "-datadir=/data", "-disablewallet"]
#CMD ["bitcoind", "-conf=/data/bitcoin.conf", "-datadir=/data", "-disablewallet"]

lotus-1.0.1/bin/lotusd -conf=/data/lotus.conf -datadir=/data -disablewallet
