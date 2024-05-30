#!/bin/bash

INCLUDE_DIR=$(realpath "$(dirname ${BASH_SOURCE[0]})/..") 

source "$INCLUDE_DIR/common.inc"

pushd $BUILD_DIR

downloadAndUntar https://zlib.net/zlib-$ZLIB_VERSION.tar.gz zlib-$ZLIB_VERSION.tar.gz zlib-$ZLIB_VERSION
buildUsingCMake ZLib $ZLIB_VERSION zlib-$ZLIB_VERSION "-DINSTALL_PKGCONFIG_DIR=$PKG_CONFIG_PATH"

install_name_tool -id @executable_path/Plugins/libz.1.dylib lib/libz.1.3.1.dylib

popd