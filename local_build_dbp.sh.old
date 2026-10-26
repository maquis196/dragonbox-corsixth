#!/bin/bash

UPSTREAM_VERSION="0.68.0"

## Possibly combine - Works on buster & bookworm
sudo apt-get install build-essential cmake git libsdl2-dev libsdl2-mixer-dev fluidsynth libfreetype6-dev lua-filesystem lua-lpeg doxygen liblua5.3-0 liblua5.3-0-dbg liblua5.3-dev squashfs-tools

# Ensure build environment - buster
sudo apt install git ffmpeg libavcodec-dev libavformat-dev libavresample-dev libavdevice-dev libavutil-dev libavfilter-dev libswscale-dev libpostproc-dev libswresample-dev libcurl4-openssl-dev libcurl4-gnutls-dev

# Ensure build environment - bookworm
sudo apt install git libcurl4-nss-dev  ffmpeg libavcodec-dev libavformat-dev libavdevice-dev libavutil-dev libavfilter-dev libswscale-dev libpostproc-dev libswresample-dev 

# Checkout upstream repo
git clone https://github.com/CorsixTH/CorsixTH.git
cd CorsixTH
git checkout v${UPSTREAM_VERSION}

# build corsixth
mkdir build && cd $_

## TODO - buster warning - needs newer cmake than on system - install from source; change command to /usr/local/bin/cmake

cmake -DUSE_SOURCE_DATADIRS=ON -DCMAKE_BUILD_TYPE=Release ..
make -j2

# Copy new binary to gamedata
cp CorsixTH/corsix-th ../../gamedata
cd ../../..

# sed version upstream

sed -i 's/Version=.*/Version=0\.68\.0/' assets/meta/default.desktop

# TODO - sed version repo with maybe r1 with counter? - manual

rm data.zip gamedata.sqfs
mksquashfs gamedata gamedata.sqfs -comp xz
cd assets; zip -r ../data.zip *; cd ..
cat gamedata.sqfs data.zip > corsixth_0.68_maquis196.dbp
