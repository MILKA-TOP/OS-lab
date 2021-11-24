#!bin/bash
cd /home/user
last_dir_name=$(ls | grep -E '\bBackup-([0-9][0-9][0-9][0-9])-(0[1-9]|1[0-2])-([0-2][1-9]|3[0-1])\b' | sort -nr | head -1)

if [ -z "$last_dir_name" ]; then
    echo "Backup is not exist"
    exit 1
fi

if ! [ -d "restore" ]; then
    mkdir "restore"
fi

cd "./$last_dir_name"
list=$(ls)
for file in $list
do
    grep_file=$(echo "$file" | grep -Eo '\b.([0-9][0-9][0-9][0-9])-(0[1-9]|1[0-2])-([0-2][0-9]|3[0-1])\>')

    if [ -z "$grep_file" ]; then
	cp -fR "$file" "../restore"
    fi
done
