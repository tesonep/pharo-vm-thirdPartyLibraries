#!/bin/bash

INCLUDE_DIR=$(realpath "$(dirname ${BASH_SOURCE[0]})/..") 

source "$INCLUDE_DIR/common.inc"

pushd $BUILD_DIR

mkdir -p packages

buildPackage SDL2 $SDL2_VERSION "libSDL*.dylib"
buildPackage cairo $CAIRO_VERSION "libcairo.*dylib"
buildPackage fontconfig $FONTCONFIG_VERSION "libfontconfig.*dylib"
buildPackage freetype $FREETYPE_VERSION "libfreetype.*dylib"
buildPackage harfbuzz $HARFBUZZ_VERSION "libharfbuzz.*dylib"
buildPackage libgit2 $LIBGIT2_VERSION "libgit2*dylib"
buildPackage libpng $LIBPNG_VERSION "libpng*dylib"
buildPackage pixman $PIXMAN_VERSION "libpixman*dylib"
buildPackage zlib $ZLIB_VERSION "libz*dylib"
buildPackage bzip2 $BZIP2_VERSION "libbz2*dylib"