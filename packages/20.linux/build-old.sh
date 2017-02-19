#!/bin/sh
rm -rf src pkg linux-pf
wget -N https://aur.archlinux.org/cgit/aur.git/snapshot/linux-pf.tar.gz
tar -xvf linux*.tar*
cd linux-pf

sed -i "s/read answer/#read answer/g" PKGBUILD
sed -i "s/linux-pf/linux/g" PKGBUILD
sed -i "s/linux-pf/linux/g" linux.preset
sed -i "s/linux-pf/linux/g" linux.install
sed -i "s/linux-pf/linux/g" 99-linux-pf.hook

cp -v linux-pf.install linux.install
cp -v linux-pf.preset linux.preset
cp -v 99-linux-pf.hook 99-linux.hook

makepkg --skipinteg

cp *.pkg.* ../..
cd ..

