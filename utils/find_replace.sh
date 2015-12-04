#!/bin/sh

from=$(cat from.txt)

for fname in $(fd --type file '.*\.html$')
do
    sd -s "$from" "" "$fname";
done
