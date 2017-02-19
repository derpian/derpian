pacman -S links grep aria2 wget file base-devel abs --noconfirm
#PACMAN fix
sed -i 's|exit 1 # $E_USER_ABORT|# $E_USER_ABORT|g' /usr/bin/makepkg
pacman -S lcms2 libpng bc libusb inetutils libpaper hicolor-icon-theme valgrind --noconfirm
./x.sh 01.colord; pacman -U no-colord*.pkg.* --noconfirm
./x.sh 01b.sed; pacman -U sed*.pkg.* --noconfirm
./x.sh 02.cups; pacman -U libcups*.pkg.* --noconfirm
pacman -S xorg-xrdb --noconfirm
./x.sh 03.freetype; pacman -U freetype2*.pkg.* --noconfirm
pacman -S git docbook2x python2 --noconfirm
./x.sh 04.fontconfig; pacman -U fontconfig*.pkg.* --noconfirm
pacman -S minizip --noconfirm
./x.sh 05.udis86; pacman -U udis86*.pkg.* --noconfirm
./x.sh 06.pump; pacman -U pump*.pkg.* --noconfirm
./x.sh 07.daemonize; pacman -U daemonize*.pkg.* --noconfirm
./x.sh 08.deb2targz; pacman -U deb2targz*.pkg.* --noconfirm
./x.sh 09.babl; pacman -U babl*.pkg.* --noconfirm
pacman -S libtiff giflib libxext libpng libjpeg-turbo --noconfirm
./x.sh 10.imlib2; pacman -U imlib*.pkg.* --noconfirm
pacman -S libwebp --noconfirm
pacman -S python2-mako glproto libdrm dri2proto dri3proto --noconfirm
pacman -S presentproto libxshmfence libxxf86vm libxdamage elfutils llvm libclc clang --noconfirm
pacman -S libomxil-bellagio libvdpau libglvnd --noconfirm
./x.sh 11.mesa
pacman -U vulkan*.pkg* mesa*.pkg.* opencl-mesa*.pkg.* --noconfirm
pacman -S libva-mesa-driver libgl-mesa --noconfirm
pacman -S libva libva-intel-driver libva-vdpau-driver --noconfirm
pacman -S yasm alsa-lib gsm lame libass libtheora libvorbis v4l-utils libx264 xvidcore --noconfirm
pacman -S netcdf opencore-amr openjpeg opus libmodplug libvpx x265 --noconfirm
pacman -S ladspa hardening-wrapper vid.stab --noconfirm
pacman -S speex fribidi gmp --noconfirm
./x.sh 12.ffmpeg; pacman -U ffmpeg*.pkg.* --noconfirm
pacman -S giblib libxt libxinerama --noconfirm
./x.sh 13.feh; pacman -U feh*.pkg.* --noconfirm
pacman -S ninja cairo mc bc nano opencl-headers ctags ragel --noconfirm
pacman -S libxft graphite ragel icu --noconfirm
pacman -S gobject-introspection ttf-dejavu --noconfirm

aria2c -c https://www.archlinux.org/packages/extra/any/gtk-doc/download/
tar -xvf gtk-doc* -C /
rm gtk-doc*.xz /.PKGINFO /.MTREE

./x.sh 14a.harfbuzz; pacman -U harfbuzz*.pkg.* --noconfirm
./x.sh 14b.pango; pacman -U pango*.pkg.* --noconfirm
pacman -S dbus-glib librsvg --noconfirm
pacman -S atk libxcursor libxi rest json-glib adwaita-icon-theme desktop-file-utils --noconfirm
pacman -S libxrandr libepoxy libxcomposite shared-mime-info at-spi2-atk libxkbcommon --noconfirm
#aria2c -c https://www.archlinux.org/packages/extra/any/gtk-doc/download/
#tar -xvf gtk-doc* -C /
#rm gtk-doc*.xz /.PKGINFO /.MTREE
./x.sh 15.gtk3; pacman -U gtk*.pkg.* --noconfirm

pacman -S sakura l3afpad --noconfirm
pacman -S libxss libxv recode libbsd --noconfirm
pacman -S libwnck3 intltool libxpm itstool --noconfirm
pacman -S enca xdg-utils python-docutils libass --noconfirm
./x.sh 16.mpv; pacman -U mpv*.pkg.* --noconfirm
pacman -S gst-plugins-base-libs hyphen gperf ruby cmake tmux harfbuzz-icu --noconfirm

#FIX LOCALE!!!
sed -i "s/#en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/g" /etc/locale.gen
sed -i "s/#ru_RU.UTF-8 UTF-8/ru_RU.UTF-8 UTF-8/g" /etc/locale.gen
locale-gen

