#!/bin/bash

./configure --prefix="${PREFIX}" \
            --with-ncurses \
            --with-curses=$PREFIX \
            --with-crypto-library=openssl \
            --disable-dependency-tracking
mkdir include
make version.h
cp config.h version.h include/
make -j${CPU_COUNT} DEFAULT_INCLUDES="-I$(pwd)/include"
make install DEFAULT_INCLUDES="-I$(pwd)/include"
