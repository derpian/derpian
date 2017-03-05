#!/bin/sh
sh ../repo-clean.sh
sh ../repo-init.sh && echo okay
sh ../repo-list.sh > ../pkg32.txt
sh ../repo-xml.sh > ../pkg32.xml
echo done



