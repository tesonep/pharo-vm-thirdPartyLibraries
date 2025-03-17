#!/bin/bash

INCLUDE_DIR=$(realpath "$(dirname ${BASH_SOURCE[0]})/..") 

source "$INCLUDE_DIR/common.inc"

pushd $BUILD_DIR

downloadAndUntar https://freedesktop.org/software/fontconfig/release/fontconfig-$FONTCONFIG_VERSION.tar.xz fontconfig-$FONTCONFIG_VERSION.tar.xz fontconfig-$FONTCONFIG_VERSION
buildUsingMeson Fontconfig $FONTCONFIG_VERSION fontconfig-$FONTCONFIG_VERSION -Dcache-build=disabled

install_name_tool -id "@executable_path/Plugins/libfontconfig.1.dylib" lib/libfontconfig.1.dylib

popd