./x.sh 17.webkit; pacman -U webkit2gtk*.pkg.* --noconfirm
pacman -S gtksourceview3 iso-codes vala --noconfirm
pacman -S poppler-glib nss mime-types mozilla-common imake rust autoconf2.13 zip unzip python2-virtualenv python2-pip --noconfirm

pacman -S cargo xorg-server-xvfb --noconfirm
pacman -S gtk2 --noconfirm
./x.sh 18.firefox
pacman -R gtk2 --noconfirm
pacman -U firefox*.pkg.* --noconfirm
#30 firefox
pacman -R gtk2
./x.sh 19.gnome-mpv; pacman -U gnome-mpv*.pkg.* --noconfirm
pacman -S xmlto docbook-xsl --noconfirm
./x.sh 20.linux

pacman -S gnome-common --force --noconfirm
./x.sh 21.gcr; pacman -U gcr*.pkg.* --noconfirm
pacman -S lua libraw openexr suitesparse --noconfirm
./x.sh 22.gegl; pacman -U gegl*.pkg.* --noconfirm

pacman -S lcms json-c --noconfirm
./x.sh 23.mypaint; pacman -U libmypaint*.pkg.* --noconfirm
pacman -S libgexiv2 libwmf --noconfirm
./x.sh 24.gimp; pacman -U gimp*.pkg.* --noconfirm
./x.sh 24b.azpainter; pacman -U azpainter*.pkg.* --noconfirm
./x.sh 25.geany; pacman -U geany*.pkg.* --noconfirm

pacman -S perl-archive-zip jdk8-openjdk clucene glew glu librevenge libe-book boost-libs --noconfirm
pacman -S libetonyek libexttextcat libodfgen libmspub libvisio --noconfirm
pacman -S libcdr libcmis libpagemaker libabw libwps --noconfirm
pacman -S ttf-liberation libmythes glm libmwaw liborcus --noconfirm
pacman -S junit mdds coin-or-mp cppunit lpsolve neon redland --noconfirm
pacman -S hyphen apache-ant hunspell gst-plugins-base-libs --noconfirm
pacman -S libtommath libzmf --noconfirm

