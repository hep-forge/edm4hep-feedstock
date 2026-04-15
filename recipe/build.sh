#!/usr/bin/env bash

# Install conda activate/deactivate scripts
mkdir -p build-scripts
cd build-scripts
cmake "$RECIPE_DIR/scripts"
cd ..

cmake -S . -B build \
    -DCMAKE_INSTALL_PREFIX="${PREFIX}" \
    -DCMAKE_BUILD_TYPE=Release \
    -DEDM4HEP_WITH_JSON=ON \
    -DBUILD_TESTING=OFF

cmake --build build --parallel "${CPU_COUNT}"
cmake --install build
