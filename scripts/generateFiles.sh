#!/bin/zsh

#
# generateFiles.sh <FILE_SIZE> <NUMBER_OF_FILES>
#
# Examples
# generateFiles.sh 1GB 1
# will generate one file of one gigabyte
#
# generateFiles.sh 12M 100
# will generate one hunmdred files of twelve megabytes
#

if [ $# -eq 2 ]; then
	for i in {1..$2}
	do
		truncate -s "$1" "file$i"
	done
fi
