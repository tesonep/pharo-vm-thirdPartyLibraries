#!/bin/bash

INCLUDE_DIR=$(realpath "$(dirname ${BASH_SOURCE[0]})/..") 

source "$INCLUDE_DIR/common.inc"

pushd $BUILD_DIR

downloadAndUntar https://cairographics.org/releases/pixman-$PIXMAN_VERSION.tar.gz pixman-$PIXMAN_VERSION.tar.gz pixman-$PIXMAN_VERSION
buildUsingMeson pixman $PIXMAN_VERSION pixman-$PIXMAN_VERSION

install_name_tool -id "@executable_path/Plugins/libpixman-1.0.dylib" lib/libpixman-1.0.dylib

popd