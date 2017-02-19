#!/bin/sh
rm -rf li-temp
mkdir li-temp
cd li-temp
LNK=$(curl -l ftp://mirrors.kernel.org/archlinux/core/os/x86_64/|awk '{print "/"$NF}'|awk -F "/" '{print "ftp://mirrors.kernel.org/archlinux/core/os/x86_64/"$NF}'|grep pacman)
wget $LNK

for f in pacman-*pkg.tar.xz;do
  tar -xvf $f
done
#patch -p0 -i ../pacman*.patch
cat ../pacman.conf > etc/pacman.conf

cd ..
mkdir li
cd li
for f in ../li-temp/pacman-*pkg.tar.xz;do
  tar -xvf $f
done
#patch -p0 -i ../pacman*.patch
cat ../pacman.conf > etc/pacman.conf
rm .*
cd ..
mkdir -p li/var/cache/pacman/pkg
LD_LIBRARY_PATH=li-temp/usr/lib:$LD_LIBRARY_PATH ./li-temp/usr/bin/pacman --config li-temp/etc/pacman.conf -Sy -r li
LD_LIBRARY_PATH=li-temp/usr/lib:$LD_LIBRARY_PATH ./li-temp/usr/bin/pacman --config li-temp/etc/pacman.conf -S bash pacman filesystem -r li --cachedir li/var/cache/pacman/pkg --noconfirm --force
rm -rf li-temp
cd li
#patch -p0 -i ../pacman*.patch
cd usr
rm -rf local
ln -s /usr local
cd ..
cd ..
rm li/dev/null
echo ok
