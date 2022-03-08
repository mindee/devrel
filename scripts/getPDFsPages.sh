#!/bin/zsh

#
# This script will list the number of pages for each PDFs in the folder
#
if [ $# -eq 1 ]
then
	for file in "$1"/*.pdf
	do
		totPage=$(pdftk "${file}" dump_data | grep NumberOfPages | sed 's/[^0-9]*//')
		print "${file}": "${totPage}"
	done
fi
