#!/bin/bash

INCLUDE_DIR=$(realpath "$(dirname ${BASH_SOURCE[0]})/..") 

source "$INCLUDE_DIR/common.inc"

pushd $BUILD_DIR

downloadAndUntar https://github.com/harfbuzz/harfbuzz/releases/download/$HARFBUZZ_VERSION/harfbuzz-$HARFBUZZ_VERSION.tar.xz harfbuzz-$HARFBUZZ_VERSION.tar.xz cairo-$HARFBUZZ_VERSION
buildUsingMeson harfbuzz $HARFBUZZ_VERSION harfbuzz-$HARFBUZZ_VERSION -Dglib=disabled -Dicu=disabled --default-library shared -Dintrospection=disabled -Dgobject=disabled

install_name_tool -id "@executable_path/Plugins/libharfbuzz.0.dylib" lib/libharfbuzz.0.dylib 

FULL_PATH_DYLIB=$(realpath lib/libharfbuzz.0.dylib)

install_name_tool -change $FULL_PATH_DYLIB "@executable_path/Plugins/libharfbuzz.0.dylib" lib/libharfbuzz-subset.0.dylib
install_name_tool -change $FULL_PATH_DYLIB "@executable_path/Plugins/libharfbuzz.0.dylib" lib/libharfbuzz-cairo.0.dylib

popd