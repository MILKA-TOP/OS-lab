#!bin/bash

format_time='+%d-%m-%Y_%H-%M-%S'
time=$(date $format_time)
mkdir ~/test && echo "catalog test was created successfull" > ~/report && touch ~/test/$time
ping -c 1 www.net_nikogo.ru || echo "ERROR " $(date $format_time) >> ~/report 
