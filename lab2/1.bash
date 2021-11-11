#!bin/bash
a=$(ps -fu root | awk '{print $2 ":" $8 "\n" }')
#a=$(ps -fu root | awk '{print $2 ":" $11 "\n"}')
echo $a | wc -w > pid1
echo  -e $a  >>pid1
