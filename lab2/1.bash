#!bin/bash
a=$(ps au | awk '{if ($1 == "root") {print $2 ":" $11 "\n"}}')
echo $a | wc -w > pid1
echo $a | tr ' ' '\n' >> pid1
