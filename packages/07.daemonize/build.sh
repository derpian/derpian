#!/bin/sh
rm -rf src pkg PKGBUILD daemonize
wget https://aur.archlinux.org/cgit/aur.git/snapshot/daemonize.tar.gz
tar -xvf daemonize.tar.gz
cd daemonize
makepkg --nodeps
cp *.pkg.* ../..
cd ..
