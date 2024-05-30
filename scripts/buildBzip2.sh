#!/bin/bash

INCLUDE_DIR=$(realpath "$(dirname ${BASH_SOURCE[0]})/..") 

source "$INCLUDE_DIR/common.inc"

pushd $BUILD_DIR

if [ ! -d "bzip2-$BZIP2_VERSION" ]; then
	
	git clone https://github.com/libarchive/bzip2.git bzip2-$BZIP2_VERSION
	pushd bzip2-$BZIP2_VERSION
	
	#We checkout this version because it is the closest to 1.0.9 that has CMAKE
	git checkout 1ea1ac188ad4b9cb662e3f8314673c63df95a589
	popd
fi

buildUsingCMake bzip2 $BZIP2_VERSION bzip2-$BZIP2_VERSION

install_name_tool -id @executable_path/Plugins/libbz2.1.dylib lib/libbz2.$BZIP2_VERSION.dylib

popd