#!/bin/sh
rm -rf src pkg pump
wget -N https://aur.archlinux.org/cgit/aur.git/snapshot/pump.tar.gz
tar -xvf pum*.tar*
cd pump
patch -p0 -i ../p.patch
makepkg -d
cp *.pkg.* ../..
cd ..
