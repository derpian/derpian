#!/bin/sh
rm -rf src pkg linux-pf linux-pf-lts
#wget -N https://aur.archlinux.org/cgit/aur.git/snapshot/linux-pf.tar.gz
wget -N https://aur.archlinux.org/cgit/aur.git/snapshot/linux-pf-lts.tar.gz
tar -xvf linux*.tar*
cd linux-pf-lts

cp ../*.patch .
patch -p0 -i p.patch

sed -i "s/read answer/#read answer/g" PKGBUILD
sed -i "s/linux-pf-lts/linux/g" PKGBUILD
sed -i "s/linux-pf-lts/linux/g" linux-pf-lts.preset
sed -i "s/linux-pf-lts/linux/g" linux-pf-lts.install
sed -i "s/linux-pf-lts/linux/g" 99-linux.hook

cp -v linux-pf-lts.install linux.install
cp -v linux-pf-lts.preset linux.preset
#cp -v 99-linux-pf.hook 99-linux.hook

makepkg --skipinteg

cp *.pkg.* ../..
cd ..

