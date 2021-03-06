#!/bin/bash

#
# build all of umundo for android
#

# exit on error
set -e

ME=`basename $0`
DIR="$( cd "$( dirname "$0" )" && pwd )"
CWD=`pwd`
BUILD_DIR="/tmp/build-umundo-android"

rm -rf ${BUILD_DIR} && mkdir -p ${BUILD_DIR} &> /dev/null
cd ${BUILD_DIR}


if [ ! -d "${ANDROID_NDK}" ]; then
  echo
  echo No Android NDK at ${ANDROID_NDK}
  echo export ANDROID_NDK as the NDK root
  echo
  exit
fi
echo
echo Using Android NDK at ${ANDROID_NDK}
echo

#. ${DIR}/find-android-ndk.sh

#    ANDROID_ABI=armeabi-v7a -  specifies the target Application Binary
#      Interface (ABI). This option nearly matches to the APP_ABI variable
#      used by ndk-build tool from Android NDK.
#
#      Possible targets are:
#        "armeabi" - matches to the NDK ABI with the same name.
#           See ${ANDROID_NDK}/docs/CPU-ARCH-ABIS.html for the documentation.
#        "armeabi-v7a" - matches to the NDK ABI with the same name.
#           See ${ANDROID_NDK}/docs/CPU-ARCH-ABIS.html for the documentation.
#        "armeabi-v7a with NEON" - same as armeabi-v7a, but
#            sets NEON as floating-point unit
#        "armeabi-v7a with VFPV3" - same as armeabi-v7a, but
#            sets VFPV3 as floating-point unit (has 32 registers instead of 16).
#        "armeabi-v6 with VFP" - tuned for ARMv6 processors having VFP.
#        "x86" - matches to the NDK ABI with the same name.
#            See ${ANDROID_NDK}/docs/CPU-ARCH-ABIS.html for the documentation.
#        "mips" - matches to the NDK ABI with the same name
#            (not testes on real devices)

mkdir -p ${BUILD_DIR} &> /dev/null
cd ${BUILD_DIR}

rm -rf *
cmake ${DIR}/../../ \
-DCMAKE_TOOLCHAIN_FILE=${DIR}/../cmake/CrossCompile-Android.cmake \
-DDIST_PREPARE=ON \
-DBUILD_UMUNDO_APPS=OFF \
-DBUILD_UMUNDO_TOOLS=OFF \
-DBUILD_UMUNDO_S11N=OFF \
-DBUILD_UMUNDO_RPC=OFF \
-DBUILD_UMUNDO_UTIL=OFF \
-DBUILD_BINDINGS=ON \
-DBUILD_SHARED_LIBS=OFF \
-DBUILD_PREFER_STATIC_LIBRARIES=ON \
-DANDROID_ABI="armeabi" \
-DCMAKE_BUILD_TYPE=Debug
make -j2
make -j2 java

rm -rf *
cmake ${DIR}/../../ \
-DCMAKE_TOOLCHAIN_FILE=${DIR}/../cmake/CrossCompile-Android.cmake \
-DDIST_PREPARE=ON \
-DBUILD_UMUNDO_APPS=OFF \
-DBUILD_UMUNDO_TOOLS=OFF \
-DBUILD_UMUNDO_S11N=OFF \
-DBUILD_UMUNDO_RPC=OFF \
-DBUILD_UMUNDO_UTIL=OFF \
-DBUILD_BINDINGS=ON \
-DBUILD_SHARED_LIBS=OFF \
-DBUILD_PREFER_STATIC_LIBRARIES=ON \
-DANDROID_ABI="armeabi" \
-DCMAKE_BUILD_TYPE=Release
make -j2
make -j2 java

rm -rf *
cmake ${DIR}/../../ \
-DCMAKE_TOOLCHAIN_FILE=${DIR}/../cmake/CrossCompile-Android.cmake \
-DDIST_PREPARE=ON \
-DBUILD_UMUNDO_APPS=OFF \
-DBUILD_UMUNDO_TOOLS=OFF \
-DBUILD_UMUNDO_S11N=OFF \
-DBUILD_UMUNDO_RPC=OFF \
-DBUILD_UMUNDO_UTIL=OFF \
-DBUILD_BINDINGS=ON \
-DBUILD_SHARED_LIBS=OFF \
-DBUILD_PREFER_STATIC_LIBRARIES=ON \
-DANDROID_ABI="x86" \
-DCMAKE_BUILD_TYPE=Debug
make -j2
make -j2 java

rm -rf *
cmake ${DIR}/../../ \
-DCMAKE_TOOLCHAIN_FILE=${DIR}/../cmake/CrossCompile-Android.cmake \
-DDIST_PREPARE=ON \
-DBUILD_UMUNDO_APPS=OFF \
-DBUILD_UMUNDO_TOOLS=OFF \
-DBUILD_UMUNDO_S11N=OFF \
-DBUILD_UMUNDO_RPC=OFF \
-DBUILD_UMUNDO_UTIL=OFF \
-DBUILD_BINDINGS=ON \
-DBUILD_SHARED_LIBS=OFF \
-DBUILD_PREFER_STATIC_LIBRARIES=ON \
-DANDROID_ABI="x86" \
-DCMAKE_BUILD_TYPE=Release
make -j2
make -j2 java

# copy into umundo-pingpong example
cp ${DIR}/../../package/cross-compiled/android/umundo.jar \
   ${DIR}/../../examples/android/umundo-pingpong/libs/
# cp ${DIR}/../../package/cross-compiled/android/armv5te/lib/libumundoNativeJava_d.so \
#    ${DIR}/../../examples/android/umundo-pingpong/libs/armeabi/
cp ${DIR}/../../package/cross-compiled/android/armv5te/lib/libumundoNativeJava.so \
   ${DIR}/../../examples/android/umundo-pingpong/libs/armeabi/
# cp ${DIR}/../../package/cross-compiled/android/i686/lib/libumundoNativeJava_d.so \
#    ${DIR}/../../examples/android/umundo-pingpong/libs/x86/
cp ${DIR}/../../package/cross-compiled/android/i686/lib/libumundoNativeJava.so \
   ${DIR}/../../examples/android/umundo-pingpong/libs/x86/