./x.sh 26.libre; pacman -U libre*.pkg.* --noconfirm
./x.sh 27.ncurses; pacman -U ncurses*.pkg.* --noconfirm
pacman -S libsndfile dotconf python-xdg --noconfirm
./x.sh 28.speech; pacman -U speech*.pkg.* --noconfirm
pacman -S perl-file-basedir pciutils re2 snappy --noconfirm
pacman -S libexif perl-json python2-beautifulsoup4 python2-html5lib python2-simplejson python2-jinja python2-ply subversion imagemagick --noconfirm
./x.sh 28b.jinja; pacman -U *jinja*.pkg.* --force --noconfirm
pacman -S nodejs --noconfirm
./x.sh 29.chrome; pacman -U chrom*.pkg.* --noconfirm
pacman -R nodejs http-parser
pacman -S connman wpa_supplicant --noconfirm
./x.sh 30.connman; pacman -U connman*.pkg.* --noconfirm
pacman -S libgsf --noconfirm
./x.sh 31.goffice; pacman -U goffice*.pkg.* --noconfirm
pacman -S wv boost --noconfirm
./x.sh 32.abiword; pacman -U abiword*.pkg.* --noconfirm
pacman -S fftw openal openimageio opencolorio openshadinglanguage --noconfirm
pacman -S python3 python-requests opencollada alembic jemalloc log4cplus sdl2 ptex libspnav opensubdiv openvdb --noconfirm
./x.sh 33.blender; pacman -U blender*.pkg.* --noconfirm
./x.sh 34.geeqie; pacman -U geeqie*.pkg.* --noconfirm
pacman -S mercurial help2man --noconfirm
./x.sh 35.gplugin; pacman -U gplugin*.pkg.* --noconfirm
pacman -S mate-desktop-schemas xfce4-dev-tools mate-common --noconfirm
./x.sh 36.pluma; pacman -U pluma*.pkg.* --noconfirm
pacman -S l3afpad deadbeef zathura zathura-pdf-poppler zathura-djvu zathura-ps --noconfirm
./x.sh 37.gigolo; pacman -U gigolo*.pkg.* --noconfirm
pacman -S libgxps --noconfirm
./x.sh 38.atril; pacman -U atril*.pkg.* --noconfirm
./x.sh 39.unico; pacman -U gtk-engine*.pkg.* --noconfirm
./x.sh 40.calc; pacman -U mate-calc*.pkg.* --noconfirm
./x.sh 41.terminal; pacman -U mate-term*.pkg.* --noconfirm
pacman -S sakura appstream-glib --noconfirm
./x.sh 42.gtkhtml; pacman -U gtkhtml*.pkg.* --noconfirm
./x.sh 43.cbatticon; pacman -U cbatticon*.pkg.* --noconfirm
./x.sh 44.pnmixer; pacman -U pnmixer*.pkg.* --noconfirm
./x.sh 45.yad; pacman -U yad*.pkg.* --noconfirm
pacman -S engrampa gxmessage rdesktop procps-ng mate-icon-theme --noconfirm
pacman -S lxterminal-gtk3 lxtask-gtk3 lxrandr-gtk3 lxinput-gtk3 lxdm-gtk3 lxappearance-gtk3 --noconfirm
./x.sh 46.libfilteraudio; pacman -U libfilteraudio*.pkg.* --noconfirm
pacman -S toxcore --noconfirm
./x.sh 47.utox; pacman -U utox*.pkg.* --noconfirm
./x.sh 48.uget; pacman -U uget*.pkg.* --noconfirm
pacman -S wireshark-cli --noconfirm
./x.sh 49.wireshark; pacman -U wireshark*.pkg.* --noconfirm
pacman -S bridge-utils cifs-utils inetutils iputils apvlv --noconfirm
pacman -S libgtop --noconfirm
./x.sh 50.utils; pacman -U mate-util*.pkg.* --noconfirm
pacman -S gmime libesmtp --noconfirm
./x.sh 51.balsa; pacman -U balsa*.pkg.* --noconfirm
pacman -S polkit --noconfirm
./x.sh 52.pamac; pacman -U pamac*.pkg.* --noconfirm
pacman -S libmad flac wavpack faad2 libcue gst-libav --noconfirm
./x.sh 53.gst-plugins-base; pacman -U gst*.pkg.* --noconfirm
./x.sh 54.gst-plugins-good; pacman -U gst-plugins-good*.pkg.* --noconfirm
pacman -S libsrtp rtmpdump libmms faac vulkan-headers vulkan-icd-loader --noconfirm
./x.sh 55.gst-plugins-bad; pacman -U gst-plugins-bad*.pkg.* --noconfirm
pacman -S alsa-utils lxmenu-data --noconfirm
pacman -S protobuf protobuf-c transmission-gtk --noconfirm

#pacman -S xorg --noconfirm

pacman -S parted gptfdisk upower --noconfirm
pacman -S pyalpm python-gobject python-dbus python-cairo python-requests --noconfirm
./x.sh 56.python-parted; pacman -U python-parted*.pkg.* --noconfirm
./x.sh 57.python-bugsnag; pacman -U python-bugsnag*.pkg.* --noconfirm
./x.sh 58.cnchi; pacman -U cnchi*.pkg.* --noconfirm

#./x.sh 59.a
pacman -S haveged intel-ucode memtest86+ nbd mkinitcpio grub --noconfirm
pacman -S openssh rsync httrack nmap dnsutils whois tinyproxy openvpn --noconfirm
pacman -S e2fsprogs dosfstools syslinux sdparm ddrescue --noconfirm
pacman -S crda dialog dmraid efibootmgr gptfdisk haveged hwdetect hwinfo ntp os-prober parted efitools arch-install-scripts fakeroot mdadm --noconfirm
pacman -S linux-firmware dkms udisks2 libpwquality --noconfirm

#pacman -S linux-headers
#pacman -U linux*.pkg.* --noconfirm

#./x.sh 60.spl-utils; pacman -U spl-utils*.pkg.* --noconfirm
#./x.sh 61.spl; pacman -U spl*.pkg.* --noconfirm
#./x.sh 62.zfs-utils; pacman -U zfs-utils*.pkg.* --noconfirm
#./x.sh 63.zfs
#./x.sh 64.wl

pacman -S icon-naming-utils --noconfirm
./x.sh 65.z-user-sets
#./x.sh 66.gnome-disk; pacman -U gnome-disk-*.pkg.* --noconfirm
./x.sh 66.icons; pacman -U mate-icon*.pkg.* --noconfirm

pacman -S systemd-sysvcompat refind-efi --noconfirm
pacman -S usbutils pciutils ntfs-3g wireless_tools sshfs --noconfirm
./x.sh 67.gstreamer-vaapi; pacman -U gst*vaapi*.pkg.* --noconfirm

