#!bin/bash
K=30
N=1200000
a=0
while [ "$a" -ne "$K" ]
do
    ./newmem.bash "$N" &
    (( a++ ))
    sleep 1s
done
echo "COMPLETED..."
