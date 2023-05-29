#!/bin/bash

function compile() 

{

source ~/.bashrc && source ~/.profile

export LC_ALL=C && export USE_CCACHE=1

ccache -M 100G

export ARCH=arm64

export KBUILD_BUILD_HOST="picasso"

export KBUILD_BUILD_USER="GEMG"

git clone --depth=1 https://github.com/kdrag0n/proton-clang clang

git clone --depth=1 https://github.com/sarthakroy2002/prebuilts_gcc_linux-x86_aarch64_aarch64-linaro-7 los-4.9-64

git clone --depth=1 https://github.com/sarthakroy2002/linaro_arm-linux-gnueabihf-7.5 los-4.9-32

make O=out ARCH=arm64 rmx2189_defconfig

PATH="${PWD}/clang/bin:${PATH}:${PWD}/los-4.9-32/bin:${PATH}:${PWD}/los-4.9-64/bin:${PATH}" \

make -j$(nproc --all) O=out \

                      ARCH=arm64 \

                      CC="clang" \

                      CLANG_TRIPLE=aarch64-linux-gnu- \

                      CROSS_COMPILE="${PWD}/los-4.9-64/bin/aarch64-linux-gnu-" \

                      CROSS_COMPILE_ARM32="${PWD}/los-4.9-32/bin/arm-linux-gnueabihf-" \

                      LD=ld.lld \

                      AS=llvm-as \

		              AR=llvm-ar \			          NM=llvm-nm \

			          OBJCOPY=llvm-objcopy \

                      CONFIG_NO_ERROR_ON_MISMATCH=y

}

function zupload()

{

kk

}

compile

zupload
