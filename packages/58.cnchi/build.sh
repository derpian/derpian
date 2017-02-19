#!/bin/sh
rm -rf src pkg
makepkg --skipinteg
cp *pkg*xz ..

