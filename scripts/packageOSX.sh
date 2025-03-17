#!/bin/bash

INCLUDE_DIR=$(realpath "$(dirname ${BASH_SOURCE[0]})/..") 

source "$INCLUDE_DIR/common.inc"

pushd $BUILD_DIR

mkdir -p packages

buildPackage SDL2 $SDL2_VERSION "libSDL*.dylib"
