#!/bin/sh
rm -rf src pkg i2pd
wget -N https://aur.archlinux.org/cgit/aur.git/snapshot/i2pd.tar.gz
tar -xvf i2pd*.tar*
cd i2pd

makepkg
cp *.pkg.* ../..
cd ..

