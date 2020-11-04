export CC=/usr/bin/gcc-10 CXX=/usr/bin/gcc-10
./autogen.sh
./configure --with-nativecomp --with-json CFLAGS="-O3 -mtune=native -march=native -fomit-frame-pointer"
make -j2 NATIVE_FULL_AOT=1
make install