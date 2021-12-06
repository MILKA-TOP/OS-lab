#!/bin/bash
count=0
arr=()

if [ -f report2.log ]; then
rm -rf report2.log
fi
touch report2.log

while true
do
    del=$(($count%100000))
    if [ "$del" -eq "0" ]; then
	echo ${#arr[@]} >> report2.log
    fi
    arr+=(1 2 3 4 5 6 7 8 9 10)
    let "count = count + 1"
done
