#!/usr/bin/env bash
set -euo pipefail

echo "=== Conan profile detect ==="
conan profile detect --force

echo "=== Conan install ==="
conan install . \
  -of build \
  -b missing \
  -s build_type=Release

echo "=== CMake configure via preset ==="
cmake --preset conan-release

echo "=== Build ==="
cmake --build --preset conan-release

echo "=== Test ==="
ctest --preset conan-release --output-on-failure
