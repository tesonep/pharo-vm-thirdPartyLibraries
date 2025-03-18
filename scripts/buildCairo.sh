#!/bin/bash

INCLUDE_DIR=$(realpath "$(dirname ${BASH_SOURCE[0]})/..") 

source "$INCLUDE_DIR/common.inc"

pushd $BUILD_DIR

downloadAndUntar https://files.pharo.org/vm/thirdParty-src/cairo-$CAIRO_VERSION.tar.xz cairo-$CAIRO_VERSION.tar.xz cairo-$CAIRO_VERSION
buildUsingMeson cairo $CAIRO_VERSION cairo-$CAIRO_VERSION \
  -Dglib=disabled -Dfreetype=enabled -Dfontconfig=enabled -Dlzo=disabled -Dxlib=disabled -Dxcb=disabled\
  --default-library shared

install_name_tool -id "@executable_path/Plugins/libcairo.2.dylib" lib/libcairo.2.dylib
install_name_tool -id "@executable_path/Plugins/libcairo-script-interpreter.2.dylib" lib/libcairo-script-interpreter.2.dylib
install_name_tool -id "@executable_path/Plugins/cairo/libcairo-trace.dylib" lib/cairo/libcairo-trace.dylib
install_name_tool -id "@executable_path/Plugins/cairo/libcairo-fdr.dylib" lib/cairo/libcairo-fdr.dylib

FULL_PATH_DYLIB=$(realpath lib/libcairo.2.dylib)

install_name_tool -change $FULL_PATH_DYLIB "@executable_path/Plugins/libcairo.2.dylib" lib/libcairo-script-interpreter.2.dylib

popd