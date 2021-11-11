#!bin/bash
a=$(ps -fu root | awk '{print $2 ":" $8 "\\n" }' | tail -n +2)
#a=$(ps -fu root | awk '{print $2 ":" $11 "\n"}')
echo -e $a | wc -w > pid1
echo  -e $a  >>pid1
