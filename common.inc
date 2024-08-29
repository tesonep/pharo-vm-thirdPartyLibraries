set -x 
set -e

function initEnvironment(){
	: "${INCLUDE_DIR:=$(realpath "$(dirname ${BASH_SOURCE[0]})")}"

	OS_NAME=$(uname -s)
	ARCH_NAME=$(uname -m)
	SYSTEM_NAME=$OS_NAME-$ARCH_NAME

	BUILD_CONFIG=Release

	BUILD_DIR=$(realpath "$(dirname ${BASH_SOURCE[0]})")/build

	source $INCLUDE_DIR/versions.inc

	printInitialVariables

	mkdir -p $BUILD_DIR

	PKG_CONFIG_PATH="$BUILD_DIR/lib/pkgconfig"
}

function printInitialVariables(){
	echo Build Directory: $BUILD_DIR
	echo System Name: $SYSTEM_NAME
}

function downloadAndUntar(){
	if [ ! -d "$3" ]; then
		wget --no-check-certificate -N $1
		tar xvfz $2
	fi
}

function buildUsingCMake(){
	
	local libName=$1
	local version=$2
	local src=../$3
	local buildDir=build-$libName$version 
	local additionalParams="${@:4}"

	mkdir -p $buildDir
	pushd $buildDir

	cmake --fresh -S $src -B . -DCMAKE_PREFIX_PATH=$BUILD_DIR -DCMAKE_INSTALL_PREFIX:PATH=$BUILD_DIR -DCMAKE_BUILD_TYPE=$BUILD_CONFIG $additionalParams
	cmake --build . -t install --config $BUILD_CONFIG

	popd
}

function buildUsingMeson(){
	
	local libName=$1
	local version=$2
	local src=../$3
	local buildDir=build-$libName$version 
	local additionalParams="${@:4}"

	mkdir -p $buildDir
	pushd $buildDir

	meson setup --wipe . $src --prefix $BUILD_DIR --pkg-config-path $PKG_CONFIG_PATH --buildtype $(echo "$BUILD_CONFIG" | tr '[:upper:]' '[:lower:]') $additionalParams
	
	meson compile -C .
	meson install -C .

	popd
}

function applyPatch(){

	local libName=$1
	local patch_dir=$(realpath "$(dirname ${BASH_SOURCE[0]})/patches")

	if [ -f "$patch_dir/$1-$SYSTEM_NAME.patch" ]; then
		patch -p --forward -i $patch_dir/$1-$SYSTEM_NAME.patch || true
	fi

}

initEnvironment
