#!/bin/bash

set -euo pipefail

VERSION="${1:?Usage: $0 <version - example - 0.70.1>}"
UPSTREAM_VERSION="${VERSION%-r*}"

PACKAGE_NAME="corsixth"
REVISION="${VERSION##*-r}"
P="${PACKAGE_NAME}-${UPSTREAM_VERSION}"

# Fetch sources
mkdir -p build
cd build
rm -f "v${UPSTREAM_VERSION}.tar.gz"
wget https://github.com/CorsixTH/CorsixTH/archive/refs/tags/v${UPSTREAM_VERSION}.tar.gz
tar zxpvf v${UPSTREAM_VERSION}.tar.gz
cd CorsixTH-${UPSTREAM_VERSION}

# Build # Set options
mkdir _bin
cmake -S . -B _bin/build \
    -G "Unix Makefiles" \
    -DUSE_SOURCE_DATADIRS=ON \
    -DCMAKE_BUILD_TYPE=Release

cmake --build _bin/build --parallel 2

## copy the needful to gamedata
cp _bin/build/CorsixTH/corsix-th ../gamedata
cd ..

## Configure meta file
mkdir -p assets/meta
cat > assets/meta/default.desktop <<EOF
[Desktop Entry]
Version=${UPSTREAM_VERSION}
Type=Application
Categories=Game;Simulation;
Name=CorsixTH
Exec=CorsixTH.launch
Icon=icon.png
X-DBP-Screenshot=preview1.png

[Package Entry]
Id=CorsixTH_maquis196
Name=CorsixTH
Arch=armhf
Exec=CorsixTH.launch
Version=${VERSION}
Appdata=CorsixTH
Icon=icon.png
EOF

rm -f data.zip gamedata.sqfs
mksquashfs gamedata gamedata.sqfs -comp xz

cd assets
zip -r ../data.zip *
cd ..

cat gamedata.sqfs data.zip > "${P}_maquis196.dbp"
