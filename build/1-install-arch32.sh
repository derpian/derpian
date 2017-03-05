#!/bin/sh
rm -rf li-temp
mkdir li-temp
cd li-temp
LNK=$(curl -l ftp://mirrors.kernel.org/archlinux/core/os/i686/|awk '{print "/"$NF}'|awk -F "/" '{print "ftp://mirrors.kernel.org/archlinux/core/os/i686/"$NF}'|grep pacman)
wget $LNK
LNK=$(curl -l ftp://mirrors.kernel.org/archlinux/core/os/i686/|awk '{print "/"$NF}'|awk -F "/" '{print "ftp://mirrors.kernel.org/archlinux/core/os/i686/"$NF}'|grep libarchive)
wget $LNK
LNK=$(curl -l ftp://mirrors.kernel.org/archlinux/core/os/i686/|awk '{print "/"$NF}'|awk -F "/" '{print "ftp://mirrors.kernel.org/archlinux/core/os/i686/"$NF}'|grep gpgme)
wget $LNK
LNK=$(curl -l ftp://mirrors.kernel.org/archlinux/core/os/i686/|awk '{print "/"$NF}'|awk -F "/" '{print "ftp://mirrors.kernel.org/archlinux/core/os/i686/"$NF}'|grep curl)
wget $LNK
LNK=$(curl -l ftp://mirrors.kernel.org/archlinux/core/os/i686/|awk '{print "/"$NF}'|awk -F "/" '{print "ftp://mirrors.kernel.org/archlinux/core/os/i686/"$NF}'|grep acl)
wget $LNK
LNK=$(curl -l ftp://mirrors.kernel.org/archlinux/core/os/i686/|awk '{print "/"$NF}'|awk -F "/" '{print "ftp://mirrors.kernel.org/archlinux/core/os/i686/"$NF}'|grep lz4)
wget $LNK
LNK=$(curl -l ftp://mirrors.kernel.org/archlinux/core/os/i686/|awk '{print "/"$NF}'|awk -F "/" '{print "ftp://mirrors.kernel.org/archlinux/core/os/i686/"$NF}'|grep bzip2)
wget $LNK
LNK=$(curl -l ftp://mirrors.kernel.org/archlinux/core/os/i686/|awk '{print "/"$NF}'|awk -F "/" '{print "ftp://mirrors.kernel.org/archlinux/core/os/i686/"$NF}'|grep libassuan)
wget $LNK
LNK=$(curl -l ftp://mirrors.kernel.org/archlinux/core/os/i686/|awk '{print "/"$NF}'|awk -F "/" '{print "ftp://mirrors.kernel.org/archlinux/core/os/i686/"$NF}'|grep libgpg-error)
wget $LNK
LNK=$(curl -l ftp://mirrors.kernel.org/archlinux/core/os/i686/|awk '{print "/"$NF}'|awk -F "/" '{print "ftp://mirrors.kernel.org/archlinux/core/os/i686/"$NF}'|grep libssh2)
wget $LNK
LNK=$(curl -l ftp://mirrors.kernel.org/archlinux/core/os/i686/|awk '{print "/"$NF}'|awk -F "/" '{print "ftp://mirrors.kernel.org/archlinux/core/os/i686/"$NF}'|grep libpsl)
wget $LNK

for f in pacman-*pkg.tar.xz libarchive*pkg.tar.xz libassuan*pkg.tar.xz libgpg-error*pkg.tar.xz libssh2-*pkg.tar.xz libpsl-*pkg.tar.xz gpgme*pkg.tar.xz curl*pkg.tar.xz acl-*pkg.tar.xz lz4-*pkg.tar.xz bzip2-*pkg.tar.xz;do
  echo "$f"
  z=$(echo "$f" | tr ':' '_')
  mv -v "$f" "$z"
  tar -xvf "$z"
done

#patch -p0 -i ../pacman*.patch
cat ../pacman.conf|sed '/32 bit applications on your x86_64 system/q' > etc/pacman.conf

cd ..
mkdir li32
cd li32
for f in ../li-temp/pacman-*pkg.tar.xz;do
  tar -xvf $f
done
#patch -p0 -i ../pacman*.patch
cat ../pacman.conf|sed '/32 bit applications on your x86_64 system/q' > etc/pacman.conf
sed -i "s/Architecture = auto/Architecture = i686/g" etc/pacman.conf
rm .*
cd ..
mkdir -p li32/var/cache/pacman/pkg
LD_LIBRARY_PATH=li-temp/usr/lib:$LD_LIBRARY_PATH ./li-temp/usr/bin/pacman -v --arch i686 --config li-temp/etc/pacman.conf -Sy -r li32
LD_LIBRARY_PATH=li-temp/usr/lib:$LD_LIBRARY_PATH ./li-temp/usr/bin/pacman -v --arch i686 --config li-temp/etc/pacman.conf -S bash pacman filesystem -r li32 --cachedir li32/var/cache/pacman/pkg --noconfirm --force
rm -rf li-temp
#cd li32
#patch -p0 -i ../pacman*.patch
#cd usr
#rm -rf local
#ln -s /usr local
#cd ..
#cd ..
rm li32/dev/null
echo ok
