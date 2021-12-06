#!bin/bash
tac mem_info.temp | awk '
BEGIN {
    count=0
    final=-1
}
{
    if ($1 != "PID" && $1 != "MiB" && final ==-1) final=count

    count=count+1
}
END {
    print final
}'
