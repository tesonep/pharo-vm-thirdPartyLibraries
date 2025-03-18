#!/bin/bash

INCLUDE_DIR=$(realpath "$(dirname ${BASH_SOURCE[0]})/..") 

source "$INCLUDE_DIR/common.inc"

pushd $BUILD_DIR

downloadAndUntar https://files.pharo.org/vm/thirdParty-src/libgit2-$LIBGIT2_VERSION.tar.gz libgit2-$LIBGIT2_VERSION.tar.gz libgit2-$LIBGIT2_VERSION

buildUsingCMake libgit2 $LIBGIT2_VERSION libgit2-$LIBGIT2_VERSION -DCMAKE_SHARED_LIBRARY_NAME_WITH_VERSION=ON -DBUILD_EXAMPLES=ON

#install_name_tool -id @executable_path/Plugins/libSDL2-2.0.0.dylib lib/libSDL2-2.0.0.dylib

popd