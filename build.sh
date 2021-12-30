export CC=/usr/bin/gcc-10 CXX=/usr/bin/gcc-10
./autogen.sh
./configure --with-native-compilation --with-json CFLAGS="-O3 -mtune=native -march=native -fomit-frame-pointer"
make NATIVE_FULL_AOT=1
make install