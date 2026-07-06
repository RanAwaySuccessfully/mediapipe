cd opencv_local
mkdir build -p
cd build
cmake -DBUILD_LIST="core,features2d" \
      -DCMAKE_C_COMPILER=clang-16 \
      -DCMAKE_CXX_COMPILER=clang++-16 \
      -DCMAKE_INSTALL_PREFIX=./install \
      -DBUILD_opencv_world=OFF \
      -DBUILD_EXAMPLES=OFF \
      -DBUILD_TESTS=OFF \
      -DBUILD_PERF_TESTS=OFF \
      -DWITH_IPP=OFF \
      -DWITH_JPEG=OFF \
      -DWITH_PNG=OFF \
      -DWITH_TIFF=OFF \
      -DWITH_WEBP=OFF \
      -DWITH_JASPER=OFF \
      -DWITH_OPENEXR=OFF \
      ..
make -j
make install