#!bin/bash
name=$1
IFS=$'\n'

if [ -z $name ]; then
    echo "ERROR: Please, input file's name"
    exit 1
fi

if ! [ -f "$HOME/trash.log" ]; then
    echo "ERROR: .log file is not exist"
    exit 0
fi
lines=$(cat "$HOME/trash.log")
for line in $lines
do
    file_path=$(echo $line | awk 'BEGIN{FS=":"} {print $1}')
    file_link=$(echo $line | awk 'BEGIN{FS=":"} {print $2}')
#    echo $file_path, $file_link
    file_name=$(echo $file_path | awk 'BEGIN{FS="/"} {print $(NF)}')
#    echo $file_name
    if [ "$name" = "$file_name" ]; then
        echo "Do you want to restore $file_name? y/n"
	read ans
	if [ "$ans" = "y" ]; then
	    create_path="$HOME"
	    if [ -d $(dirname $file_path) ]; then
		create_path=$(dirname $file_path)
	    fi
#	    echo $create_path

	    if ! [ -f "$HOME/.trash/$file_link" ]; then
		echo "ERROR: Link doesn't exist"
		continue
	    fi

	    while [ -f "$create_path/$file_name" ]
	    do
		echo "Please, input another name:"
		read file_name
	    done
	    ln "$HOME/.trash/$file_link" "$create_path/$file_name"
	    rm "$HOME/.trash/$file_link"
	    grep -v "$line" "$HOME/trash.log" > $HOME/trash.log_temp
	    mv -f $HOME/trash.log_temp $HOME/trash.log
	    echo "File $create_path/'$file_name' was created"
	fi
    fi
done
