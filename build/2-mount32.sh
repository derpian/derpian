#!/bin/sh
cat /etc/resolv.conf > li32/etc/resolv.conf
mount --bind /dev li32/dev
mount --bind /proc li32/proc
mount --bind /sys li32/sys
echo ok

