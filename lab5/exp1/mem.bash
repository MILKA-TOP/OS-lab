#!/bin/bash
count=0
arr=()

if [ -f report.log ]; then
rm -rf report1.log
fi
touch report1.log

while true
do
    del=$(($count%100000))
    if [ "$del" -eq "0" ]; then
	echo ${#arr[@]} >> report1.log
    fi
    arr+=(1 2 3 4 5 6 7 8 9 10)
    let "count = count + 1"
done
