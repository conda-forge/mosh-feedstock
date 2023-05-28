#!/bin/bash

set -euxo pipefail

export CXXFLAGS="$CXXFLAGS -std=c++17"
./autogen.sh
./configure --prefix="${PREFIX}" \
            --with-ncurses \
            --with-curses=$PREFIX \
            --with-crypto-library=openssl \
            --disable-dependency-tracking
mkdir -p include
make -j${CPU_COUNT} DEFAULT_INCLUDES="-I$(pwd)/src/include"
make install DEFAULT_INCLUDES="-I$(pwd)/src/include"
