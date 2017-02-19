#!/bin/sh
cd "$1" || exit 0
rm *.pkg.tar.xz
sh ./build.sh
cd ..


