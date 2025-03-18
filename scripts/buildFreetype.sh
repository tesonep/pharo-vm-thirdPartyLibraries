#!/bin/bash

INCLUDE_DIR=$(realpath "$(dirname ${BASH_SOURCE[0]})/..") 

source "$INCLUDE_DIR/common.inc"

pushd $BUILD_DIR

downloadAndUntar https://files.pharo.org/vm/thirdParty-src/freetype-$FREETYPE_VERSION.tar.gz freetype-$FREETYPE_VERSION.tar.gz freetype-$FREETYPE_VERSION

#First we compile it without harfbuzz, as there is a cyclic dependency. 
#We need to compile it twice.
#First without and then when there is harfbuzz compiled against Freetype, we recompile freetype

buildUsingCMake Freetype $FREETYPE_VERSION freetype-$FREETYPE_VERSION "-DBUILD_SHARED_LIBS=ON" "-DFT_DISABLE_BROTLI=TRUE" "-DFT_DISABLE_HARFBUZZ=TRUE"

install_name_tool -id @executable_path/Plugins/libfreetype.6.dylib lib/libfreetype.6.20.2.dylib


popd