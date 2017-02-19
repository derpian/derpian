#!/bin/sh
rm -rf src pkg
makepkg --skipinteg
cp *xz ..

