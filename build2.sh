#download toolchains
git clone --depth=1 https://github.com/kdrag0n/proton-clang.git clang
git clone --depth=1 https://github.com/EternalX-project/aarch64-linux-gnu.git aarch64-gcc
git clone --depth=1 https://github.com/EternalX-project/arm-linux-gnueabi.git aarch32-gcc

#ubah nama kernel dan dev builder
export ARCH=arm64
export KBUILD_BUILD_USER="picasso"

#mulai mengcompile kernel
[ -d "out" ] && rm -rf out  mkdir -p out

make O=out ARCH=arm64 oppo6769_defconfig

PATH="${PWD}/clang/bin:${PATH}:${PWD}/aarch32-gcc/bin:${PATH}:${PWD}/aarch64-gcc/bin:${PATH}" \
make -j$(nproc --all) O=out \
                      ARCH=arm64 \
                      CC="clang" \
                      CLANG_TRIPLE=aarch64-linux-gnu- \
                      CROSS_COMPILE="${PWD}/aarch64-gcc/bin/aarch64-linux-gnu-" \
                      CROSS_COMPILE_ARM32="${PWD}/aarch32-gcc/bin/arm-linux-gnueabihf-" \
                      CONFIG_NO_ERROR_ON_MISMATCH=y \
V=0 2>&1 | tee log.txt
