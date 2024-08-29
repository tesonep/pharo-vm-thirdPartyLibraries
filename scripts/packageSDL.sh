#!/bin/bash

INCLUDE_DIR=$(realpath "$(dirname ${BASH_SOURCE[0]})/..") 

source "$INCLUDE_DIR/common.inc"

pushd $BUILD_DIR

mkdir -p packages

rm -f packages/SDL2-$SDL2_VERSION.zip

pushd lib
zip -9 -y ../packages/SDL2-$SDL2_VERSION.zip libSDL*.dylib
popd

unzip -l packages/SDL2-$SDL2_VERSION.zip