pacman -S ghex gtkmm3 unicode-character-database sysprof libasyncns perl-text-csv --noconfirm
./x.sh 68.gnote; pacman -U gnote*.pkg.* --noconfirm
./x.sh 69.gucharmap; pacman -U gucharmap*.pkg.* --noconfirm

./x.sh 70.gtk-vnc; pacman -U gtk-vnc*.pkg.* --noconfirm
pacman -S giggle lvm2 net-tools --noconfirm
./x.sh 71.libmikmod; pacman -U libmikmod*.pkg.* --noconfirm
pacman -S dosbox virglrenderer sdl2 --noconfirm
pacman -S jemalloc libnfs numactl ovmf usbredir vde2 xfsprogs dtc --noconfirm
./x.sh 72.qemu; pacman -U qemu*.pkg.* --noconfirm
./x.sh 73.slim; pacman -U slim*.pkg.* --noconfirm
pacman -S nmap --noconfirm
./x.sh 74.nettool; pacman -U gnome-nettool*.pkg.* --noconfirm
pacman -S lensfun pugixml osm-gps-map --noconfirm
./x.sh 75.darktable; pacman -U darktable*.pkg.* --noconfirm
pacman -S howl gsimplecal gnome-tetravex mashup nestopia qalculate-gtk racket scanmem tali usbview xarchiver xpad --noconfirm
pacman -S supertux --noconfirm
pacman -S eigen python-numpy python2-numpy --noconfirm
./x.sh 76.opencv; pacman -U opencv*.pkg.* --noconfirm
pacman -S miniupnpc tor torsocks --noconfirm
./x.sh 77.i2pd; pacman -U i2pd*.pkg.* --noconfirm
pacman -S libzip --noconfirm
./x.sh 78.fb2; pacman -U simple-fb2*.pkg.* --noconfirm
pacman -S smbclient --noconfirm
./x.sh 79.wcm; pacman -U wcmcommand*.pkg.* --noconfirm
pacman -S gnome-icon-theme --noconfirm
./x.sh 80.audacious; pacman -U audacious*.pkg.* --noconfirm
pacman -S mpg123 --noconfirm
./x.sh 81.audacious-plugins; pacman -U audacious-plugins*.pkg.* --noconfirm
#pacman -S xf86-video-amdgpu xf86-video-intel xf86-video-nouveau xf86-video-vesa xf86-video-sisusb asciidoc --noconfirm
pacman -S asciidoc lsb-release --noconfirm
./x.sh 82.filesystem; pacman -U filesystem*pkg* --noconfirm
#./x.sh 83.bwl

pacman -S terminus-font lsof --noconfirm

sh ./x.sh latte/gnome-disk; cp -v latte/gnome-disk*.pkg.* . ; pacman -U gnome-disk*.pkg.* --noconfirm
sh ./x.sh latte/libfmlt; cp -v latte/libfmlt*.pkg.* . ; pacman -U libfmlt*.pkg.* --noconfirm
sh ./x.sh latte/wm; cp -v latte/latte-wm*.pkg.* . ; pacman -U latte-wm*.pkg.* --noconfirm
sh ./x.sh latte/panel; cp -v latte/latte-panel*.pkg.* . ; pacman -U latte-panel*.pkg.* --noconfirm
sh ./x.sh latte/applets; cp -v latte/latte-applets*.pkg.* . ; pacman -U latte-applets*.pkg.* --noconfirm
sh ./x.sh latte/logout; cp -v latte/latte-logout*.pkg.* . ; pacman -U latte-logout*.pkg.* --noconfirm
sh ./x.sh latte/tuxnavigator; cp -v latte/tux-nav*.pkg.* . ; pacman -U tux-nav*.pkg.* --noconfirm
sh ./x.sh latte/virgin
cp -v latte/libpurple*.pkg.* . ; pacman -U libpurple*.pkg.* --noconfirm
cp -v latte/finch*.pkg.* . ; pacman -U finch*.pkg.* --noconfirm
cp -v latte/virgin*.pkg.* . ; pacman -U virgin*.pkg.* --noconfirm

sh ./x.sh latte/epiphany; cp -v latte/epiphany*.pkg.* . ; pacman -U epiphany*.pkg.* --noconfirm
sh ./x.sh latte/hardinfo; cp -v latte/hardinfo*.pkg.* . ; pacman -U hardinfo*.pkg.* --noconfirm
sh ./x.sh latte/parole; cp -v latte/parole*.pkg.* . ; pacman -U parole*.pkg.* --noconfirm
sh ./x.sh latte/pcmanfm; cp -v latte/pcmanfm*.pkg.* . ; pacman -U pcmanfm*.pkg.* --noconfirm
sh ./x.sh latte/qinfo; cp -v latte/qinfo*.pkg.* . ; pacman -U qinfo*.pkg.* --noconfirm


