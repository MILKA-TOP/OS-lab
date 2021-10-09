#!/bin/bash
let out
read a
out=""
while [ "$a" != "q" ]
do
out="$out$a"
read a
done
echo $out
