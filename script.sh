#!/bin/bash
if [ -z "$1" ]
then
    echo forgot the worker name!
    exit
fi
dir=$(ls ~ | grep 'jhPrimeminer')

if [ -z "$dir" ]
then
    apt-get update
    apt-get install -y build-essential libssl-dev openssl git libgmp3-dev
    git clone https://github.com/jtrinklein/jhPrimeminer.git
    cd jhPrimeminer
    make
fi

screen -A -d -m -S miner ~/jhPrimeminer/jhprimeminer -o http://ypool.net:10034/ -u theotherjim.$1 -p $1
status=(screen -ls | grep 'miner')
if [ -z "$status" ]
then
    echo there was a problem starting the screen session
else
    echo screen session appears to have started successfully
fi

