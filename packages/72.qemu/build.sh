#!/bin/sh
rm -rf src pkg qemu-minimal-git
wget -N https://aur.archlinux.org/cgit/aur.git/snapshot/qemu-minimal-git.tar.gz
tar -xvf qemu*.tar*
cd qemu-minimal-git

patch -p0 -i ../p.patch

sed -i "s/'seabios'//g" PKGBUILD

makepkg
cp *.pkg.* ../..
cd ..

