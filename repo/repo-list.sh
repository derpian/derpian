#!/bin/sh

zcat core.db | awk '/%NAME%/ { getline; print $1; }'

