#!/bin/bash
count=0
arr=()

while true
do
    if [ "${#arr[@]}" -ge "$1" ]; then
	exit 0
    fi
    arr+=(1 2 3 4 5 6 7 8 9 10)
done
