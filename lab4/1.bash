#!bin/bash
name=$1
pid=$$
date=$(date +%s)
trash_name="$1_$$_$date""_trash"

if [ -z "$name" ]; then
    echo "ERROR: Please, input file's name"
    exit 1
fi
if ! [ -f "./$name" ]; then
    echo "ERROR: File is not exist"
    exit 1
fi

if ! [ -d $HOME/.trash ]; then
    mkdir $HOME/.trash
fi

ln "$name" "$HOME/.trash/$trash_name"
rm "$name"

if ! [ -e $HOME/trash.log ]; then
    touch $HOME/trash.log
fi

echo -e "$PWD/$1:$trash_name"  >> $HOME/trash.log
