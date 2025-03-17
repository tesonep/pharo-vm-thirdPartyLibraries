#!/bin/bash

INCLUDE_DIR=$(realpath "$(dirname ${BASH_SOURCE[0]})/..") 

source "$INCLUDE_DIR/common.inc"

pushd $BUILD_DIR

# Second compilation with HARFBUZZ
buildUsingCMake Freetype $FREETYPE_VERSION freetype-$FREETYPE_VERSION "-DBUILD_SHARED_LIBS=ON" "-DFT_DISABLE_BROTLI=TRUE" "-DFT_DISABLE_HARFBUZZ=FALSE"

install_name_tool -id @executable_path/Plugins/libfreetype.6.dylib lib/libfreetype.6.20.2.dylib


popd