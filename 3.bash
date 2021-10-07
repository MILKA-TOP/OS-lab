#!/bin/bash
echo "[0] - Nano"
echo "[1] - Vi"
echo "[2] - browser links"
echo "[3] -exit"
read a
case $a in
0)
nano nano_file
;;
1)
vi vi_file
;;
2)
links
;;
3)
exit
esac
