#!/bin/bash

INCLUDE_DIR=$(realpath "$(dirname ${BASH_SOURCE[0]})/..") 

source "$INCLUDE_DIR/common.inc"

function buildOpenssl(){
	
	local libName=$1
	local version=$2
	local buildDir=$libName-$version 

	mkdir -p $buildDir
	pushd $buildDir

	./Configure --prefix=$BUILD_DIR
	make 
	make install

	popd
}

pushd $BUILD_DIR

downloadAndUntar https://files.pharo.org/vm/thirdParty-src/openssl-$OPENSSL_VERSION.tar.gz openssl-$OPENSSL_VERSION.tar.gz openssl-$OPENSSL_VERSION

buildOpenssl openssl $OPENSSL_VERSION

install_name_tool -id @executable_path/Plugins/libssl.3.dylib lib/libssl.3.dylib
install_name_tool -change $BUILD_DIR/lib/libcrypto.3.dylib @executable_path/Plugins/libcrypto.3.dylib lib/libssl.3.dylib
install_name_tool -id @executable_path/Plugins/libcrypto.3.dylib lib/libcrypto.3.dylib

popd