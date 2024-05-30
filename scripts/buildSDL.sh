#!/bin/bash

INCLUDE_DIR=$(realpath "$(dirname ${BASH_SOURCE[0]})/..") 

source "$INCLUDE_DIR/common.inc"

pushd $BUILD_DIR

downloadAndUntar https://libsdl.org/release/SDL2-$SDL2_VERSION.tar.gz SDL2-$SDL2_VERSION.tar.gz SDL2-$SDL2_VERSION

applyPatch SDL

buildUsingCMake SDL $SDL2_VERSION SDL2-$SDL2_VERSION

install_name_tool -id @executable_path/Plugins/libSDL2-2.0.0.dylib lib/libSDL2-2.0.0.dylib

popd