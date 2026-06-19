#!/bin/bash

INCLUDE_DIR=$(realpath "$(dirname ${BASH_SOURCE[0]})/..") 

source "$INCLUDE_DIR/common.inc"

SRC_DIR="freetype-$FREETYPE_VERSION"
#URL="https://files.pharo.org/vm/thirdParty-src/$SRC_DIR.tar.gz"
URL="https://download.savannah.gnu.org/releases/freetype/$SRC_DIR.tar.gz"

pushd $BUILD_DIR

downloadAndUntar $URL $SRC_DIR.tar.gz $SRC_DIR

# Require HarfBuzz for improving auto-hinting of OpenType fonts.
# Load the HarfBuzz library dynamically at runtime.
# https://github.com/freetype/freetype/blob/0a0221a1347e2f1e07c395263540026e9a0aa7c7/CMakeLists.txt#L90

buildUsingCMake Freetype $FREETYPE_VERSION $SRC_DIR "-DBUILD_SHARED_LIBS=ON" "-DFT_DISABLE_BROTLI=TRUE" "-DFT_REQUIRE_HARFBUZZ=TRUE" "-DFT_DYNAMIC_HARFBUZZ=TRUE"

install_name_tool -id @executable_path/Plugins/libfreetype.6.dylib lib/libfreetype.6.20.6.dylib


popd