#BUILD 32 bit lib((
#pacman -R gcc dkms libreoffice-fresh-sdk clang spl spl-utils zfs-utils opencl-mesa --noconfirm
pacman -S lib32-libxml2 lib32-expat lib32-libx11 lib32-libdrm lib32-libxshmfence lib32-libxxf86vm lib32-libxdamage lib32-libelf --no-confirm
pacman -S lib32-llvm lib32-libvdpau lib32-libgcrypt lib32-libglvnd --noconfirm

printf "y\ny\ny\n"|pacman -S gcc-multilib gcc-libs-multilib
./x.sh 84.mesa32; pacman -U lib32* --noconfirm
pacman -S lib32-mesa-libgl --noconfirm
pacman -S wine --noconfirm

printf "y\ny\ny\n"|pacman -S gcc gcc-libs

pacman -S mono --noconfirm

#xorg
pacman -S xorg-server-devel resourceproto
sh ./x.sh xorg/libinput; cp -v xorg/xf86-input-libinput*.pkg.* . ; pacman -U xf86-input-libinput*.pkg.* --noconfirm
pacman -S xcmiscproto xtrans bigreqsproto wayland-protocols --noconfirm
pacman -S xf86dgaproto dmxproto libxaw libdmx xcb-util-image xcb-util-renderutil xcb-util-wm xcb-util-keysyms --noconfirm
sh ./x.sh xorg/server; cp -v xorg/xorg-server*.pkg.* . ; pacman -U xorg-server*.pkg.* --noconfirm

pacman -S libxvmc --noconfirm
sh ./x.sh xorg/xf86-video-amdgpu
sh ./x.sh xorg/xf86-video-ati
sh ./x.sh xorg/xf86-video-dummy
sh ./x.sh xorg/xf86-video-fbdev
sh ./x.sh xorg/xf86-video-intel
sh ./x.sh xorg/xf86-video-nouveau
sh ./x.sh xorg/xf86-video-openchrome
sh ./x.sh xorg/xf86-video-sisusb
sh ./x.sh xorg/xf86-video-vesa
sh ./x.sh xorg/xf86-video-vmware

sh ./x.sh xorg/libinput; cp -v xorg/xf86-input-libinput*.pkg.* . ; pacman -U xf86-input-libinput*.pkg.* --noconfirm

sh ./x.sh xorg/xf86-input-elographics
sh ./x.sh xorg/xf86-input-evdev
sh ./x.sh xorg/xf86-input-keyboard
sh ./x.sh xorg/xf86-input-libinput
sh ./x.sh xorg/xf86-input-mouse
sh ./x.sh xorg/xf86-input-synaptics
sh ./x.sh xorg/xf86-input-vmmouse
sh ./x.sh xorg/xf86-input-void

cp -v xorg/*.pkg.* .
pacman -U xf86*.pkg.* --noconfirm

pacman -S lshw ethtool tilda aircrack-ng nikto john --noconfirm

sh ./x.sh 85.libarcus; pacman -U libarcus*.pkg.* --noconfirm
sh ./x.sh 86.cura; pacman -U cura-eng*.pkg.* --noconfirm
sh ./x.sh 87.host; pacman -U repetier-host*.pkg.* --noconfirm

pacman -S afpfs-ng --noconfirm

sh ./x.sh 88.hydra; pacman -U hydra*.pkg.* --noconfirm

pacman -U linux*.pkg.* --noconfirm

pacman -S xorg-fonts-100dpi xorg-fonts-75dpi terminus-font wine --noconfirm
pacman -S nodejs php lighttpd --noconfirm
pacman -S perl-dbd-sqlite php-sqlite python2-pysqlite --noconfirm

pacman -S xorg-sessreg xorg-smproxy xorg-util-macros xorg-x11perf xorg-xauth xorg-xbacklight xorg-xcmsdb --noconfirm
pacman -S xorg-xcursorgen xorg-xdpyinfo xorg-xdriinfo xorg-xev xorg-xgamma xorg-xhost xorg-xinput xorg-xkbevd xorg-xkbutils --noconfirm
pacman -S xorg-xkill xorg-xlsatoms xorg-xlsclients xorg-xmodmap xorg-xpr xorg-xprop --noconfirm
pacman -S xorg-xrefresh xorg-xsetroot xorg-xvinfo xorg-xwd xorg-xwininfo xorg-xwud --noconfirm

