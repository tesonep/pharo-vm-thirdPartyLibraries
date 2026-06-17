#!/bin/bash

INCLUDE_DIR=$(realpath "$(dirname ${BASH_SOURCE[0]})/..") 

source "$INCLUDE_DIR/common.inc"

pushd $BUILD_DIR

downloadAndUntar https://github.com/libsdl-org/SDL/releases/download/release-$SDL3_VERSION/SDL3-$SDL3_VERSION.tar.gz SDL3-$SDL3_VERSION.tar.gz SDL3-$SDL3_VERSION

applyPatch SDL3

buildUsingCMake SDL3 $SDL3_VERSION SDL3-$SDL3_VERSION -DSDL_TESTS=OFF

install_name_tool -id @executable_path/Plugins/libSDL3.0.dylib lib/libSDL3.0.dylib

popd