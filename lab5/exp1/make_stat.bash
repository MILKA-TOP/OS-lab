#!bin/bash
if [ "$1" -eq "1" ]; then
    rm -rf ./part_1
    mkdir part_1
    name="part_1"
else
    rm -rf ./part_2
    mkdir part_2
    name="part_2"
fi

mv mem_info.data ./$name/mem_info.data
cd $name
rm -rf mem_total.col
rm -rf swap_total.col
rm -rf mem_used.col
rm -rf swap_used.col
rm -rf buff.col
rm -rf avail_mem.col
cat mem_info.data | awk '{if ($1 == "MiB" && $2 == "Mem") print $4}' > mem_total.col
cat mem_info.data | awk '{if ($1 == "MiB" && $2 == "Swap:") print $3}' > swap_total.col
cat mem_info.data | awk '{if ($1 == "MiB" && $2 == "Mem") print $8}' > mem_used.col
cat mem_info.data | awk '{if ($1 == "MiB" && $2 == "Swap:") print $7}' > swap_used.col
cat mem_info.data | awk '{if ($1 == "MiB" && $2 == "Mem") print $10}' > buff.col
cat mem_info.data | awk '{if ($1 == "MiB" && $2 == "Swap:") print $9}' > avail_mem.col

