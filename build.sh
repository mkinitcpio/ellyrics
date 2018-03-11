#!/bin/bash

BUILD_DIRECTORY='./build'

if [ ! -d "$BUILD_DIRECTORY" ]; then
  mkdir ./build
fi

cd ./build
cmake -DCMAKE_INSTALL_PREFIX=/usr ../
make

if [ ! -z "$1" ] && [ $1 = "-i" ]; then
    sudo make install
fi