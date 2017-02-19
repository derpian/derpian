#!/bin/sh
rm -rf src pkg simple-fb2-reader
wget -N https://aur.archlinux.org/cgit/aur.git/snapshot/simple-fb2-reader.tar.gz
tar -xvf simple-fb2-reader*.tar*
cd simple-fb2-reader

makepkg
cp *.pkg.* ../..
cd ..

