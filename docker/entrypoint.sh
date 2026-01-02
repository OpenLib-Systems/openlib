#!/usr/bin/env bash
set -euo pipefail

echo "=== Conan profile detect ==="
conan profile detect --force

BUILD_DIR=build
CONFIG=Release

echo "=== Conan install ==="
conan install . \
  -of ${BUILD_DIR} \
  -b missing \
  -s build_type=${CONFIG}

TOOLCHAIN_FILE="${BUILD_DIR}/conan_toolchain.cmake"

if [ ! -f "${TOOLCHAIN_FILE}" ]; then
  echo "ERROR: Conan toolchain not found at ${TOOLCHAIN_FILE}"
  exit 1
fi

echo "=== CMake configure (Ninja) ==="
cmake -S . -B ${BUILD_DIR} \
  -G Ninja \
  -DCMAKE_BUILD_TYPE=${CONFIG} \
  -DCMAKE_TOOLCHAIN_FILE=${TOOLCHAIN_FILE}

echo "=== Build ==="
cmake --build ${BUILD_DIR}

echo "=== Test ==="
ctest --test-dir ${BUILD_DIR} --output-on-failure
