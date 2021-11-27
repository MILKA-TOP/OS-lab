#!bin/bash
list=$(ps aux | awk '{print $2}' | tail -n +2)
for pid in $list
do
    link=$(readlink -f /proc/$pid/exe)
    grep_check=$(echo $link | grep '/sbin/')
    if ! [ -z $grep_check ]; then
	echo $pid, $grep_check
    fi
#    echo $pid, $link

done
