#!/usr/bin/env bash
set -euo pipefail

conan profile detect --force

# Install deps
conan install . -s build_type=Release -of build -b missing

# Configure + Build + Test
cmake -S . -B build -G Ninja -DCMAKE_BUILD_TYPE=Release
cmake --build build
ctest --test-dir build --output-on-failure
