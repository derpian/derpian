#!/bin/sh
rm -rf src pkg gigolo-git
wget -N https://aur.archlinux.org/cgit/aur.git/snapshot/gigolo-git.tar.gz
tar -xvf gigolo*.tar*
cd gigolo-git

sed -i "s/gtk2/gtk3/g" PKGBUILD
makepkg
cp *.pkg.* ../..
cd ..

