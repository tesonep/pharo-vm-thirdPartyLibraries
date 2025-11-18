#!/bin/bash

INCLUDE_DIR=$(realpath "$(dirname ${BASH_SOURCE[0]})/..") 

source "$INCLUDE_DIR/common.inc"

pushd $BUILD_DIR

downloadAndUntar https://files.pharo.org/vm/thirdParty-src/libssh2-$LIBSSH2_VERSION.tar.gz libssh2-$LIBSSH2_VERSION.tar.gz libssh2-$LIBSSH2_VERSION

buildUsingCMake libssh2 $LIBSSH2_VERSION libssh2-$LIBSSH2_VERSION -DBUILD_EXAMPLES=OFF -DBUILD_TESTING=OFF 

install_name_tool -id @executable_path/Plugins/libssh2.1.0.1.dylib lib/libssh2.1.0.1.dylib

popd