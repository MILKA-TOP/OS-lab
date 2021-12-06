#!bin/bash

rm -rf mem_info.data
rm -rf mem_info.temp

cat full_top.data | awk '

BEGIN {
    n=0
    is_last=0
}

{
    if (n == 1 && $NF != "mem.bash" && $NF != "mem2.bash") n=0

    if (n != 0) {
	print $0
	n=n+1
    }

    if ($1 == "MiB") print $0

    if ($1 == "PID" && $2 == "USER") {
	print $0
	n=1
    }
    if (n == 6) {
	n=0
	print "\n"
    }
'} > mem_info.temp
count_lines=$(bash get_count_bad_lines.bash)
cat mem_info.temp | head -n -$count_lines > mem_info.data
rm -rf mem_info.temp

