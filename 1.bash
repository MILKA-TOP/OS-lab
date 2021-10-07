#!/bin/bash
if [[ $1 -ge $2 && $1 -ge $3 ]]
then echo $1
elif [[ $2 -ge $1 && $2 -ge $3 ]]
then echo $2
elif [[ $3 -ge $1 && $3 -ge $2 ]]
then echo $3
fi
