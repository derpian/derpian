#!/bin/sh
rm -rf src pkg
makepkg --skipinteg -d
cp *pkg*xz ..

