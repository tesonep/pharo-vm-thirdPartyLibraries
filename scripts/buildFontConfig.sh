#!/bin/bash

INCLUDE_DIR=$(realpath "$(dirname ${BASH_SOURCE[0]})/..") 

source "$INCLUDE_DIR/common.inc"

pushd $BUILD_DIR

downloadAndUntar https://files.pharo.org/vm/thirdParty-src/fontconfig-$FONTCONFIG_VERSION.tar.xz fontconfig/fontconfig-$FONTCONFIG_VERSION.tar.xz fontconfig-$FONTCONFIG_VERSION.tar.xz fontconfig-$FONTCONFIG_VERSION

applyPatch fontconfig

buildUsingMeson Fontconfig $FONTCONFIG_VERSION fontconfig-$FONTCONFIG_VERSION -Dcache-build=disabled -Diconv=disabled -Dnls=disabled

install_name_tool -id "@executable_path/Plugins/libfontconfig.1.dylib" lib/libfontconfig.1.dylib

popd