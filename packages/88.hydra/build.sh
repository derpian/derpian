#!/bin/sh
rm -rf src pkg hydra-git
wget -N https://aur.archlinux.org/cgit/aur.git/snapshot/hydra-git.tar.gz
tar -xvf hydra*.tar*
cd hydra-git

sed -i "s/'libmariadbclient'//g" PKGBUILD
sed -i "s/'libfbclient'//g" PKGBUILD
sed -i "s/'postgresql-libs'//g" PKGBUILD
sed -i "s/'gtk2'//g" PKGBUILD

makepkg
cp *.pkg.* ../..
cd ..

