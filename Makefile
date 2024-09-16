BUILD_DIR = build
BIN = ${BUILD_DIR}/ProjectName

GLSLC = glslc

export VCPKG_ROOT

DEBUG_FLAGS = -DCMAKE_BUILD_TYPE=Debug
RELEASE_FLAGS = -DCMAKE_BUILD_TYPE=Release
BUILD_PROGRAM_FLAG = -G "Ninja"
TOOLCHAIN_FLAG = -DCMAKE_TOOLCHAIN_FILE="${VCPKG_ROOT}/scripts/buildsystems/vcpkg.cmake"

run: debug
	./${BIN}

debug: ${BUILD_DIR}/
	cd build && \
	cmake .. ${BUILD_PROGRAM_FLAG} ${TOOLCHAIN_FLAG} ${DEBUG_FLAGS} && \
	cmake --build .

release: ${BUILD_DIR}/
	cd build && \
	cmake .. ${BUILD_PROGRAM_FLAG} ${TOOLCHAIN_FLAG} ${RELEASE_FLAGS} && \
	cmake --build .

${BUILD_DIR}/:
	mkdir ${BUILD_DIR}