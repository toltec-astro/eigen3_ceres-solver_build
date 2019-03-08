#! /bin/sh
#

root="$( cd "$(dirname "$0")" ; pwd -P )"
prefix=${1}
if [[ ! ${prefix} ]]; then
    echo "usage: $0 <prefix>"
    exit 1
fi
comp="-DCMAKE_C_COMPILER=/usr/local/opt/llvm/bin/clang \
      -DCMAKE_CXX_COMPILER=/usr/local/opt/llvm/bin/clang++ \
      -DCMAKE_INSTALL_PREFIX=${prefix}"
LDFLAGS="-L/usr/local/opt/llvm/lib -Wl,-rpath,/usr/local/opt/llvm/lib"
mkdir -p ${root}/eigen3/build
cd ${root}/eigen3/build
cmake .. ${comp}
cd _deps/eigen-build
make -j 2 && make install


mkdir -p ${root}/ceres/build
cmake .. ${comp} -DEigen3_DIR=${prefix}/share/eigen3/cmake
cd ${root}/ceres/build/_deps/ceres-build
make -j 2 && make install

