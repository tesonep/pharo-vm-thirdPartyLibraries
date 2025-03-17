#!/bin/bash

INCLUDE_DIR=$(realpath "$(dirname ${BASH_SOURCE[0]})/..") 

source "$INCLUDE_DIR/common.inc"

pushd $BUILD_DIR

find ./lib -type f -iname "*.dylib" | xargs otool -L | grep -v "@executable_path" | grep -v "/System/Library" | grep -v "/usr/lib"

popd