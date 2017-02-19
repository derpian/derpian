#!/bin/sh

cat <<EOF
<?xml version="1.0" encoding="UTF-8"?>
<cnchi>
        <editions>
                <edition name="common" description="Packages common to all DE and base">
                        <packages>
EOF
zcat core.db | awk '/%NAME%/ { getline; print "                                <pkgname>" $1 "</pkgname>"; }'

cat <<EOF
			</packages>
		</edition>
	</editions>

	<bootloaders>
		<bootloader name="grub2">
			<pkgname>grub</pkgname>
			<pkgname>os-prober</pkgname>
		</bootloader>
		<bootloader name="systemd-boot">
			<!-- previously called gummiboot, now comes with systemd -->
		</bootloader>
		<bootloader name="refind">
			<pkgname>refind-efi</pkgname>
		</bootloader>
	</bootloaders>

</cnchi>
EOF
