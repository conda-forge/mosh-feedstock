rm version

./configure --prefix="${PREFIX}" \
            --with-ncurses \
            --with-curses=$PREFIX \
            --with-crypto-library=openssl
make -j"${CPU_COUNT}"
make install
