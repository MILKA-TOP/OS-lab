#!bin/bash
rm -rf full_top.data

./mem.bash &
./mem2.bash &
top -b -d 1 > full_top.data

bash make_good_top.bash

rm -rf dmesg.info
dmesg | grep "mem[2]*.bash" | tail -n 4 > dmesg.info
rm -rf full_top.data


############
exp_number=2
############



bash make_stat.bash $exp_number
if [ "$exp_number" -eq 1 ]; then
    path="part_1"
else
    path="part_2"
fi
mv ./report1.log ./$path/report1.log
mv ./report2.log ./$path/report2.log
mv ./dmesg.info ./$path/dmesg.info
