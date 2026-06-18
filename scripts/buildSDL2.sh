#!/bin/bash

INCLUDE_DIR=$(realpath "$(dirname ${BASH_SOURCE[0]})/..") 

source "$INCLUDE_DIR/common.inc"

SRC_DIR="SDL2-$SDL2_VERSION"

pushd $BUILD_DIR

downloadAndUntar https://files.pharo.org/vm/thirdParty-src/$SRC_DIR.tar.gz $SRC_DIR.tar.gz $SRC_DIR

applyPatch SDL2 $SRC_DIR

buildUsingCMake SDL2 $SDL2_VERSION $SRC_DIR -DSDL_STATIC=OFF -DSDL_TESTS=OFF

install_name_tool -id @executable_path/Plugins/libSDL2-2.0.0.dylib lib/libSDL2-2.0.0.dylib

popd