#!/bin/bash

INCLUDE_DIR=$(realpath "$(dirname ${BASH_SOURCE[0]})/..") 

source "$INCLUDE_DIR/common.inc"

pushd $BUILD_DIR

downloadAndUntar https://download.sourceforge.net/libpng/libpng-$LIBPNG_VERSION.tar.gz libpng-$LIBPNG_VERSION.tar.gz libpng-$LIBPNG_VERSION
buildUsingCMake LibPNG $LIBPNG_VERSION libpng-$LIBPNG_VERSION "-DPNG_FRAMEWORK=OFF"

install_name_tool -id @executable_path/Plugins/libpng16.16.dylib lib/libpng16.16.47.0.dylib

popd