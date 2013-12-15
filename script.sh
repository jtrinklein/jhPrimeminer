#!/bin/bash
apt-get update
apt-get install -y build-essential libssl-dev openssl git libgmp3-dev
git clone https://github.com/jtrinklein/jhPrimeminer.git
cd jhPrimeminer.git
make
screen -S miner -dm ./jhprimeminer -o http://ypool.net/ -u theotherjim.$1 -p $1

