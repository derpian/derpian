#!/bin/sh
pacman -Q |cut -f 1 -d " " > list.txt

